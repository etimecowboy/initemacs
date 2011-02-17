;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-lisp.el'
;; Time-stamp:<2011-02-17 Thu 12:06 xin on P6T>
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
  (add-hook 'emacs-lisp-mode-hook
			'(lambda ()
			   (turn-on-eldoc-mode)))
)

;;;###autoload
(defun emacs-lisp-mode-settings ()
  "Settings for `emacs-lisp-mode'."

  (defun elisp-mode-hook-settings ()
    "Settings for `emacs-lisp-mode-hook'."
    (setq mode-name "Elisp"))

  (add-hook 'emacs-lisp-mode-hook 'elisp-mode-hook-settings))


(provide 'xy-rc-lisp.el)
