;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-paren.el'
;; Time-stamp:<2011-12-12 Mon 05:50 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `paren.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun paren-settings ()
  "Settings for `paren'."
  (setq show-paren-style 'expression)
  (message "* ---[ paren configuration is complete ]---"))

;; ;;;###autoload
;; (defun paren-face-settings ()
;;   "Face settings for `paren'."
;;   (unless is-before-emacs-21
;;     ;; 括号颜色设置
;;     (set-face-background 'show-paren-match "magenta")
;;     (set-face-foreground 'show-paren-match "yellow")
;;     (set-face-background 'show-paren-mismatch "red")))

(provide 'xy-rc-paren)
