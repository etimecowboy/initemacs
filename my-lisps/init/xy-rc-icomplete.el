;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-icomplete.el'
;; Time-stamp:<2011-11-26 Sat 02:59 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `icomplete.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun icomplete-settings ()
  "Settings for `icomplete'."
  ;; There is a icomolete+ available, check it later.
  ;; Here I use ahei's hacked version of icomplete+.
  (require 'my-icomplete+)
  )

;;;###autoload
(defun icomplete+-face-settings ()
  "Face settings for `icomplete+'."
  (custom-set-faces '(icompletep-nb-candidates
                      ((((type tty)) :bold t :foreground "green")
                       (t :foreground "green"))))
  (custom-set-faces '(icompletep-determined
                      ((((type tty)) :bold t :foreground "green")
                       (t :foreground "green"))))
  (custom-set-faces '(icompletep-choices
                      ((((type tty)) :bold t :foreground "yellow")
                       (t :foreground "yellow"))))
  (custom-set-faces '(icompletep-nb-candidates
                      ((((type tty)) :bold t :foreground "green")
                       (t :foreground "green")))))

(provide 'xy-rc-icomplete)
