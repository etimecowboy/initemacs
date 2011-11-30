;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-complete.el'
;; Time-stamp:<2011-11-30 Wed 17:32 xin on P6T-WIN7>
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

;;====================================================================
;;* Mini buffer auto complete

;; an do stuff like M-x q-r-r TAB, and it expands to
;; query-replace-regexp.
;; (unless is-after-emacs-23
;;   (partial-completion-mode 1))
(partial-completion-mode 1)

;;--------------------------------------------------------------------

;;** ido
;; interactively do things with buffers and files
;; NOTE: From Emacs-22 it is a part of Emacs
;; (if is-before-emacs-21
;;     (require 'ido "ido-for-21"))
;; (ido-mode 1)
(eval-after-load 'ido
  '(progn
     ;; (ido-face-settings)
     (ido-settings)))

;;--------------------------------------------------------------------

;;** icomplete
;; minibuffer中输入部分命令就可以使用补全
;; (define-key minibuffer-local-completion-map
;;   (kbd "SPC") 'minibuffer-complete-word)
;; (icomplete-mode 1)
;; (eval-after-load "icomplete"
;;   '(prog
;;     (icomplete-settings)))
;; (eval-after-load 'my-icomplete+
;;   '(prog
;;     (icomplete+-face-settings)))
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

;;--------------------------------------------------------------------

;;** smex
;; Smex is a M-x enhancement for Emacs. Built on top of Ido, it
;; provides a convenient interface to your recently and most
;; frequently used commands. And to all the other commands, too.
;; (require 'smex)
;; (smex-initialize)
(eval-after-load 'smex
  '(progn
     (smex-settings)
     (global-set-key (kbd "M-x") 'smex)
     (global-set-key (kbd "M-X") 'smex-major-mode-commands)
     ))

;;--------------------------------------------------------------------

;;** ido+smex
;; NOTE: NEVER start both icy-mode and ido+smex. One is enough
;;;###autoload
(defun xy/ido+smex-start ()
  "Start ido and smex mini-buffer completion."

  (interactive)
  (when (featurep 'icicles)
    (icy-mode -1))
  (require 'ido)
  (require 'smex)
  (ido-mode 1)
  ;; (smex-initialize-ido)
  (smex-initialize)
  (add-hook 'org-mode-hook
            '(lambda ()
               (setq org-completion-use-ido t))))

;;====================================================================
;;* Buffer auto complete

;;** Internal Emacs content auto complete system
(setq-default abbrev-mode 1)
(setq save-abbrevs nil)

;;--------------------------------------------------------------------

;;** hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)
(eval-after-load "hippie-exp"
  '(progn
     (hippie-expand-settings)))

;;--------------------------------------------------------------------

;;** auto-complete settings
(eval-after-load "auto-complete"
  '(progn
     (auto-complete-settings)
     ;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
     ;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
     ;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
     ;; (eal-define-keys-commonly
     ;;  ac-complete-mode-map
     ;;  `(("<return>"   nil)
     ;;     ("RET"        nil)
     ;;     ;; ("M-j"        ac-complete)
     ;;     ;; ("<C-return>" ac-complete)
     ;;     ("M-n"        ac-next)
     ;;     ("M-p"        ac-previous)))
     ))

;;--------------------------------------------------------------------

;;** company settings
;; It is a modular in-buffer completion mechanism.
;; (require 'company)
(autoload 'company-mode "company" nil t)
(eval-after-load "company"
  '(progn
     (company-settings)))
;; (am-add-hooks
;;  `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook
;;    java-mode-hook lisp-interaction-mode-hook sh-mode-hook
;;   ,(if (not is-before-emacs-21) 'awk-mode-hook) ruby-mode-hook)
;;   'company-mode)

;;--------------------------------------------------------------------

;;** template settings
;; (require 'template)
;; (eal-define-keys
;;  '(emacs-lisp-mode-map c-mode-base-map makefile-mode-map
;;    makefile-automake-mode-map sh-mode-map text-mode-map)
;;  `(("C-c T" my-template-expand-template)
;;    ("C-c C-t" template-expand-template)))
;; (eval-after-load "template"
;;   '(progn (template-settings)))
;; (template-initialize)

;;--------------------------------------------------------------------

;;** auto-insert
;; 用template, 自动插入一些文件模板
;; (auto-insert-mode 1)
(eval-after-load "autoinsert"
  '(progn
     (auto-insert-settings)))

;;--------------------------------------------------------------------

;;** yasnippet
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
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
;;    c-mode-hook cc-mode-hook c-mode-common-hook
;;    sh-mode-hook vhdl-mode-hook verilog-mode-hook org-mode-hook
;;    LaTeX-mode-hook latex-mode-hook matlab-mode-hook)
;;  `xy/yas-start)

;;====================================================================
;;* icicles
;; System-wide completion

(add-hook 'after-init-hook 'icy-mode)
(defun icicle-keys ()
  "icicle-mode的按键设置."
  (define-key minibuffer-local-completion-map
    (kbd "SPC") 'minibuffer-complete-word)
  (define-key minibuffer-local-completion-map
    (kbd "C-w") 'backward-kill-word-or-kill-region)
  (define-key minibuffer-local-completion-map
    (kbd "C-k") 'kill-line)
  ;; (define-key minibuffer-local-completion-map
  ;;     [Tab] 'icicle-apropos)
  )
(add-hook 'icicle-mode-hook 'icicle-keys t)
(eval-after-load "icicles"
  '(progn
     (icicles-settings)))

;;--------------------------------------------------------------------

;;** apropos-mode
;; (with icicles?) completion
;; (eal-define-keys
;;  'apropos-mode-map
;;  `(("u" scroll-down)
;;    ("1" delete-other-windows)
;;    ("n" forward-button)
;;    ("p" backward-button)))
;; (eval-after-load "apropos"
;;   '(progn
;;      (apropos-face-settings)))

;;====================================================================
;;* anything
;; Quicksilver for Emacs

(eval-after-load 'anything
  '(progn
     (anything-settings)))
(global-set-key (kbd "C-c i") 'xy/my-anything) ;; old <f7>

(provide 'xy-rcroot-complete)
