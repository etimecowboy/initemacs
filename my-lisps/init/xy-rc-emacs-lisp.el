;;   -*- mode: emacs-emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-emacs-lisp.el'
;; Time-stamp:<2011-02-03 Thu 13:07 xin on p6t>
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
(defun emacs-lisp-mode-settings-4-emaci ()
  "`emacs-lisp-mode' settings for `emaci'."  
  (defvar lisp-modes '(emacs-lisp-mode lisp-mode lisp-interaction-mode) "*Lisp modes.")
  (emaci-add-key-definition
   "." 'find-symbol-at-point
   '(memq major-mode lisp-modes))
  (emaci-add-key-definition
   "," 'find-symbol-go-back
   '(memq major-mode lisp-modes)))

;;;###autoload
(defun emacs-lisp-mode-settings ()
  "Settings for `emacs-lisp-mode'."

  ;; Add menu item for emacs-lisp mode
  (add-to-list emacs-lisp-mode-hook 'imenu-add-menubar-index)

  (eval-after-load "emaci"
    `(emacs-lisp-mode-settings-4-emaci))

  (defun elisp-mode-hook-settings ()
    "Settings for `emacs-lisp-mode-hook'."
    (setq mode-name "Elisp"))
  
  (add-hook 'emacs-lisp-mode-hook 'elisp-mode-hook-settings)

  ;; (eal-define-keys
  ;;  'emaci-mode-map
  ;;  `(("." emaci-.)
  ;;    ("," emaci-\,)))

)


(provide 'xy-rc-emacs-lisp.el)
