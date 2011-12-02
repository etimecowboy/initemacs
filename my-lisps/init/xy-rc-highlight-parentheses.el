;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-highlight-parentheses.el'
;; Time-stamp:<2011-12-02 Fri 14:25 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `highlight-parentheses.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun highlight-parentheses-settings ()
  "Settings for `highlight-parentheses'."
  ;;Test: (((((((((((((())))))))))))))
  (setq hl-paren-colors '("red" "magenta" "orange" "yellow" "green" "cyan" "blue")))

(provide 'xy-rc-highlight-parentheses)
