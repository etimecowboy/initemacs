;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-git.el'
;; Time-stamp:<2011-11-21 Mon 14:28 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `git.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;; TODO: wirte a funtion to auto update all the lisps from EmacsWiki.
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun xy/git-start ()
  "Start `git.el' -- git Emacs gui."
  (interactive)
  (require 'git)
  (require 'git-blame)
  (call-interactively 'git-status))

;;;###autoload
(defun git-settings ()
  "Settings of `git.el'."
)

(provide 'xy-rc-git)
