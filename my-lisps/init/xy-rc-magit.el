;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-magit.el'
;; Time-stamp:<2011-12-04 Sun 17:28 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `magit' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun magit-settings ()
  "Settings of `magit'."
  (setq magit-log-edit-mode-hook
        '(lambda ()
           (flyspell-mode 1)))
  (eal-define-keys-commonly
   magit-mode-map
   `(("M-n"   magit-show-commit-forward)
       ("M-p"   magit-show-commit-backward)
       ;; ("C-M-h" magit-push)
       ;; ("C-M-l" magit-pull)
       ))
  (message "* ---[ magit configuration is complete ]---")
)

(provide 'xy-rc-magit)
