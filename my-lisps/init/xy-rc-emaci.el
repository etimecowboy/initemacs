;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-emaci.el'
;; Time-stamp:<2011-11-26 Sat 02:55 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `emaci.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun emacs-lisp-mode-settings-4-emaci ()
;;   "`emacs-lisp-mode' settings for `emaci'."
;;   (defvar lisp-modes '(emacs-lisp-mode lisp-mode lisp-interaction-mode) "*Lisp modes.")
;;   (emaci-add-key-definition
;;    "." 'find-symbol-at-point
;;    '(memq major-mode lisp-modes))
;;   (emaci-add-key-definition
;;    "," 'find-symbol-go-back
;;    '(memq major-mode lisp-modes)))

;; (eal-define-keys
;;  'emaci-mode-map
;;  `(("." emaci-.)
;;    ("," emaci-\,)))

;; (eval-after-load "emaci"
;;   `(emacs-lisp-mode-settings-4-emaci))

;;;###autoload
(defun emaci-settings ()
  "settings for `emaci'."

  ;; (setq emaci-brief-key-defs
  ;;       (append emaci-brief-key-defs
  ;;               `(("]" goto-paren))))
  ;; (emaci-bind-brief-keys)
)

;;;###autoload
(defun switch-major-mode-with-emaci ()
  "Run `switch-major-mode' with `emaci-mode'."
  (interactive)
  (let ((emaci emaci-mode))
    (call-interactively 'switch-major-mode)
    (emaci-mode (if emaci 1 -1))))

(provide 'xy-rc-emaci)
