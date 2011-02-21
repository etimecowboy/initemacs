;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-lisp.el'
;; Time-stamp:<2011-02-21 Mon 04:17 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `lisp.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun lisp-mode-settings ()
  "Settings for `lisp-interaction-mode'."
  ;;Turn on documentation in elisp mode

  (am-add-hooks
   `(lisp-mode-hook lisp-interaction-mode-hook)
   '(progn
	  (turn-on-auto-fill)
	  (turn-on-eldoc-mode))))

;;;###autoload
(defun emacs-lisp-mode-settings ()
  "Settings for `emacs-lisp-mode'."

  ;; Add menu item for emacs-lisp mode
  (add-to-list emacs-lisp-mode-hook 'imenu-add-menubar-index)

  (defun elisp-mode-hook-settings ()
    "Settings for `emacs-lisp-mode-hook'."
    (setq mode-name "Elisp"))

  (add-hook 'emacs-lisp-mode-hook
  			'(lambda ()
			   (progn
				 (elisp-mode-hook-settings)
				 (turn-on-auto-fill)
				 (turn-on-eldoc-mode)
				 (yas-start)
				 (linkd-start)))))

(provide 'xy-rc-lisp.el)
