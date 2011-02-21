;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-complete.el'
;; Time-stamp:<2011-02-21 Mon 04:26 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Various abbrevations and auto-completion
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Mini buffer auto complete
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ido, interactively do things with buffers and files
;; NOTE: From Emacs-22 it is a part of Emacs
;; (if is-before-emacs-21
;;     (require 'ido "ido-for-21"))
;; (ido-mode 1)
;; (global-set-key (kbd "C-x C-f") 'ido-find-file)
;; (let ((map
;;        (unless is-before-emacs-21
;;          (setq ido-mode-map ido-completion-map)))))
;; (eal-define-keys-commonly
;;  map 
;;  `(("M-."   ido-next-match-dir)
;;    ("M-,"   ido-prev-match-dir)
;;    ("C-h"   ido-delete-backward-updir)
;;    ("M-h"   ido-up-directory)
;;    ("M-H"   ido-up-directory-clean-text)
;;    ("C-M-h" ido-goto-home)
;;    ("C-r"   ido-goto-root)
;;    ("C-u"   ido-clean-text)
;;    ("M-b"   backward-word)
;;    ("C-w"   ido-delete-backward-word-updir)
;;    ("C-v"   ido-enter-svn-status-hide)
;;    ("C-n"   ido-next-match)
;;    ("C-p"   ido-prev-match)))
;; (eval-after-load 'ido
;;   `(progn 
;;      (ido-face-settings)
;;      (ido-settings)))

;;----------------------------------------------------------------

;; icomplete: minibuffer中输入部分命令就可以使用补全
;; (define-key minibuffer-local-completion-map 
;;   (kbd "SPC") 'minibuffer-complete-word)
;; (icomplete-mode 1)
;; (eval-after-load "icomplete"
;;   `(icomplete-settings))
;; (eval-after-load 'my-icomplete+
;;   `(icomplete+-face-settings))
;; completion-list-mode settings
;; (eal-define-keys
;;  'completion-list-mode-map
;;  `(("SPC" scroll-up)
;;    ("u"   scroll-down)
;;    ("n"   next-completion)
;;    ("p"   previous-completion)
;;    ("<"   beginning-of-buffer)
;;    (">"   end-of-buffer)
;;    ("."   set-mark-command)
;;    ("'"   switch-to-other-buffer)
;;    ("L"   count-brf-lines)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; icicles: Better complete system for Emacs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-init-hook 'icy-start)
(defun icicle-keys ()
  "icicle-mode的按键设置."
  (define-key minibuffer-local-completion-map 
    (kbd "SPC") 'minibuffer-complete-word)
  (define-key minibuffer-local-completion-map 
    (kbd "C-w") 'backward-kill-word-or-kill-region)
  (define-key minibuffer-local-completion-map
	(kbd "C-k") 'kill-line))
  ;; (define-key minibuffer-local-completion-map
  ;; 	[Tab] 'icicle-apropos))
(add-hook 'icicle-mode-hook 'icicle-keys t)
(eval-after-load "icicles" `(icicles-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; apropos mode (with icicles?) completion
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (eal-define-keys
;;  'apropos-mode-map
;;  `(("u" scroll-down)
;;    ("1" delete-other-windows)
;;    ("n" forward-button)
;;    ("p" backward-button)))
;; (eval-after-load "apropos" `(apropos-face-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; anything: narrowing and selecting candidates then executing
;; action for selected candidates.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load 'anything
  `(anything-settings))
(global-set-key [S-f7] 'anything)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; DoReMi settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (eval-after-load "icicles" `(doremi-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Buffer auto complete
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Internal Emacs content auto complete system
(setq-default abbrev-mode 1)
(setq save-abbrevs nil)

;;-----------------------------------------------------------

;; hippie-expand settings
(global-set-key (kbd "M-/") 'hippie-expand)
(eval-after-load "hippie-exp"
  `(hippie-expand-settings))

;;----------------------------------------------------------

;; auto-complete settings
(eval-after-load "auto-complete"
  '(progn
	 (auto-complete-settings)
	 ;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
	 ;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
	 ;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
	 (eal-define-keys-commonly
	  'ac-complete-mode-map
	  `(("<return>"   nil)
		("RET"        nil)
		("M-j"        ac-complete)
		;; ("<C-return>" ac-complete)
		("M-n"        ac-next)
		("M-p"        ac-previous)))))

;;--------------------------------------------------------

;; company settings: complete anything.
;; It is a modular in-buffer completion mechanism.
;; (require 'company)
;; (eval-after-load "company"
;;   '(company-settings))
;; (define-key company-mode-map
;;    (kbd "M-RET") 'company-expand-top)

;;--------------------------------------------------------

;; template settings
;; (require 'template)
;; (eal-define-keys
;;  '(emacs-lisp-mode-map c-mode-base-map makefile-mode-map
;;    makefile-automake-mode-map sh-mode-map text-mode-map)
;;  `(("C-c T" my-template-expand-template)
;;    ("C-c C-t" template-expand-template)))
;; (eval-after-load "template" `(template-settings))
;; (template-initialize)

;;-------------------------------------------------------

;; auto-insert: 用template, 自动插入一些文件模板
;; (auto-insert-mode 1)
;; (eval-after-load "autoinsert"
;;   `(auto-insert-settings))

;;---------------------------------------------------------

;; 超强的snippet
(eval-after-load "yasnippet"
  '(progn
	 (yasnippet-settings)
	 (eal-define-keys
	  'yas/keymap
	  `(("M-j"     yas/next-field-or-maybe-expand)
		("M-k"     yas/prev-field)))
	 (eal-define-keys
	  'yas/minor-mode-map
	  `(("C-c C-f" yas/find-snippets)))))
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook
   c-mode-hook sh-mode-hook vhdl-mode-hook
   verilog-mode-hook org-mode-hook
   LaTeX-mode-hook latex-mode-hook)
 `yas-start)

;;-------------------------------------------------------------

(provide 'xy-rcroot-complete)
