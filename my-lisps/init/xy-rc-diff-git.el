;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-diff-git.el'
;; Time-stamp:<2011-11-26 Sat 02:54 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `diff-git.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun diff-git-settings ()
  "Settings of `diff-git.el'."

  (require 'diff-git)
  (require 'diff-mode)
  (require 'vc)
  (require 'vc-hooks)
  (require 'vc-dispatcher)
  (require 'magit)
  (diff-git-default-bindings)
)

(provide 'xy-rc-diff-git)
