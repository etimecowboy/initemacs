;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-color-theme.el'
;; Time-stamp:<2011-12-14 Wed 05:36 xin on P6T-WIN7>
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
(defun xy/color-theme-start ()
  "Load all the themes."
  (interactive)
  (require 'color-theme)
  (color-theme-initialize))

;;;###autoload
(defun color-theme-settings ()
  "Settings of `color-theme.el'."
  (setq color-theme-is-global t)
  (setq color-theme-is-cumulative t)
  (setq color-theme-directory "~/.emacs.d/themes")
  ;; (color-theme-initialize)
  ;; create some frames with different color themes
  ;; BUG: will create three frames when Emacs startup
  ;; (let ((color-theme-is-global nil))
  ;;     (select-frame (make-frame))
  ;;     (color-theme-standard)
  ;;     (select-frame (make-frame))
  ;;     (color-theme-standard))
  (message "* ---[ color-theme configuration is complete ]---"))

(provide 'xy-rc-color-theme)

;; ahei's settings : cycle
