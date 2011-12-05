;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ifdef.el'
;; Time-stamp:<2011-12-05 Mon 08:12 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  My `ifdef.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ifdef-settings ()
  "Settings of `ifdef.el'."
  (eal-define-keys
   'c-mode-base-map
   `(("C-c I" mark-ifdef)))
  (message "* ---[ ifdef configuration is complete ]---")
)

(provide 'xy-rc-ifdef)
