;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-highlight-parentheses.el'
;; Time-stamp:<2011-12-04 Sun 16:58 xin on P6T-WIN7>
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
  (setq hl-paren-colors '("red" "magenta" "orange" "yellow" "green"
                          "cyan" "blue"))
  (message "* ---[ highlight-parentheses configuration is complete ]---")
)

(provide 'xy-rc-highlight-parentheses)
