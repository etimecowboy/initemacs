;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-shell.el'
;; Time-stamp:<2011-11-26 Sat 03:02 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `shell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

(defun shell-settings ()
  "Settings for `term'."

  ;; Remove ^M characters
  ;; (add-hook 'comint-output-filter-functions
  ;;          'comint-strip-ctrl-m)

  ;; Use ansi-color in shell and eshell mode
  (require 'ansi-color)
  ;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  ;; Press tab for completions
  (require 'shell-completion)

  ;; Add command of `shell-command', `shell-command-on-region',
  ;; `compile', `grep', and `background' to shell history file

  (require 'shell-history))

(provide 'xy-rc-shell)
