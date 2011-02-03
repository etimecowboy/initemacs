;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-windows.el'
;; Time-stamp:<2011-02-03 Thu 12:39 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `windows.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun windows-start ()
  "Start windows desktop."

  ;; The default prefix is conflict with Org, so swith it.
  (setq win:switch-prefix "\C-c\C-v")
  (define-key global-map win:switch-prefix nil)
  (define-key global-map "\C-c\C-vb" 'win-switch-to-window)
  ;; set configuration file location.
  (setq win:configuration-file (concat my-var-path "/windows"))
  (OfficePC
   (setq win:configuration-file (concat my-var-path "/windows-office")))
  (HomeDesktop
   (setq win:configuration-file (concat my-var-path "/windows-home-desktop")))
  (Laptop
   (setq win:configuration-file (concat my-var-path "/windows-laptop")))
  (win:startup-with-window))

;;;###autoload
(defun windows-settings ()
  "Settings of `windows.el'."

  ;; Remove frame number in `global-mode-string'
  (delete 'win:mode-string global-mode-string)
  ;; set configuration file location.
  (setq win:configuration-file (concat my-var-path "/windows"))
  (OfficePC
   (setq win:configuration-file (concat my-var-path "/windows-office")))
  (HomeDesktop
   (setq win:configuration-file (concat my-var-path "/windows-home-desktop")))
  (Laptop
   (setq win:configuration-file (concat my-var-path "/windows-laptop")))
)
  
(provide 'xy-rc-windows.el)
