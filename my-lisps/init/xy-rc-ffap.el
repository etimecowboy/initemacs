;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ffap.el'
;; Time-stamp:<2011-02-05 Sat 23:57 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ffap.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ffap-settings ()
  "Settings of `ffap.el'."

  (setq ffap-c-path (append
                     ffap-c-path 
                     system-head-file-dir 
                     user-head-file-dir)))

(provide 'xy-rc-ffap.el)
