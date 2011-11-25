;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-magit.el'
;; Time-stamp:<2011-11-25 Fri 15:49 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `magit' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun magit-settings ()
  "Settings of `magit'."

  (setq magit-log-edit-mode-hook
		'(lambda ()
		   (flyspell-mode 1)))
  (eal-define-keys-commonly 
   magit-mode-map
   `(("M-n"   magit-show-commit-forward)
	 ("M-p"   magit-show-commit-backward)
	 ("C-M-h" magit-push)
	 ("C-M-l" magit-pull)
	 ))
)

(provide 'xy-rc-magit)
