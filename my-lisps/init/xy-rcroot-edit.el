;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-edit.el'
;; Time-stamp:<2011-02-06 Sun 01:52 xin on p6t>
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Some basic edting settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs找不到合适的模式时，缺省使用text-mode
(setq default-major-mode 'text-mode)
;; 不用TAB字符来缩进，使用空格
(setq-default indent-tabs-mode -1)
(setq default-tab-width 4)
(setq tab-stop-list nil)
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x tab-width) tab-stop-list)))
;; 先格式化再补全
(setq tab-always-indent 'complete)
;; 自动的在文件末增加一新行
(setq require-final-newline t)
;; outline-mode, structural editing
;; (eal-define-keys
;;  'outline-mode-map
;;  `(("C-M-h"   outline-mark-subtree)
;;    ("C-c u"   outline-up-heading)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Fast point move
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; recent-jump, 返回到最近去过的地方
;; (require 'recent-jump)
;; (require 'recent-jump-small)
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

;;---------------------------------------------------------------

;; 模拟vi的点(.)命令
;; (try-require 'dot-mode)
;; (autoload 'dot-mode "dot-mode" nil t) ; vi `.' command emulation
;; (global-set-key [(control ?.)]
;;                 (lambda ()
;;                   (interactive) (dot-mode 1)
;;                   (message "Dot mode activated.")))

;;---------------------------------------------------------------

;; Incremental search
(define-key-list
  isearch-mode-map
  `(("M-i" isearch-query-replace-current)
    ("M-k" isearch-clean)
    ("M-g" isearch-cancel)
    ("M-u" isearch-toggle-word)
    ("M-y" isearch-yank-line)
    ("C-y" isearch-yank-kill)
    ("M-h" isearch-del-char)
    ("M-H" ,(if is-after-emacs-23 isearch-help-map 
              'isearch-mode-help))))
;; (define-key-list
;;   global-map `(("C-x M-s" isearch-forward-cur-word)))

(eval-after-load "isearch"
  `(progn
     (isearch-face-settings)
     (isearch-settings)))

;;-------------------------------------------------------------

;; my own replace face
(eval-after-load "replace" `(replace-face-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Fast select regions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
(define-key global-map (kbd "C-x M-l") 'wcy-mark-some-thing-at-point)

;;--------------------------------------------------------------

;; 矩形区域操作
(eal-define-keys-commonly
  global-map
  `(("C-x \\"  rm-mark-command)
   ;; ("M-w"     copy-region)
    ))
(am-def-active-fun rm-mark-active rm-mark-active)

;;---------------------------------------------------------------

;; CUA model settings
;; CUA的矩阵区域操作特别方便
;; (setq use-cua t)
;; (eval-after-load "cua-base"
;;   `(cua-settings))

;;---------------------------------------------------------------

(global-set-key (kbd "M-|") 'ywb-hippie-expand-filename)
(global-set-key (kbd "C-x M-M") 'switch-major-mode)
(global-set-key (kbd "M-;") 'qiang-comment-dwim-line)
(global-set-key (kbd "M-k") 'qiang-copy-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Graphic text tools
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; table, 可以“所见即所得”的编辑一个文本模式的表格
(if is-before-emacs-21 (require 'table "table-for-21"))

;;----------------------------------------------------------------

;; artist, 非常强大的文本画图的工具
;; (global-set-kbd "C-x M-A" 'artist-mode)
(eal-define-keys
 'artist-mode-map
 `(("C-c l"   artist-select-op-line)
   ("C-c r"   artist-select-op-rectangle)
   ("C-c M-c" artist-select-op-copy-rectangle)
   ("C-c M-w" artist-select-op-cut-rectangle)
   ("C-c M-p" artist-select-op-paste)))
(eval-after-load "artist" `(artist-settings))

;;------------------------------------------------------------------

;; palette: provides a general color palette that you can use to 
;; examine color properties or choose colors. 
;; REF: Emacs配色的超级武器：Icicles，Color Palette和DoReMi
;;      http://emacser.com/icicles-doremi-palette.htm

;;------------------------------------------------------------------

;; ahei 的按键设置

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

;;------------------------------------------------------------------

(provide 'xy-rcroot-edit)
