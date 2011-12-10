;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-info.el'
;; Time-stamp:<2011-12-10 Sat 03:01 xin on p6t>
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
  (apply-args-list-to-fun
   'def-command-max-window `("info"))
  ;; With `info+.el', you can merge an Info node with its subnodes into
  ;; the same buffer, by calling `Info-merge-subnodes' (bound to `+'),
  (try-require 'info+)
  (message "* ---[ info configuration is complete ]---"))

(provide 'xy-rc-info)
