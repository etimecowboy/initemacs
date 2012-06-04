;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-complete.el'
;; Time-stamp:<2012-06-03 Sun 20:29 xin on p5q>
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
;; (partial-completion-mode 1) ;; BUG: Emacs24

;;--------------------------------------------------------------------
;;** ido
;; interactively do things with buffers and files
;; NOTE: From Emacs-22 it is a part of Emacs
;; (if is-before-emacs-21
;;     (require 'ido "ido-for-21"))
;; (add-hook 'after-init-hook 'xy/ido-start)
(eval-after-load 'ido
  '(progn
     (ido-settings)))
     ;; (eal-define-keys
     ;;  'ido-mode-map
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
     ;;    ;; ("C-v"   ido-enter-svn-status-hide)
     ;;    ("C-n"   ido-next-match)
     ;;    ("C-p"   ido-prev-match)))))

;;--------------------------------------------------------------------
;;** icomplete
;; minibuffer中输入部分命令就可以使用补全
(eval-after-load "icomplete"
  '(progn
    (icomplete-settings)))
;;     (eal-define-keys
;;      'completion-list-mode-map
;;      `(("SPC" scroll-up)
;;        ("u"   scroll-down)
;;        ("n"   next-completion)
;;        ("p"   previous-completion)
;;        ("<"   beginning-of-buffer)
;;        (">"   end-of-buffer)
;;        ("."   set-mark-command)
;;        ("'"   switch-to-other-buffer)
;;        ("L"   count-brf-lines)))
;;     (define-key minibuffer-local-completion-map (kbd "SPC")
;;       'minibuffer-complete-word)))
;; (icomplete-mode 1)

;;--------------------------------------------------------------------
;;** smex
;; Smex is a M-x enhancement for Emacs. Built on top of Ido, it
;; provides a convenient interface to your recently and most
;; frequently used commands. And to all the other commands, too.
;; REF: (@url :file-name "https://github.com/nonsequitur/smex" :display "Source")
(eval-after-load 'smex
  '(progn
     (smex-settings)
     (eal-define-keys-commonly
      global-map
      `(("M-x" smex)
        ("M-X" smex-major-mode-commands)
        ("C-c M-x" execute-extended-command)))))

;;--------------------------------------------------------------------
;;** ido+smex
;; Use both ido and smex
;; NOTE: NEVER use both icy-mode and ido/smex. They are different in
;;       the way of using minibuffer, and conflicts with each other.
;;;###autoload
(defun xy/ido+smex-start ()
  "Start ido and smex completion."
  (interactive)
  (when (featurep 'icicles)
    (icy-mode -1))
  (require 'ido)
  (require 'smex)
  (ido-mode 1)
  (smex-initialize))
  ;; (smex-initialize-ido)) ;; BUG: `smex-initialize-ido' cause error
  ;;                        ;; in Emacs 23.2, but OK in 23.3
(global-set-key (kbd "<f6> d") 'xy/ido+smex-start)
 ;; (Windows ;; BUG: not work in Linux. Why? --Answer: The
 ;; `smex-save-file' cannot be automatically created in Linux. Fixed
 ;; by manually create it.
 ;; (add-hook 'after-init-hook 'xy/ido+smex-start))
(add-hook 'after-init-hook 'xy/ido+smex-start)

;;--------------------------------------------------------------------
;;** ido+icomplete
;; Use both ido and icomplete
;;;###autoload
;; (defun xy/ido+icomplete-start ()
;;   "Start ido and icomplete completion."
;;   (interactive)
;;   (when (featurep 'icicles)
;;     (icy-mode -1))
;;   (require 'ido)
;;   (ido-mode 1)
;;   (require 'icomplete)
;;   (icomplete-mode 1))
;; (global-set-key (kbd "<f6> D") 'xy/ido+icomplete-start)
;; (GNULinux
;;  (add-hook 'after-init-hook 'xy/ido+icomplete-start))

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
     (eal-define-keys
      'ac-complete-mode-map
      `(("<return>"   nil)
         ("RET"        nil)
         ;; ("M-j"        ac-complete)
         ;; ("<C-return>" ac-complete)
         ("M-n"        ac-next)
         ("M-p"        ac-previous))) ))
(global-set-key (kbd "<f6> a") 'xy/ac-start)

;;--------------------------------------------------------------------
;;** company settings
;; It is a modular in-buffer completion mechanism.
;; (autoload 'company-mode "company" nil t)
;; (eval-after-load "company" '(company-settings))
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
;; (eval-after-load "autoinsert" '(auto-insert-settings))
;; (auto-insert-mode 1)

;;--------------------------------------------------------------------
;** yasnippet
(autoload 'yas/minor-mode "yasnippet" nil t)
(eval-after-load "yasnippet"
  '(progn
     (yasnippet-settings)
     ;; tab is widely-used by ido/icicles/org/indent/outline/hideshow
     (setq yas/trigger-key "C-c <tab>")
     (eal-define-keys
      'yas/keymap
      `(("M-j"     yas/next-field-or-maybe-expand)
        ("M-k"     yas/prev-field)))
     (eal-define-keys
      'yas/minor-mode-map
      `(("C-c C-f" yas/find-snippets)))))
;; NOTE: manually start it when required
(global-set-key (kbd "<f6> y") 'yas/minor-mode)
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
                  c-common-mode-hook sh-mode-hook matlab-mode-hook
                  vhdl-mode-hook verilog-mode-hook
                  org-mode-hook LaTeX-mode-hook)
 '(lambda () (yas/minor-mode 1)))

;;====================================================================
;;* icicles
;; System-wide completion
(eval-after-load "icicles" '(icicles-settings))
;; (add-hook 'after-init-hook 'icy-mode)
(global-set-key (kbd "<f6> i") 'xy/icy-start)

;;--------------------------------------------------------------------
;;** apropos-mode
;; (with icicles?) completion
(eval-after-load "apropos"
  '(progn
     ;; (apropos-settings)
     (eal-define-keys
      'apropos-mode-map
      `(("u" scroll-down)
        ("1" delete-other-windows)
        ("n" forward-button)
        ("p" backward-button)))))

;;====================================================================
;;* anything
;; Quicksilver for Emacs
(eval-after-load 'anything '(anything-settings))
(global-set-key (kbd "C-c i") 'xy/my-anything)

(provide 'xy-rcroot-complete)
