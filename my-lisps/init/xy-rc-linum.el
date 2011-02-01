;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-linum.el'
;; Time-stamp:<2011-01-27 Thu 22:02 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `linum.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun linum-settings ()
  "settings for `linum'."
  ;; linum+
  ;; REF: http://emacser.com/linum-plus.htm
  (try-require 'linum+))

;;;###autoload
(defun linum-face-settings ()
  "Face settings for `linum'."
  (custom-set-faces
   '(linum
     ((((background dark))
       :foreground "cyan")
      (t :foreground "gray")))))

(provide 'xy-rc-linum)