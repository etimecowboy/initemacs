;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-thumbs.el'
;; Time-stamp:<2012-06-14 Thu 14:09 xin on p5q>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `thumbs.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun thumbs-settings ()
  "Settings of `thumbs.el'."
  (setq-default thumbs-thumbsdir
                (concat my-var-path "/thumbs"))
  ;; (setq thumbs-conversion-program "convert") ;; use imagemagick
  (setq thumbs-geometry "196x196")
  (setq thumbs-per-line 5)
  (setq thumbs-margin 3)
  (setq thumbs-thumbsdir-max-size 10000000) ;; 10M limit
  (setq thumbs-relief 0)
  (setq thumbs-thumbsdir-auto-clean t)
  (setq thumbs-temp-dir (concat my-var-path "/thumbs"))
  (message "* ---[ thumbs configuration is complete ]---"))

(provide 'xy-rc-thumbs)
