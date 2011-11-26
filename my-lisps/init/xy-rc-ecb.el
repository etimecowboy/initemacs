;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ecb.el'
;; Time-stamp:<2011-11-26 Sat 02:54 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ecb.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun xy/ecb-start ()
  "启动ecb"
  (interactive)
  (require 'ecb-autoloads)
  (ecb-activate)
  (ecb-layout-switch "leftright-analyse"))

;;;###autoload
(defun ecb-settings ()
  "Settings for `ecb'."
  (setq-default ecb-tip-of-the-day nil)
  ;; (setq-default ecb-options-version "2.40")
  (setq-default ecb-auto-compatibility-check nil))

(provide 'xy-rc-ecb)
