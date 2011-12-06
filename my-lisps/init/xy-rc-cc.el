;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-cc.el'
;; Time-stamp:<2011-12-05 Mon 14:06 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  My C/C++/Java development settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun cc-mode-settings ()
  "Settings for `cc-mode'."
  ;; Make a non-standard key binding.  We can put this in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
  ;; inherit from it.
  ;; (defun my-c-initialization-hook ()
  ;;   (define-key c-mode-base-map "\C-m" 'c-context-line-break))
  ;; (add-hook 'c-initialization-hook 'my-c-initialization-hook)

  ;; (c-set-offset 'inline-open 0)
  ;; (c-set-offset 'friend '-)
  ;; (c-set-offset 'substatement-open 0)

  (setq  c-basic-offset 4
         c-strict-syntax-p t
         c-syntactic-indentation t)

  ;;------------------------------------------------------------------
  ;; C programming style
  ;; (setq c-default-style '((java-mode . "java")
  ;;                         (awk-mode . "awk")
  ;;                         (other . "linux")))

  ;; offset customizations not in my-c-style
  ;; This will take precedence over any setting of the syntactic symbol
  ;; made by a style.
  (setq c-offsets-alist '((member-init-intro . ++)))

  ;; Create my personal style.
  (defconst my-c-style
    '((c-tab-always-indent        . t)
      (c-comment-only-line-offset . 4)
      (c-hanging-braces-alist     . ((substatement-open after)
                                     (brace-list-open)))
      (c-hanging-colons-alist     . ((member-init-intro before)
                                     (inher-intro)
                                     (case-label after)
                                     (label after)
                                     (access-label after)))
      (c-cleanup-list             . (scope-operator
                                     empty-defun-braces
                                     defun-close-semi))
      (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                     (substatement-open . 0)
                                     (case-label        . 4)
                                     (block-open        . 0)
                                     (knr-argdecl-intro . -)))
      (c-echo-syntactic-information-p . t))
    "My C Programming Style")
  (c-add-style "PERSONAL" my-c-style)

  (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
  (add-hook 'c-mode-hook 'my-c-mode-hook)
  (add-hook 'c++-mode-hook 'my-c++-mode-hook)

  ;;------------------------------------------------------------------
  (message "* ---[ cc-mode configuration is complete ]---")
)

;; Customizations for all modes in CC Mode.
;;;###autoload
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "PERSONAL")
  ;; other customizations
  (setq tab-width 8
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; (setq-default c-electric-flag nil) ;; for newbies to cc-mode
  (c-toggle-electric-state 1)
  ;; (auto-newline-mode 1)
  (c-toggle-auto-newline 1)
  ;; (hungry-delete-mode 1)
  (c-toggle-auto-hungry-state 1)
  (c-subword-mode 1)
  (c-toggle-syntactic-indentation 1)
  (require 'filladapt)
  (c-setup-filladapt)
  (filladapt-mode 1)
  )

;; Customizations for c-mode
;;;###autoload
(defun my-c-mode-hook ()
  (global-cwarn-mode 1)  ;; 高亮显示C/C++中的可能的错误(CWarn mode)
  (require 'ifdef)       ;; 为不同层次的ifdef着色
  (require 'hideif)      ;; 显示隐藏 ifdef
  (hide-ifdef-mode 1)
  (require 'c-includes)  ;; 快速include
  ;; (require 'sourcepiar)  ;; 可以在cpp与h文件之间切换
  (require 'xcscope)     ;; 在 C 源代码中快速跳转，查找变量，函数
  (require 'xcscope+)
  (message "* ---[ c-mode configuration is complete ]---")
  )

;; Customizations for c++-mode
;;;###autoload
(defun my-c++-mode-hook ()
  (global-cwarn-mode 1)  ;; 高亮显示C/C++中的可能的错误(CWarn mode)
  (require 'ifdef)       ;; 为不同层次的ifdef着色
  (require 'hideif)      ;; 显示隐藏 ifdef
  (hide-ifdef-mode 1)
  (require 'c-includes)  ;; 快速include
  (require 'xcscope)     ;; 在 C 源代码中快速跳转，查找变量，函数
  (require 'xcscope+)
  ;; (setq tab-width 4 indent-tabs-mode nil)
  ;; (c-set-style "stroustrup")
  ;; (defalias 'cpp-mode 'c++-mode)
  ;; (define-key c++-mode-map [f3] 'replace-regexp)
  (message "* ---[ c++-mode configuration is complete ]---")
  )

(provide 'xy-rc-cc)

;; ;;;###autoload
;; (defun c-mode-common-hook-settings ()
;;   "Settings for `c-mode-common-hook'."
;;   (c-set-style "awk")
;;   ;;预处理设置
;;   (setq c-macro-shrink-window-flag t)
;;   (setq c-macro-preprocessor "cpp")
;;   (setq c-macro-cppflags " ")
;;   (setq c-macro-prompt-flag t)
;;   ;; (setq hs-minor-mode t)
;;   ;; (setq abbrev-mode t)
;;   ;; (when (try-require 'c-eldoc)
;;   ;;       (eval-after-load "c-eldoc"
;;   ;;         (progn
;;   ;;           (c-eldoc-settings)))))
;;   )
