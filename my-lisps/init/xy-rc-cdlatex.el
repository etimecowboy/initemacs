;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-cdlatex.el'
;; Time-stamp:<2012-01-09 Mon 14:22 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `cdlatex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun cdlatex-settings ()
  "Settings of `cdlatex.el'."
  (setq cdlatex-math-symbol-prefix "C-`")
  (message "* ---[ cdlatex configuration is complete ]---"))

(provide 'xy-rc-cdlatex)
