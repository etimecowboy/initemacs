;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sunrise.el'
;; Time-stamp:<2011-02-27 Sun 23:47 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sunrise.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun sunrise-settings ()
  "Settings of `sunrise.el'."

  (setq sr-show-hidden-files t)
  (setq sr-window-split-style 'vertical)
  (setq sr-start-hook
   (quote (sr-tree-menu-init
		   sr-tabs-start-once
		   sr-modeline-start-once)))
  (require 'sunrise-x-tree))

(provide 'xy-rc-sunrise.el)
