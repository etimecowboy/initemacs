;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ibuffer.el'
;; Time-stamp:<2011-01-31 Mon 11:09 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ibuffer.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ibuufer-settings ()
  "Settings of `ibuffer'."

  ;; ibuffer, advanced replacement for the `buffer-menu
  (if is-before-emacs-21 (require 'ibuffer-for-21))

  ;; select-buffer,
  ;; 像linux系统下alt-tab那样选择buffer, 但是更直观, 更方便
  ;; (require 'select-buffer)

  (setq ibuffer-default-sorting-mode '(major-mode))
  (setq ibuffer-formats 
      '((mark modified read-only " " (name 25 25 :left :elide) " " 
              (size 9 -1 :right) " " (mode 16 16 :left :elide) " " 
              filename-and-process) 
        (mark " " (name 16 -1) " " filename))))

(provide 'xy-rc-ibuffer)
