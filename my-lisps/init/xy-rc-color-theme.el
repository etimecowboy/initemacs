;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-color-theme.el'
;; Time-stamp:<2011-08-08 Mon 23:28 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `color-theme.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun color-theme-start ()
  "Start color-theme"

  (interactive)
  (require 'color-theme-autoloads)
  (color-theme-initialize)
  (color-theme-ahei-xy)
  ;; (color-theme-blackboard)
  )

;;;###autoload
(defun color-theme-settings ()
  "Settings of `color-theme.el'."

)

(provide 'xy-rc-color-theme.el)
