;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-hide-region.el'
;; Time-stamp:<2011-12-04 Sun 16:57 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `hide-region.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun hide-region-settings ()
  "Settings for `hide-region'."
  (setq hide-region-before-string "[==========Region has been")
  (setq hide-region-after-string  "hidden by Emacs==========]\n")
  (message "* ---[ hide-region configuration is complete ]---")
)

(provide 'xy-rc-hide-region)
