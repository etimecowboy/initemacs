;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-savehist.el'
;; Time-stamp:<2011-12-11 Sun 21:18 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `savehist.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun savehist-settings ()
  "Settings of `savehist.el'."
  (setq-default savehist-file (concat my-var-path "/savehist-"
                                      user-login-name "@"
                                      system-name "@"
                                      system-configuration))
  (unless (file-exists-p savehist-file)
    (shell-command (concat "touch " savehist-file)))
  (message "* ---[ savehist configuration is complete ]---")
)

(provide 'xy-rc-savehist)
