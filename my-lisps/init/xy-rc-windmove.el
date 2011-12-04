;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-windmove.el'
;; Time-stamp:<2011-12-04 Sun 18:15 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `windmove.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;; TODO: wirte a funtion to auto update all the lisps from EmacsWiki.
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun windmove-settings ()
  "Settings of `windmove.el'."
  (setq windmove-wrap-around t)
  (message "* ---[ windmove configuration is complete ]---")
)

(provide 'xy-rc-windmove)
