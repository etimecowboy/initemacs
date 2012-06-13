;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-pcache.el'
;; Time-stamp:<2012-06-10 Sun 21:23 xin on p5q>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `pcache.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun pcache-settings ()
  "Settings of `pcache.el'."
  (setq-default pcache-directory
    (let ((dir (concat my-var-path "/pcache")))
      (make-directory dir t)
      dir))
  (message "* ---[ pcache configuration is complete ]---"))

(provide 'xy-rc-pcache)
