;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-highlight-parentheses.el'
;; Time-stamp:<2011-11-26 Sat 02:58 xin on p6t>
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
(require 'eval-after-load)

;;;###autoload
(defun highlight-parentheses-settings ()
  "Settings for `highlight-parentheses'."
  ;; BUG: 最后一项不知道为啥不起作用
  ;; Test: (((((((((((((())))))))))))))
  (setq hl-paren-colors '("red" "yellow" "cyan" "magenta" "green" "blue")))

(provide 'xy-rc-highlight-parentheses)
