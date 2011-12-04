;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-diff-git.el'
;; Time-stamp:<2011-12-04 Sun 16:24 xin on P6T-WIN7>
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
  (message "* ---[ diff-git configuration is complete ]---")
)

(provide 'xy-rc-diff-git)
