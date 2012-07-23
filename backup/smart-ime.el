;;; 想要解决的问题：
; 如果输入法处于开启状态，会干扰emacs的使用。
;; 如C-x b和C-h t，如果输入法处于开启状态，b和t都会让输入法以为你键入了拼音，从而出现组字窗口。
;; 又如你想执行M-x version，为了输入version，你就不得不关闭输入法。


;;; 做法：
;; 启用smart-ime-mode时，前缀键被绑定到我们提供的“前缀键处理函数”上
;; 所以按下前缀键后，会唤起“前缀键处理函数”
;; 该函数做下面几件事：
;;   1) 关闭输入法编辑器
;;   2) 取消前缀键与“前缀键处理函数”的绑定，让前缀键重新绑定到keymap上
;;   3) 将前缀键重新送回事件队列，就好像我们没处理过前缀键一样
;; 然后，包括前缀键在内的按键序列像往常一样被处理
;; 命令执行完毕后，再次将前缀键绑定到我们的“前缀键处理函数”上

;; M-x即执行execute-extended-command前后，因为要输入命令名，也应临时关闭输入法



;;; 实现
;; (ime-save-and-set-status 0) 临时关闭输入法
;; (ime-restore-status) 恢复关闭前的输入法状态
;; 这两个函数的实现在.c代码中。
;; 因为GNU Emacs不支持Foreign Function Interface (FFI)，为了实现这两个函数需要修改emacs的源码



;;; 已知的问题：
;; 启用本模式后，Help菜单中的C-h都变成了<f1>。Org菜单中以C-c打头的提示都没了。
;; 这是因为C-h和C-c被绑定到了一个函数上。
;; cua-mode也有同样的问题，当高亮选中一片区域后，Org菜单也会发生一样的问题。
;; 但因为cua-mode并没有绑定C-h，所以Help菜单是好的。


;;; 其他问题
;; 由于搜狗拼音输入法中的一个bug，第一次关闭输入法将没有任何效果。
;; 此时按退格删除组字窗口中的字母，然后按C-g即可，以后就正常了。



