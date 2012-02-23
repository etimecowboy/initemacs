;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ecb.el'
;; Time-stamp:<2012-02-23 Thu 20:34 xin on P6T-WIN7>
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
  (setq stack-trace-on-error t) ;; BUG: fix emacs24 ((@url :file-name "http://lists.gnu.org/archive/html/help-gnu-emacs/2011-09/msg00192.html" :display "REF"))
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
