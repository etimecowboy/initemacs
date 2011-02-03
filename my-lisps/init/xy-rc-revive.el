;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-revive.el'
;; Time-stamp:<2011-02-02 Wed 10:39 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `revive.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun revive-settings ()
  "Settings of `revive.el'."
  ;; set configuration file location.
  (setq revive:configuration-file (concat my-var-path "/revive"))
  (OfficePC
   (setq revive:configuration-file (concat my-var-path "/revive-office")))
  (HomeDesktop
   (setq revive:configuration-file (concat my-var-path "/revive-home-desktop")))
  (Laptop
   (setq revive:configuration-file (concat my-var-path "/revive-laptop"))))

(provide 'xy-rc-revive.el)
