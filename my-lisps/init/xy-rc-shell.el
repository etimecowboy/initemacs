;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-shell.el'
;; Time-stamp:<2011-12-04 Sun 17:52 xin on P6T-WIN7>
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

;;;###autoload
(defun shell-settings ()
  "Settings for `term'."
  ;; Remove ^M characters
  ;; (add-hook 'comint-output-filter-functions
  ;;          'comint-strip-ctrl-m)
  (require 'ansi-color) ;; Use ansi-color in shell and eshell mode
  ;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (require 'shell-completion) ;; Press tab for completions
  ;; Add command of `shell-command', `shell-command-on-region',
  ;; `compile', `grep', and `background' to shell history file
  (require 'shell-history)

  (message "* ---[ shell-mode configuration is complete ]---")
)

(provide 'xy-rc-shell)
