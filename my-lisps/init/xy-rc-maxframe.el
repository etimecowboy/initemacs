;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-maxframe.el'
;; Time-stamp:<2011-12-04 Sun 17:30 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `maxframe.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun maxframe-settings ()
  "Settings of `maxframe.el'."
  (HomeDesktop
   (setq mf-max-width 1280)  ;; Pixel width of main monitor
   )
  (message "* ---[ maxframe configuration is complete ]---")
)

(provide 'xy-rc-maxframe)
