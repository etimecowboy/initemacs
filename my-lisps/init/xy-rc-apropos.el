!;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-apropos.el'
;; Time-stamp:<2011-12-04 Sun 16:02 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `apropos.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun apropos-face-settings ()
  "Face settings for `apropos'."

  (setq apropos-match-face 'red-face)
  (setq apropos-symbol-face 'magenta-face)
  (setq apropos-keybinding-face 'cyan-face)
  (setq apropos-label-face 'underline-green-face)
  (setq apropos-property-face 'font-yellow-face)
  (message "* ---[ apropos configuration is complete ]---")
  )

(provide 'xy-rc-apropos)
