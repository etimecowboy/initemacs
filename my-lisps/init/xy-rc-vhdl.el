;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-vhdl.el'
;; Time-stamp:<2011-08-09 Tue 08:31 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `vhdl.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

  
;;;###autoload
(defun vhdl-mode-settings ()
  "settings for `vhdl-mode'."
    
  (setq vhdl-include-direction-comments t)
  (setq vhdl-include-group-comments 'decl)
  (setq vhdl-include-port-comments t)
  (setq vhdl-include-type-comments t)
  (setq vhdl-standard '((93 nil)))
  (setq vhdl-underscore-is-part-of-word t)
  (setq vhdl-upper-case-attributes t)
  (setq vhdl-upper-case-constants nil)
  (setq vhdl-upper-case-enum-values t)
  (setq vhdl-upper-case-keywords t)
  (setq vhdl-upper-case-types t))

(provide 'xy-rc-vhdl)
