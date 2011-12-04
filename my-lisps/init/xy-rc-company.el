;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-company.el'
;; Time-stamp:<2011-12-04 Sun 16:21 xin on P6T-WIN7>
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
  (message "* ---[ company configuration is complete ]---")
)

(provide 'xy-rc-company)
