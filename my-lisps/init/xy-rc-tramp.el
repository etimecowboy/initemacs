;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-tramp.el'
;; Time-stamp:<2011-02-13 Sun 22:20 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `tramp' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun tramp-settings ()
  "Settings of `tramp'."
  
;; (setq tramp-default-method "sudo")
  (setq tramp-persistency-file-name
		(concat my-var-path "/tramp")))

(provide 'xy-rc-tramp.el)
