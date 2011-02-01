;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auto-install.el'
;; Time-stamp:<2011-01-30 Sun 23:38 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `auto-install.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun auto-install-settings ()
  "Settings of `auto-install.el'."
  (setq auto-install-save-confirm nil)
  (setq auto-install-directory my-local-lisp-path))

(provide 'xy-rc-auto-install.el)
