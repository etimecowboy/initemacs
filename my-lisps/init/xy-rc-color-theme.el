;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-color-theme.el'
;; Time-stamp:<2011-09-09 Fri 13:14 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `color-theme.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; REF:  http://orgmode.org/worg/org-color-themes.html

;;;###autoload
(defun color-theme-start ()
  "Start color-theme."

  (interactive)
  (setq color-theme-is-global t)
  (color-theme-initialize)
  (color-theme-manoj-xy-dark)
  ;; (color-theme-blackboard)
  )

;;;###autoload
(defun color-theme-settings ()
  "Settings of `color-theme.el'."

  ;; (setq my-color-themes (list
  ;; 						 'color-theme-tangotango
  ;; 						 'color-theme-colorful-obsolescence
  ;; 						 'color-theme-zenburn
  ;; 						 'color-theme-leuven
  ;; 						 'color-theme-folio 
  ;; 						 'color-theme-manoj
  ;; 						 'color-theme-zenash
  ;; 						 'color-theme-railscast
  ;; 						 ))

  ;; (defun my-theme-set-default () ; Set the first row
  ;; 	(interactive)
  ;; 	(setq theme-current my-color-themes)
  ;; 	(funcall (car theme-current)))

  ;; (defun my-describe-theme () ; Show the current theme
  ;; 	(interactive)
  ;; 	(message "%s" (car theme-current)))

  ;; ; Set the next theme (fixed by Chris Webber - tanks)
  ;; (defun my-theme-cycle ()            
  ;; 	(interactive)
  ;; 	(setq theme-current (cdr theme-current))
  ;; 	(if (null theme-current)
  ;; 		(setq theme-current my-color-themes))
  ;; 	(funcall (car theme-current))
  ;; 	(message "%S" (car theme-current)))

  ;; (setq theme-current my-color-themes)
  ;; (setq color-theme-is-global nil) ; Initialization
  ;; (my-theme-set-default)
  ;; (global-set-key [f4] 'my-theme-cycle)
)

(provide 'xy-rc-color-theme)
