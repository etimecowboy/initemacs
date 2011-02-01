;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-edit.el'
;; Time-stamp:<2011-01-31 Mon 11:01 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My assistant editing tools and settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; 缩进设置
;; 不用TAB字符来indent，使用空格
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list nil)
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x tab-width) tab-stop-list)))
;; 先格式化再补全
(setq tab-always-indent 'complete)
;; 自动的在文件末增加一新行
(setq require-final-newline t)

;;--------------------------------------------------------------------

;; ahei 的设置

(define-key minibuffer-local-completion-map (kbd "C-k") 'kill-line)

;; (apply-args-list-to-fun
;;  'def-action-on-area-command
;;  `((copy-function        'copy-region   'mark-function     "Copy function.")
;;    (kill-function        'kill-region   'mark-function     "Kill function.")
;;    (indent-function      'indent-region 'mark-function     "Indent function.")
;;    (indent-paragraph     'indent-region 'mark-paragraph    "Indent paragraph.")
;;    (copy-whole-buffer    'copy-region   'mark-whole-buffer "Copy whole buffer.")
;;    (kill-whole-buffer    'kill-region   'mark-whole-buffer "Kill whole buffer.")
;;    (indent-whole-buffer  'indent-region 'mark-whole-buffer "Indent whole buffer.")))

;; (eal-define-keys
;;  (append
;;   makefile-mode-map-list
;;   `(c-mode-base-map emacs-lisp-mode-map lisp-interaction-mode-map
;;     conf-javaprop-mode-map html-mode-map tcl-mode-map
;;     autoconf-mode-map perl-mode-map nxml-mode-map python-mode-map))
;;  `(("C-c C-c" comment)))

(eal-define-keys-commonly
 global-map
 `(
   ;;    ("M-k" kill-whole-paragraph)
   ;;    ("M-C-k" kill-paragraph)
   ;;    ("M-C" copy-whole-paragraph)
   ;;    ("C-x c" copy-whole-buffer)
   ;;    ("C-x C" kill-whole-buffer)
   ;;    ("M-W" which-copy)
   ;;    ("M-w" smart-copy)
   ;;    ("C-x M-w" insert-cur-line)
   ;;    ("C-x M-W" insert-cur-sexp)
   ("C-M-w" copy-sentence)
   ;;    ;; 删除整行
   ;;    ("M-K" kill-line)
   ;;    ("C-k" smart-kill)              
   ;;    ("C-\\" delete-indentation)
   ("C-x M-m" mark-invisible-region)
   ("M-U" del-to-begin)
   ("C-^" case-trans)
   ;;    ("C-6" case-trans)
   ("C-w" backward-kill-word-or-kill-region)
   ;;    ("C-x S" mark-whole-sexp)
   ;;    ("C-x W" kill-whole-sexp)
   ;;    ("C-x w" copy-sexp)
   ("M-D" my-kill-word)
   ;;    ("C-x TAB" indent-whole-buffer)
   ;;    ("C-h" c-electric-backspace-kill)
   ;;    ,(if window-system '("C-z" undo))
   ;;    ("M-Y" redo)
   ;;    ("M-m" beginning-of-line-text)
   ("C-M-\\" smart-indent)
   ("M-q" fill-paragraph-justify)
   ("<escape> SPC" just-one-space)
   ("C-a" smart-home)
   ("C-M-a" mark-whole-buffer)
   ("M-#" set-mark-command)
   ))

;; (eal-define-keys
;;  'c-mode-base-map
;;  `(("C-c f" copy-function)
;;    ("C-c F" kill-function)
;;    ("C-c C" comment-function)
;;    ("C-M-h" mark-function)))

;; (eal-define-keys
;;  `(emacs-lisp-mode-map lisp-interaction-mode-map)
;;  `(("C-M-h" mark-function)
;;    ("C-c D"  edebug-defun)
;;    ("C-c C-d" eval-defun)
;;    ("C-c B"  eval-buffer)
;;    ("C-c f" copy-function)
;;    ("C-c F" kill-function)
;;    ("C-c C-q" indent-function)
;;    ("C-c C" comment-function)))

;;-------------------------------------------------------------------

;; 显示ascii表

;; (try-require 'ascii)
;; (autoload 'ascii-on        "ascii" "Turn on ASCII code display."   t)
;; (autoload 'ascii-off       "ascii" "Turn off ASCII code display."  t)
;; (autoload 'ascii-display   "ascii" "Toggle ASCII code display."    t)
;; (autoload 'ascii-customize "ascii" "Customize ASCII code display." t)

;;------------------------------------------------------------------

;; recent-jump settings
;; 返回到最近去过的地方

;; (try-require 'recent-jump)
;; (try-require 'recent-jump-small)

;; (setq rj-mode-line-format nil)
;; (setq rjs-mode-line-format nil)

;;(recent-jump-mode 1)
(recent-jump-small-mode 1)

(eal-define-keys-commonly
 global-map
 `(;; ("M-,"   recent-jump-backward)
   ;; ("M-."   recent-jump-forward)
   ;; ("C-x M-," recent-jump-small-backward)
   ;; ("C-x M-." recent-jump-small-forward)))
   ("M-,"   recent-jump-small-backward)
   ("M-."   recent-jump-small-forward)))
