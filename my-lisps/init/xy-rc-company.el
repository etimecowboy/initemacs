;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-company.el'
;; Time-stamp:<2011-09-03 Sat 23:38 xin on P6T-WIN7>
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
  (am-add-hooks
   `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook
						java-mode-hook lisp-interaction-mode-hook sh-mode-hook
						,(if (not is-before-emacs-21) 'awk-mode-hook) ruby-mode-hook)
   'company-mode)
)
  
(provide 'xy-rc-company)
