;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-magit.el'
;; Time-stamp:<2012-01-19 Thu 14:54 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `magit' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun magit-settings ()
  "Settings of `magit'."
  (setq magit-log-edit-mode-hook
        '(lambda ()
           (flyspell-mode 1)))
  (message "* ---[ magit configuration is complete ]---"))

(provide 'xy-rc-magit)
