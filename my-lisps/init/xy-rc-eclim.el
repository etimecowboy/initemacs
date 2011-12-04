;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-eclim.el'
;; Time-stamp:<2011-12-04 Sun 16:32 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `eclim.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun eclim-settings ()
  "Settings for `eclim'."
  (setq eclim-auto-save t)
  (message "* ---[ eclim configuration is complete ]---")
)

(provide 'xy-rc-eclim)
