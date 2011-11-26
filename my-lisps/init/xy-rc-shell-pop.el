;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-shell-pop.el'
;; Time-stamp:<2011-11-26 Sat 03:02 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `shell-pop.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun shell-pop-settings ()
  "Settings for `shell-pop.el'."

  (shell-pop-set-internal-mode "eshell")
  ;; (shell-pop-set-internal-mode-shell "/bin/bash")
  ;; the number for the percentage of the selected window.
  ;; If 100, shell-pop use the whole of selected window, not spliting.
  (shell-pop-set-window-height 35)
  ;; shell-pop-up position. You can choose "top" or "bottom".
  (shell-pop-set-window-position "bottom"))

(provide 'xy-rc-shell-pop)
