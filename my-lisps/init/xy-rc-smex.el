;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-smex.el'
;; Time-stamp:<2011-11-24 Thu 04:30 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `smex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun smex-settings ()
  "Settings of `smex.el'."

  (setq-default smex-save-file
  				(concat my-var-path "/smex-save-"
  						user-login-name "@"
  						system-name "@"
  						system-configuration))
  )

(provide 'xy-rc-smex)
