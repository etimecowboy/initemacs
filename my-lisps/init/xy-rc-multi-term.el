;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-multi-term.el'
;; Time-stamp:<2011-12-04 Sun 17:33 xin on P6T-WIN7>
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
(defun xy/multi-term-start ()
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
  (setq multi-term-program "bash")
  (message "* ---[ multi-term configuration is complete ]---")
)

(provide 'xy-rc-multi-term)
