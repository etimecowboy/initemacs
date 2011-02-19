;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-multi-term.el'
;; Time-stamp:<2011-02-19 Sat 16:56 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `multi-term.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun multi-term-start ()
  "Start multi-term."

  (interactive)
  (require 'multi-term)
  (multi-term))

;;;###autoload
(defun multi-term-settings ()
  "Settings for `term'."
  
  ;; (when use-cua
  ;;   (cua-selection-mode 1))
  (setq multi-term-switch-after-close nil)
  (setq multi-term-program "bash"))

(provide 'xy-rc-multi-term)
