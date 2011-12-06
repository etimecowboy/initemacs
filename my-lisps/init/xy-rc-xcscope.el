;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-xcscope.el'
;; Time-stamp:<2011-12-06 Tue 04:51 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `xcscope.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun xcscope-settings ()
  "Settings of `xcscope.el'."
  (setq cscope-database-file "cscope.out"
        cscope-index-file "cscope.files"
        cscope-index-recursively t
        cscope-indexing-script "cscope-indexer"
        cscope-program "cscope"
        cscope-truncate-lines t
        cscope-use-face t)
  (GNULinux
   (setq cscope-indexing-script "cscope-indexer"))
  (Windows
   (setq cscope-indexing-script
         "cscope-indexer.bat"))
  (message "* ---[ xcscope configuration is complete ]---")
)

(provide 'xy-rc-xcscope)
