;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-uniquify.el'
;; Time-stamp:<2011-12-04 Sun 18:05 xin on P6T-WIN7>
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
