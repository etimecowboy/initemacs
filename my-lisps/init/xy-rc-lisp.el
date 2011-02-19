;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-lisp.el'
;; Time-stamp:<2011-02-19 Sat 22:36 xin on p6t>
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
(defun lisp-interaction-mode-settings ()
  "Settings for `lisp-interaction-mode'."
  ;;Turn on documentation in elisp mode
  (add-hook 'emacs-lisp-interaction-mode-hook
			'(lambda ()
			   (turn-on-auto-fill)
			   (turn-on-eldoc-mode)
			   (yas-start)))
)

;;;###autoload
(defun emacs-lisp-mode-settings ()
  "Settings for `emacs-lisp-mode'."

  (defun elisp-mode-hook-settings ()
    "Settings for `emacs-lisp-mode-hook'."
    (setq mode-name "Elisp"))

  (add-hook 'emacs-lisp-mode-hook
			'(lambda ()
			   (elisp-mode-hook-settings)
			   (turn-on-eldoc-mode)
			   (turn-on-auto-fill)
			   (yas-start))))

(provide 'xy-rc-lisp.el)
