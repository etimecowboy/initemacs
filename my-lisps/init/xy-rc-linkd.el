;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-linkd.el'
;; Time-stamp:<2011-01-29 Sat 01:09 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `linkd.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun linkd-settings ()
  "settings for `linkd'."
  (setq linkd-use-icons t)
  (setq linkd-icons-directory 
	(concat my-local-image-path "/linkd")))

;;;###autoload
(defun linkd-face-settings ()
  "face settings for `linkd'."
  (set-face-foreground 'linkd-generic-link "yellow"))

(provide 'xy-rc-linkd)