;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-babel.el'
;; Time-stamp:<2011-01-30 Sun 23:38 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `babel.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun babel-settings ()
  "Settings of `babel.el'."
  (setq babel-preferred-from-language "English") ;首选的翻译语言
  (setq babel-preferred-to-language "Chinese") ;首选的目标语言
)

(provide 'xy-babel.el)
