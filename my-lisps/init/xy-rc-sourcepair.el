;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sourcepair.el'
;; Time-stamp:<2011-12-04 Sun 17:54 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sourcepair.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun sourcepair-settings ()
  "Settings for `sourcepair'."
  (setq sourcepair-source-path '( "." "../src"))
  ;; (setq sourcepair-header-path user-head-file-dir)
  (setq sourcepair-header-path user-include-dirs)
  (setq sourcepair-recurse-ignore
        '("CVS" "bin" "lib" "Obj" "Debug" "Release" ".svn" ".git"))
  (message "* ---[ sourcepair configuration is complete ]---")
)

(provide 'xy-rc-sourcepair)
