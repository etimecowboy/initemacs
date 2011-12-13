;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-bookmark+.el'
;; Time-stamp:<2011-12-13 Tue 10:36 xin on P6T-WIN7>
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
        (concat my-var-path "/emacs.bmk"))
  (message "* ---[ bookmark+ configuration is complete ]---"))

(provide 'xy-rc-bookmark+)
