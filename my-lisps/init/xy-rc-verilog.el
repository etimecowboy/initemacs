;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-verilog.el'
;; Time-stamp:<2011-08-09 Tue 08:31 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `verilog.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

  
;;;###autoload
(defun verilog-mode-settings ()
  "settings for `verilog-mode'."

  (setq verilog-align-ifelse t)
  (setq verilog-auto-arg-sort t)
  (setq verilog-auto-lineup 'all)
  (setq verilog-auto-newline nil)
  (setq verilog-mode-hook 'verilog-set-compile-command linum-mode))

(provide 'xy-rc-verilog)
