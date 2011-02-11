;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-linkd.el'
;; Time-stamp:<2011-02-11 Fri 17:17 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `linkd.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun linkd-settings ()
  "settings for `linkd'."
  (setq linkd-use-icons t)
  (setq linkd-icons-directory 
	(concat my-local-image-path "/linkd"))
  (am-add-hooks
   `(test-mode-hook org-mode-hook
	emacs-lisp-mode-hook lisp-interaction-mode-hook
	c-mode-hook c++-mode-hook sh-mode-hook
	vhdl-mode-hook verilog-mode-hook)
   (lambda ()
	 (linkd-mode 1)
	 (linkd-enable)
	 )))

;;;###autoload
(defun linkd-face-settings ()
  "face settings for `linkd'."
  (set-face-foreground 'linkd-generic-link "yellow"))

(provide 'xy-rc-linkd)
