;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-recentf.el'
;; Time-stamp:<2011-02-27 Sun 22:05 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `recentf.el' settings
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
(defun recentf-settings ()
  "Settings of `recentf.el'."

  (setq recentf-save-file (concat my-var-path "/recentf"))
  (OfficePC
   (Windows
	(setq recentf-save-file (concat my-var-path "/recentf-ow"))))
  (HomeDesktop
   (GNULinux
	(setq recentf-save-file (concat my-var-path "/recentf-dl")))
   (Windows
	(setq recentf-save-file (concat my-var-path "/recentf-dw"))))
  (Laptop
   (Windows
	(setq recentf-save-file (concat my-var-path "/recentf-nw"))))
  (setq recentf-max-saved-items 100)
  (setq recentf-max-menu-items 20)
  (setq recentf-menu-filter 'recentf-sort-basenames-ascending)
  (setq recentf-save-file-modes 1000))

(provide 'xy-rc-recentf.el)