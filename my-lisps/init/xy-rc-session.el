;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-session.el'
;; Time-stamp:<2011-02-02 Wed 10:48 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `session.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun session-settings ()
  "Settings for `session'."

  (setq session-initialize '(session menus))
  (add-to-list 'session-globals-exclude 'org-mark-ring)
  ;; (setq session-globals-max-size 100)
  ;; (setq session-globals-max-string 40960)
  ;; (setq session-registers-max-string 2048)
  (setq session-save-file (concat my-var-path "/session"))
  (OfficePC
   (setq session-save-file (concat my-var-path "/session-office")))
  (HomeDesktop
   (setq session-save-file (concat my-var-path "/session-home-desktop")))
  (Laptop
   (setq session-save-file (concat my-var-path "/session-laptop"))))
  

(provide 'xy-rc-session.el)
