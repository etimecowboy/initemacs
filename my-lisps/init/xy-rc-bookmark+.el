;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-bookmark+.el'
;; Time-stamp:<2012-05-13 Sun 14:37 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `bookmark+.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun bookmark+-settings ()
  "Settings of `bookmark+.el'."
  (setq bmkp-bmenu-commands-file
        (concat my-var-path "/emacs-bmk-bmenu-commands.el"))
  (setq bmkp-bmenu-state-file
        (concat my-var-path "/emacs-bmk-bmenu-state.el"))
  (setq bmkp-last-as-first-bookmark-file
        (concat my-var-path "/bookmark-"
                user-login-name "@"
                system-name "@"
                system-configuration))
  (unless (file-exists-p bmkp-last-as-first-bookmark-file)
    (shell-command (concat "touch " bmkp-last-as-first-bookmark-file)))
  (message "* ---[ bookmark+ configuration is complete ]---"))

(provide 'xy-rc-bookmark+)
