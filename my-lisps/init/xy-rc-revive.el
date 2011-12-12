;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-revive.el'
;; Time-stamp:<2011-12-11 Sun 16:06 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `revive.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun revive-settings ()
  "Settings of `revive.el'."
  ;; set configuration file location.
  (setq revive:configuration-file (concat my-var-path "/revive-"
                                          user-login-name "@"
                                          system-name "@"
                                          system-configuration))
  (unless (file-exists-p revive:configuration-file)
    (shell-command (concat "touch " revive:configuration-file)))
  (message "* ---[ revive configuration is complete ]---"))

(provide 'xy-rc-revive)
