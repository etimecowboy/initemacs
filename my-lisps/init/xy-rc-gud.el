;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-gud.el'
;; Time-stamp:<2011-11-24 Thu 13:39 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `gud.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun gud-break-or-remove (&optional force-remove)
  "Set/clear breakpoin."
  (interactive "P")
  (save-excursion
	(if (or force-remove
			(eq (car (fringe-bitmaps-at-pos (point))) 'breakpoint))
		(gud-remove nil)
	  (gud-break nil))))

;;;###autoload
(defun gud-enable-or-disable ()
  "Enable/disable breakpoint."
  (interactive)
  (let ((obj))
	(save-excursion
	  (move-beginning-of-line nil)
	  (dolist (overlay (overlays-in (point) (point)))
		(when (overlay-get overlay 'put-break)
		  (setq obj (overlay-get overlay 'before-string))))
	  (if (and obj (stringp obj))
		  (cond ((featurep 'gdb-ui)
				 (let* ((bptno (get-text-property 0 'gdb-bptno obj)))
				   (string-match "\\([0-9+]\\)*" bptno)
				   (gdb-enqueue-input
					(list
					 (concat gdb-server-prefix
							 (if (get-text-property 0 'gdb-enabled obj)
								 "disable "
							   "enable ")
							 (match-string 1 bptno) "\n")
					 'ignore))))
				((featurep 'gdb-mi)
				 (gud-basic-call
				  (concat
				   (if (get-text-property 0 'gdb-enabled obj)
					   "-break-disable "
					 "-break-enable ")
				   (get-text-property 0 'gdb-bptno obj))))
				(t (error "No gud-ui or gui-mi?")))
		(message "May be there isn't have a breakpoint.")))))

;;;###autoload
(defun gud-kill ()
  "Kill gdb process."
  (interactive)
  (with-current-buffer gud-comint-buffer (comint-skip-input))
  ;; (set-process-query-on-exit-flag (get-buffer-process gud-comint-buffer) nil)
  ;; (kill-buffer gud-comint-buffer))
  (dolist (buffer '(gdba gdb-stack-buffer gdb-breakpoints-buffer
                         gdb-threads-buffer gdb-inferior-io
                         gdb-registers-buffer gdb-memory-buffer
                         gdb-locals-buffer gdb-assembler-buffer))
    (when (gdb-get-buffer buffer)
      (let ((proc (get-buffer-process (gdb-get-buffer buffer))))
        (when proc (set-process-query-on-exit-flag proc nil)))
      (kill-buffer (gdb-get-buffer buffer)))))

;; ;;;###autoload
;; (defun gdb-tooltip-hook ()
;;   (gud-tooltip-mode 1)
;;   (let ((process (ignore-errors (get-buffer-process (current-buffer)))))
;; 	(when process
;; 	  (set-process-sentinel process
;; 							(lambda (proc change)
;; 							  (let ((status (process-status proc)))
;; 								(when (or (eq status 'exit)
;; 										  (eq status 'signal))
;; 								  (gud-tooltip-mode -1))))))))

;;;###autoload
(defun gud-settings ()
  "Settings of `gud.el'."
  
  ;; 退出gdb的时候关闭gdb对应的buffer
  ;;(add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit)
  ;; 显示gdb的鼠标提示
  ;; (gud-tooltip-mode 1))
  ;; 显示工具栏方便调试
  ;; (add-hook 'gdb-mode-hook
  ;; 			'(lambda ()
  ;; 			   ;; 退出gdb的时候关闭gdb对应的buffer
  ;; 			   (kill-buffer-when-shell-command-exit)
  ;; 			   (when window-system
  ;; 				 ;; 显示工具栏方便调试
  ;; 				 (toolbar-mode 1))))

  ;; 退出gdb的时候关闭gdb对应的buffer
  (add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit)
  ;; 显示工具栏方便调试
  (when window-system
	(tool-bar-mode 1))
  ;; 在一个新的 Frame 中调试
  (setq gdb-same-frame -1)
  ;; 多窗口的布局
  (setq gdb-many-windows t)
  ;; 输入输出单独用一个 Window
  (setq gdb-use-separate-io-buffer t)
  ;; 监视变量的 speedbar 自动弹出
  (setq gdb-speedbar-auto-raise t)
  ;; 显示gdb的鼠标提示
  (gud-tooltip-mode 1)

  ;; (defadvice gdb (before ecb-deactivate activate)
  ;;   "if ecb activated, deactivate it."
  ;;   (when (and (boundp 'ecb-minor-mode) ecb-minor-mode)
  ;;     (ecb-deactivate)))

  ;; (add-hook 'gdb-mode-hook 'gdb-tooltip-hook)
  (add-hook 'gdb-mode-hook (lambda () (gud-tooltip-mode 1)))
  (defadvice gud-kill-buffer-hook (after gud-tooltip-mode activate)
    "After gdb killed, disable gud-tooltip-mode."
    (gud-tooltip-mode -1))

  ;; ;; (gud-tooltip-mode t)
  ;; (define-key c-mode-base-map [f5] 'gdb)
  ;; (eval-after-load "gud"
  ;;   '(progn
  ;;      (define-key gud-minor-mode-map [f5] (lambda (&optional kill)
  ;;                                            (interactive "P")
  ;;                                            (if kill
  ;;                                                (gud-kill)
  ;;                                              (gud-go))))
  ;;      (define-key gud-minor-mode-map [S-f5] 'gud-kill)
  ;;      (define-key gud-minor-mode-map [f17] 'gud-kill) ; S-f5
  ;;      (define-key gud-minor-mode-map [f8] 'gud-print)
  ;;      (define-key gud-minor-mode-map [C-f8] 'gud-pstar)
  ;;      (define-key gud-minor-mode-map [f9] 'gud-break-or-remove)
  ;;      (define-key gud-minor-mode-map [C-f9] 'gud-enable-or-disable)
  ;;      (define-key gud-minor-mode-map [S-f9] 'gud-watch)
  ;;      (define-key gud-minor-mode-map [f10] 'gud-next)
  ;;      (define-key gud-minor-mode-map [C-f10] 'gud-until)
  ;;      (define-key gud-minor-mode-map [C-S-f10] 'gud-jump)
  ;;      (define-key gud-minor-mode-map [f11] 'gud-step)
  ;;      (define-key gud-minor-mode-map [C-f11] 'gud-finish)))
   )
    
(provide 'xy-rc-gud)
