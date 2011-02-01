;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-mic-paren.el'
;; Time-stamp:<2011-01-31 Mon 13:08 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `mic-paren.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun mic-paren-settings ()
  "Face settings for `mic-paren'."
  (paren-activate)
  (setq paren-message-show-linenumber 'absolute))

;;;###autoload
(defun mic-paren-face-settings ()
  "Face settings for `mic-paren'."
  (set-face-background 'paren-face-match "magenta")
  (set-face-foreground 'paren-face-match "yellow")
  (set-face-background 'paren-face-mismatch "red"))
  
(provide 'xy-rc-mic-paren.el)
