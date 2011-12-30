;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ecb.el'
;; Time-stamp:<2011-12-30 Fri 19:45 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ecb.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun xy/ecb-start ()
  "Start ECB."
  (interactive)
  (xy/cedet-start)
  (require 'ecb-autoloads)
  (ecb-activate)
  (ecb-layout-switch "left-analyse"))

;;;###autoload
(defun ecb-settings ()
  "Settings for `ecb'."
  (setq-default ecb-auto-compatibility-check nil
                ecb-tip-of-the-day nil
                ecb-options-version "2.40")
  (setq ecb-compile-window-height 10
        ecb-compile-window-width  'edit-window
        ;; ecb-layout-name "leftright-analyse"
  )
  (Windows
   (setq ecb-source-path
         '("~/work" "~/Dropbox/phdwork")))
  (GNULinux
   (setq ecb-source-path
         '("~/work" "~/Dropbox/phdwork")))
  (message "* ---[ ecb configuration is complete ]---"))

(provide 'xy-rc-ecb)
