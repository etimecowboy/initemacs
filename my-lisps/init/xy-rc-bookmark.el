;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-bookmark.el'
;; Time-stamp:<2011-02-27 Sun 22:00 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `bookmark.el' settings
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
(defun bookmark-settings ()
  "Settings of `bookmark.el'."

  (setq bookmark-default-file (concat my-var-path "/bookmark"))
  (OfficePC
   (Windows
	(setq bookmark-default-file (concat my-var-path "/bookmark-ow"))))
  (HomeDesktop
   (GNULinux
	(setq bookmark-default-file (concat my-var-path "/bookmark-dl")))
   (Windows
	(setq bookmark-default-file (concat my-var-path "/bookmark-dw"))))
  (Laptop
   (Windows
	(setq bookmark-default-file (concat my-var-path "/bookmark-nw")))))

(provide 'xy-rc-bookmark.el)
