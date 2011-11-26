;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-info+.el'
;; Time-stamp:<2011-11-26 Sat 02:59 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `info+' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun info+-settings ()
  "settings for `info+'."
  ;; With `info+.el', you can merge an Info node with its subnodes into
  ;; the same buffer, by calling `Info-merge-subnodes' (bound to `+'),
)

;;;###autoload
(defun info+-face-settings ()
  "Face settings for `info+'."
  (set-face-foreground 'info-string "magenta") ;;)
  (set-face-foreground 'info-string "blue") ;;)
  (custom-set-faces
   '(info-quoted-name
     ((((type tty)) :bold t :foreground "green")
      (t :foreground "cornflower blue"))))
  (set-face-background 'info-single-quote "red")
  (set-face-foreground 'info-single-quote "white")
  (custom-set-faces
   '(info-reference-item
     ((((type tty pc)) :background "white" :foreground "black")
      (t :background "white" :foreground "cornflower blue"))))
  (set-face-foreground 'info-function-ref-item "deeppink1"))

(provide 'xy-rc-info+)
