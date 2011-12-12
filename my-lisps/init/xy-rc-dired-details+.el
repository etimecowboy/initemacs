;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dired-details+.el'
;; Time-stamp:<2011-12-12 Mon 07:26 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired-details+.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun dired-details+-settings ()
  "Settings of `dired-details+.el'."
  ;; (dired-details-install)        ;; use `(' and `)' to switch
  (setq-default dired-details-initially-hide t)
  (message "* ---[ dired-details+ configuration is complete ]---"))

(provide 'xy-rc-dired-details+)
