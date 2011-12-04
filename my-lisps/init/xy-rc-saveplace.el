;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-saveplace.el'
;; Time-stamp:<2011-12-04 Sun 17:48 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `saveplace.el' settings
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
(defun saveplace-settings ()
  "Settings of `saveplace.el'."
  (setq-default save-place-file (concat my-var-path "/saveplace-"
                                        user-login-name "@"
                                        system-name "@"
                                        system-configuration))
  (message "* ---[ saveplace configuration is complete ]---")
)

(provide 'xy-rc-saveplace)
