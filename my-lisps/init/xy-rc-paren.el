;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-paren.el'
;; Time-stamp:<2011-01-31 Mon 13:04 xin on P6T>
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
  "Settings for `paren'.")

;;;###autoload
(defun paren-face-settings ()
  "Face settings for `paren'."
  (unless is-before-emacs-21
    ;; 括号颜色设置
    (set-face-background 'show-paren-match "magenta")
    (set-face-foreground 'show-paren-match "yellow")
    (set-face-background 'show-paren-mismatch "red")))
  
(provide 'xy-rc-paren.el)
