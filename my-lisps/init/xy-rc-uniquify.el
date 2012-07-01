;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:37 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-uniquify.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `uniquify.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun uniquify-settings ()
  "Settings of `uniquify.el'."
  (setq uniquify-buffer-name-style 'forward)
  (message "* ---[ uniquify configuration is complete ]---")
)

(provide 'xy-rc-uniquify)
