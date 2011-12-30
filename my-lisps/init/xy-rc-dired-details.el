;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dired-details.el'
;; Time-stamp:<2011-12-30 Fri 15:02 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired-details+.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun dired-details-settings ()
  "Settings of `dired-details.el'."
  ;; (dired-details-install) ;; called in `dired-details+'
  (setq dired-details-hide-link-targets nil
        dired-details-initially-hide t
        dired-details-hidden-string "")
  ;; (require 'dired-details+)
  ;; (setq dired-details-propagate-flag t) ;option added by
  ;;                                       ;`dired-details+'
  (message "* ---[ dired-details configuration is complete ]---"))

(provide 'xy-rc-dired-details)
