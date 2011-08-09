;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-which-func.el'
;; Time-stamp:<2011-08-09 Tue 08:31 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `which-func.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun which-func-settings ()
  "Settings for `which-func'."
  (setq which-func-unknown "unknown"))

;;;###autoload
(defun which-func-face-settings ()
  "Face settings for `which-func'."
  (if window-system
      (progn
        (unless is-before-emacs-21
          (set-face-foreground 'which-func "yellow2")
          (set-face-background 'which-func "dark magenta")))
    (unless is-before-emacs-21
      (set-face-foreground 'which-func "yellow")
      (set-face-background 'which-func "black"))))

(provide 'xy-rc-which-func)
