;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dired-sort-menu.el'
;; Time-stamp:<2012-06-14 Thu 13:33 xin on p5q>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired-sort-menu.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun dired-sort-menu-settings ()
  "Settings of `dired-sort-menu.el'."
  (setq dired-sort-dialogue-own-frame t
        dired-sort-menu-saved-config nil)
  (message "* ---[ dired-sort-menu configuration is complete ]---"))

(provide 'xy-rc-dired-sort-menu)
