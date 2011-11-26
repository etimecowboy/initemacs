;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-company.el'
;; Time-stamp:<2011-11-26 Sat 02:53 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `company.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun company-settings ()
  "Settings of `company'."

  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-begin-commands '(self-insert-command))
  (define-key company-mode-map
    (kbd "M-RET") 'company-expand-top)
)

(provide 'xy-rc-company)
