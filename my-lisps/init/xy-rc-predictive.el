;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-predictive.el'
;; Time-stamp:<2012-06-06 Wed 18:31 xin on p5q>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `predictive.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun predictive-settings ()
  "Settings of `predictive.el'."

  (setq predictive-auto-learn t
        predictive-auxiliary-file-location "~/emacs/predictive/")

  (message "* ---[ predictive configuration is complete ]---"))

(provide 'xy-rc-predictive)