;;------------------------------------------------------------------

;; 统计命令使用频率

;; (try-require 'command-frequence)
;; (autoload 'command-frequence "command-frequence" "命令频率统计" t)

;;------------------------------------------------------------------

;; vi 相关设置

;; 模拟vi的点(.)命令
;; (try-require 'dot-mode)
;; (autoload 'dot-mode "dot-mode" nil t) ; vi `.' command emulation
;; (global-set-key [(control ?.)]
;;                 (lambda ()
;;                   (interactive) (dot-mode 1)
;;                   (message "Dot mode activated.")))

;;-------------------------------------------------------------------

;; 以另一用户编辑文件, 或者编辑远程主机文件
;; ;;;###autoload
;; (defun tramp-settings ()
;;   "Settings of `tramp'."
;; ;;  (setq tramp-default-method "sudo")
(setq tramp-persistency-file-name (concat my-var-path "/tramp"))
;; )

;; (eval-after-load "tramp" `(tramp-settings))

;;-------------------------------------------------------------------

;; Incremental search settings

;; (define-key-list
;;   isearch-mode-map
;;   `(("M-i" isearch-query-replace-current)
;;     ("M-k" isearch-clean)
;;     ("M-g" isearch-cancel)
;;     ("M-u" isearch-toggle-word)
;;     ("M-y" isearch-yank-line)
;;     ("C-y" isearch-yank-kill)
;;     ("M-h" isearch-del-char)
;;     ("M-H" ,(if is-after-emacs-23 isearch-help-map 
;;               'isearch-mode-help))))

;; (define-key-list
;;   global-map `(("C-x M-s" isearch-forward-cur-word)))

(eval-after-load "isearch"
  `(progn
     (isearch-face-settings)
     (isearch-settings)))

;;---------------------------------------------------------------------

;; my own replace face

;; (defun replace-face-settings ()
;;   "Face settings for `replace'."
;;   (custom-set-faces
;;    '(match
;;      ((((class color) (min-colors 88) (background light))
;;        :background "yellow1")
;;       (((class color) (min-colors 88) (background dark))
;;        :background "RoyalBlue3" :foreground "cyan")
;;       (((class color) (min-colors 8) (background light))
;;        :background "yellow" :foreground "black")
;;       (((class color) (min-colors 8) (background dark))
;;        :background "blue" :foreground "white")
;;       (((type tty) (class mono))
;;        :inverse-video t)
;;       (t :background "gray")))))

;; (eval-after-load "replace"
;;   `(replace-face-settings))

;;---------------------------------------------------------------------

;; 用渐变颜色显示你最近的修改
;; http://emacser.com/highlight-tail.htm
;; 与semantic冲突，启动了它后，打开大文件的时候，会发现buffer大范围的刷屏

;; (try-require 'highlight-tail)
;; (highlight-tail-mode 1)

;;---------------------------------------------------------------------

;; outline-mode

;; (eal-define-keys
;;  'outline-mode-map
;;  `(("C-M-h"   outline-mark-subtree)
;;    ("C-c u"   outline-up-heading)))

;; (defun outline-settings ()
;;   "Settings for `outline'.")

;; (eval-after-load "outline"
;;   `(outline-settings))

;;---------------------------------------------------------------------

(transient-mark-mode 1)

(apply-args-list-to-fun
 'def-remember-command
 `("previous-line" "next-line"
   "am-forward-word-or-to-word" "forward-word" "backward-word"
   "forward-char" "backward-char"))

;; (define-key-list
;;   global-map
;;   `(("C-n"     next-line-remember)
;;     ("C-p"     previous-line-remember)
;;     ("C-f"     forward-char-remember)
;;     ("C-b"     backward-char-remember)
;;     ("M-f"     am-forward-word-or-to-word-remember)
;;     ("M-b"     backward-word-remember)
;;     ("M-F"     forward-word-remember)
;;     ("C-x C-n" mark-and-next-line)
;;     ("C-x C-p" mark-and-previous-line)
;;     ("C-x M->" mark-and-end-of-buffer)
;;     ("C-x M-<" mark-and-beginning-of-buffer)))

;; (if window-system
;;     (define-key global-map (kbd "C-2") 'set-mark-command))

;; (try-require 'mouse)

(define-key global-map (kbd "C-x M-l") 'wcy-mark-some-thing-at-point)


;;---------------------------------------------------------------------

;; 矩形区域操作

(eal-define-keys-commonly
 global-map
 `(("C-x \\"  rm-mark-command)
   ;; ("M-w"     copy-region)
   ))

;; ;;;###autoload
;; (defun rect-mark-settings ()
;;   "Settings of `rect-mark'.")

(am-def-active-fun rm-mark-active rm-mark-active)

;; (eval-after-load "rect-mark"
;;   `(rect-mark-settings))

;;----------------------------------------------------------------------

;; CUA model settings
;; CUA的矩阵区域操作特别方便

;; (setq use-cua t)

;; ;;;###autoload
;; (defun cua-settings ()
;;   "settings for `cua'."
;;   (setq cua-rectangle-mark-key "")

;;   (when is-after-emacs-23
;;     (setq cua-remap-control-z nil)
;;     (setq cua-remap-control-v nil))

;;   (apply-args-list-to-fun
;;    'def-mark-move-command
;;    `("cua-resize-rectangle-down"
;;      "cua-resize-rectangle-up"
;;      "cua-resize-rectangle-right"
;;      "cua-resize-rectangle-left"
;;      "cua-resize-rectangle-top"
;;      "cua-resize-rectangle-page-up"
;;      "cua-resize-rectangle-page-down"
;;      "cua-resize-rectangle-bot"))

;;   (unless is-after-emacs-23
;;     (define-key cua--cua-keys-keymap [(control z)] nil)
;;     (define-key cua--cua-keys-keymap [(control v)] nil)
;;     (define-key cua--cua-keys-keymap [(meta v)] nil))

;;   (autoload 'cua--init-rectangles "cua-rect")

;;   (cua--init-rectangles)

;;   (eal-define-keys
;;    'cua--rectangle-keymap
;;    `(("M-f"     forward-word-remember)
;;      ("M-b"     backward-word-remember)
;;      ("C-c C-f" cua-fill-char-rectangle)
;;      ("'"       cua-insert-char-rectangle)
;;      ("<right>" cua-resize-rectangle-right)
;;      ("<left>"  cua-resize-rectangle-left)
;;      ("<down"   cua-resize-rectangle-down)
;;      ("<up>"    cua-resize-rectangle-up))))

;; (eval-after-load "cua-base"
;;   `(cua-settings))

;;------------------------------------------------------------------

;; (global-set-key (kbd "M-|") 'ywb-hippie-expand-filename)
(global-set-key (kbd "C-x M-M") 'switch-major-mode)
(global-set-key (kbd "M-;") 'qiang-comment-dwim-line)
(global-set-key (kbd "M-k") 'qiang-copy-line)

;;--------------------------------------------------------------------------------

;; undo and redo
;; (try-require 'redo)
(global-set-key (kbd "M-_") 'redo)
;; undo is C-_ or C-/

;;------------------------------------------------------------------

(provide 'xy-rcroot-edit)