(defvar smart-ime--state 'normal)
(defvar smart-ime--debug nil)
;; 是否启用prefix-override-keymap，若启用，前缀键将与“前缀键处理函数”绑定
(defvar smart-ime--ena-prefix-override-keymap nil)
;; prefix-override-keymap，其中将前缀键绑定到“前缀键处理函数”
(defvar smart-ime--prefix-override-keymap (make-sparse-keymap))

;; 所用keymap是否已初始化
(defvar smart-ime--keymaps-initialized nil)

;; 指明某个keymap由哪个ena变量使能
(defvar smart-ime--keymap-alist
  `(
    (smart-ime--ena-prefix-override-keymap . ,smart-ime--prefix-override-keymap)
    )
  )


;; 初始化keymap
(defun smart-ime--init-keymaps ()
  ;; 按下后需要关闭输入法的前缀键：C-x、C-c、C-h
  (define-key smart-ime--prefix-override-keymap [(control x)] 'smart-ime--prefix-override-handler)
  (define-key smart-ime--prefix-override-keymap [(control c)] 'smart-ime--prefix-override-handler)
  (define-key smart-ime--prefix-override-keymap [(control h)] 'smart-ime--prefix-override-handler)
)


;; 前缀键处理函数
(defun smart-ime--prefix-override-handler (arg)
  "前缀键处理函数"
  (interactive "P")
  (smart-ime--prefix-override-replay arg))

(defun smart-ime--prefix-override-replay (arg)
  (let* ((keys (this-command-keys))
         (i (length keys))
         (key (aref keys (1- i))))

    ;; 暂时关闭输入法（将在命令执行完毕后恢复）
    (ime-save-and-set-status 0)

    ;; 命令执行完毕时执行钩子函数smart-ime--post-command-handler
    ;; 注意，该钩子函数一旦被挂上，“前缀键处理函数”完毕后就会被唤起
    (add-hook 'post-command-hook 'smart-ime--post-command-handler)
    (setq smart-ime--state 'prefix)

    ;; 取消前缀键与“前缀键处理函数”的绑定，恢复默认状态
    (setq smart-ime--ena-prefix-override-keymap nil)

    ;; 将前缀键送回事件队列
    ;; Don't record this command
    (setq this-command last-command)
    ;; Restore the prefix arg
    (setq prefix-arg arg)
    (reset-this-command-lengths)
    ;; Push the key back on the event queue
    (setq unread-command-events (cons key unread-command-events))))


;; (defun smart-ime--pre-command-handler-1 ()
;;   )

;; (defun smart-ime--pre-command-handler ()
;;   (when smart-ime-mode
;;     (condition-case nil
;;         (smart-ime--pre-command-handler-1)

;;         ;; (progn (add-log-entry "pre command %d\n" pre-count)
;;         ;;        (setq pre-count (1+ pre-count)))

;;       (error nil))))


;; 命令执行结束后执行的动作
(defun smart-ime--post-command-handler-1 ()
  (cond ((eq smart-ime--state 'prefix)
         (setq smart-ime--state 'sequence))


        ((eq smart-ime--state 'sequence)
         ;; 恢复输入法状态
         (ime-restore-status)
         ;; 恢复前缀键与“前缀键处理函数”的绑定
         (setq smart-ime--ena-prefix-override-keymap t)
         (setq smart-ime--state 'normal)

         (remove-hook 'post-command-hook 'smart-ime--post-command-handler)))

        (t
         (error "error state")))


(defun smart-ime--post-command-handler ()
  (when smart-ime-mode
    (condition-case nil
        (smart-ime--post-command-handler-1)
      ;; (progn (add-log-entry "post command %d\n" post-count)
      ;;        (setq post-count (1+ post-count)))
      (error nil))))



(defadvice execute-extended-command (around manage-ime
                                            (prefixarg))
  "Ignore case in `foo'."
  ;; 暂时关闭输入法（将在命令执行完毕后恢复）
  (ime-save-and-set-status 0)

  ad-do-it

  ;; 恢复输入法状态
  (ime-restore-status)
)


(define-minor-mode smart-ime-mode
  "Toggle Smart IME mode."
  :init-value nil
  :lighter " SmartIME"
  :global t

  (unless smart-ime--keymaps-initialized
    (smart-ime--init-keymaps)
    (setq smart-ime--keymaps-initialized t))

  ;; (if smart-ime-mode
  ;;     (progn
  ;;       (add-hook 'pre-command-hook 'smart-ime--pre-command-handler)
  ;;       (add-hook 'post-command-hook 'smart-ime--post-command-handler))
  ;;   (remove-hook 'pre-command-hook 'smart-ime--pre-command-handler)
  ;;   (remove-hook 'post-command-hook 'smart-ime--post-command-handler))

  (unless smart-ime-mode
    (remove-hook 'post-command-hook 'smart-ime--post-command-handler))


  (if (not smart-ime-mode)
      (setq emulation-mode-map-alists (delq 'smart-ime--keymap-alist emulation-mode-map-alists))
    (add-to-ordered-list 'emulation-mode-map-alists 'smart-ime--keymap-alist 400)
    (setq smart-ime--ena-prefix-override-keymap t))

  (if smart-ime-mode
      (progn
        (ad-enable-advice 'execute-extended-command 'around 'manage-ime))
    (ad-disable-advice 'execute-extended-command 'around 'manage-ime))
  (ad-activate 'execute-extended-command) ; 无论enable还是disable，都需要调用一次activate
  ;;(ad-deactivate 'execute-extended-command)


  )



;;; Announce

(provide 'smart-ime)



(defun smart-ime-debug ()
  "Toggle SMART-IME debugging."
  (interactive)
  (setq smart-ime--debug (not smart-ime--debug)))
