;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-c-includes.el'
;; Time-stamp:<2011-12-04 Sun 16:11 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `c-includes.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun c-includes-settings ()
  "Settings of `c-includes.el'."
    (setq c-includes-binding t)
    (setq c-includes-path ffap-c-path)
    (message "* ---[ c-includes configuration is complete ]---")
)

(provide 'xy-rc-c-includes)
