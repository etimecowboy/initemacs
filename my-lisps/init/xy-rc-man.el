;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-man.el'
;; Time-stamp:<2011-11-26 Sat 03:00 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `man' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun man-current-word ()
  "Check the word at the point in `man'"
  (interactive)
  (manual-entry (current-word)))

;;;###autoload
(defun man-settings ()
  "settings for `man'."
  (setq Man-notify-method 'newframe))

;;;###autoload
(defun man-face-settings ()
  "Face settings for `man'."
  (setq Man-overstrike-face 'yellow-face)
  (setq Man-underline-face 'underline-green-face)
  (setq Man-reverse-face 'red-face))

(provide 'xy-rc-man)
