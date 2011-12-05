;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-c.el'
;; Time-stamp:<2011-12-05 Mon 04:25 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `c' programming settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun c-mode-common-hook-settings ()
  "Settings for `c-mode-common-hook'."
  (c-set-style "awk")
  ;; 饥饿的删除键
  (c-toggle-auto-hungry-state 1)
  ;; 对subword进行操作，而不是整个word
  (c-subword-mode 1)
  ;;预处理设置
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  ;; (setq hs-minor-mode t)
  ;; (setq abbrev-mode t)
  ;; (when (try-require 'c-eldoc)
  ;;       (eval-after-load "c-eldoc"
  ;;         (progn
  ;;           (c-eldoc-settings)))))
  )

;;;###autoload
(defun c++-mode-settings()
  ;; (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
  ;; (defalias 'cpp-mode 'c++-mode)
  ;; (define-key c++-mode-map [f3] 'replace-regexp)
  )

;;;###autoload
(defun cc-mode-settings ()
  "Settings for `cc-mode'."
  (add-to-list 'auto-mode-alist '("\\.hch" . c-mode))
  (add-to-list 'auto-mode-alist '("\\.hcc" . c-mode))
  (add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))
  (c-set-offset 'inline-open 0)
  (c-set-offset 'friend '-)
  (c-set-offset 'substatement-open 0)
  (setq  c-basic-offset 4
         c-strict-syntax-p t
         c-syntactic-indentation t)
  (global-cwarn-mode 1) ;; 高亮显示C/C++中的可能的错误(CWarn mode)
  (add-hook 'c-mode-common-hook 'c-mode-common-hook-settings)

  (require 'ifdef)       ;; 为不同层次的ifdef着色
  (require 'c-includes)  ;; 快速include
  (require 'xcscope)     ;; 在 C 源代码中快速跳转，查找变量，函数
  (message "* ---[ cc-mode configuration is complete ]---")
)

(provide 'xy-rc-c)
