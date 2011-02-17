;;   -*- mode: emacs-emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-emacs-lisp.el'
;; Time-stamp:<2011-02-17 Thu 12:13 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `emacs-lisp.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun emacs-lisp-mode-settings ()
  "Settings for `emacs-lisp-mode'."

  ;; Add menu item for emacs-lisp mode
  (add-to-list emacs-lisp-mode-hook 'imenu-add-menubar-index)

  (defun elisp-mode-hook-settings ()
    "Settings for `emacs-lisp-mode-hook'."
    (setq mode-name "Elisp"))
  
  (add-hook 'emacs-lisp-mode-hook 'elisp-mode-hook-settings)
)


(provide 'xy-rc-emacs-lisp.el)
