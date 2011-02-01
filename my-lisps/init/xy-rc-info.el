;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-info.el'
;; Time-stamp:<2011-01-27 Thu 22:02 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `info' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun info-settings ()
  "settings for `info'."
;; With `info+.el', you can merge an Info node with its subnodes into
;; the same buffer, by calling `Info-merge-subnodes' (bound to `+'),
  (require 'info+))

;;;###autoload
(defun info-face-settings ()
  "Face settings for `info'."
  (unless is-before-emacs-21
    (set-face-foreground 'info-menu-star "red")
    (set-face-background 'info-menu-star "yellow"))
  (custom-set-faces '(info-header-node ((((class color) (background dark)) (:foreground "red")))))
  (custom-set-faces '(info-title-1
                      ((((type tty pc) (class color) (background dark))
                        :foreground "yellow" :weight bold)
                       (t :foreground "yellow"))))
  (custom-set-faces '(info-title-2
                      ((((type tty pc) (class color) (background dark))
                        :foreground "yellow" :weight bold)
                       (t :foreground "lightblue"))))
  (custom-set-faces '(info-title-3
                      ((((type tty pc) (class color) (background dark))
                        :foreground "yellow" :weight bold)
                       (t :foreground "violetred1"))))
  (custom-set-faces '(info-title-4
                      ((((type tty pc) (class color) (background dark))
                        :foreground "yellow" :weight bold)
                       (t :foreground "green"))))
  (custom-set-faces '(info-menu-header
                      ((((type tty pc)) :underline t :weight bold)
                       (t :inherit nil :foreground "coral2" :bold nil))))

  (custom-set-faces
   '(info-xref
     ((((type tty)) :inherit link)
      (t :foreground "#165ACBD1FFFF" :underline t)))))

;;;###autoload
(defun info+-face-settings ()
  "Face settings for `info+'."
  ;; (if use-black-background ;; wrong use-black-background
  ;;    (progn
        (set-face-foreground 'info-string "magenta") ;;)
    (set-face-foreground 'info-string "blue") ;;)
  (custom-set-faces '(info-quoted-name
                      ((((type tty)) :bold t :foreground "green")
                       (t :foreground "cornflower blue"))))
  (set-face-background 'info-single-quote "red")
  (set-face-foreground 'info-single-quote "white")
  (custom-set-faces '(info-reference-item
                      ((((type tty pc)) :background "white" :foreground "black")
                       (t :background "white" :foreground "cornflower blue"))))
  (set-face-foreground 'info-function-ref-item "deeppink1"))

;;----------------------------------------------------------------------

(provide 'xy-rc-info)