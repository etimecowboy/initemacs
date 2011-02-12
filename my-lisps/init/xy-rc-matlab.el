;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-matlab.el'
;; Time-stamp:<2011-02-11 Fri 18:23 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `matlab-emacs' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun matlab-settings ()
  "Settings of `matlab-emacs'."
  (autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
  (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.M\\'" . matlab-mode) auto-mode-alist))
  (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
  (setq matlab-indent-function t)	; if you want function bodies indented
  (setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
  (matlab-cedet-setup)
  (defun my-matlab-mode-hook ()
    (auto-fill-mode 1)
	(setq fill-column 75))
  (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
  ;; (defun my-matlab-shell-mode-hook ()
  ;; '())
  ;; (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
)

;;;###autoload
(defun matlab-face-settings ()
  "Face settings of `matlab-emacs'."

  (custom-set-faces
   '(matlab-cross-function-variable-face
		((t (:foreground "cornflower blue" :slant italic :weight bold))))
   '(matlab-nested-function-keyword-face
		((t (:foreground "Yellow" :slant italic))))))
;;--------------------------------------------------------------------

(provide 'xy-rc-matlab)
