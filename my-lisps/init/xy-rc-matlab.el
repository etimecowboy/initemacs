;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-matlab.el'
;; Time-stamp:<2011-12-30 Fri 06:41 xin on p6t>
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

;; ;;;###autoload
;; (defun xy/matlab-cedet-start ()
;;   "Start cedet support for matlab-emacs"
;;   (interactive)
;;   (matlab-cedet-setup)
;;   (xy/cedet-start))

;; ;;;###autoload
;; (defun xy/matlab-ecb-start ()
;;   "Start ecb support for matlab-emacs"
;;   (interactive)
;;   (xy/matlab-cedet-start)
;;   (require 'ecb-autoloads)
;;   (ecb-activate)
;;   (ecb-layout-switch "left-analyse"))

;;;###autoload
(defun matlab-settings ()
  "Settings of `matlab-emacs'."

  ;; `matlab-emacs'
  ;; NOTE: matlab-emcs has not been updated for more than 2 years, so
  ;; some parts of the code are out-dated, and may not works well with
  ;; the latest `CEDET'.
  (require 'matlab-load)
  
  ;; load files of recent version `CEDET' in ~/.emacs.d/lisps
  ;; instead of the old version shipped with GNU Emacs.
  (autoload 'srecode-template-mode "srecode-template-mode" nil t)

  ;; (server-start) ;; server must be started for backtracing errors
                    ;; BUG: backtrace does not work

  (setq matlab-indent-function t)    ; if you want function bodies indented
  (setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
  (matlab-cedet-setup)
  (message "* ---[ matlab configuration is complete ]---"))

;; ;;;###autoload
;; (defun matlab-face-settings ()
;;   "Face settings of `matlab-emacs'."
;;   (custom-set-faces
;;    '(matlab-cross-function-variable-face
;;         ((t (:foreground "cornflower blue" :slant italic :weight bold))))
;;    '(matlab-nested-function-keyword-face
;;         ((t (:foreground "Yellow" :slant italic))))))

(provide 'xy-rc-matlab)

;; (defun my-matlab-mode-hook ()
;;   (turn-on-auto-fill)
;;     (setq fill-column 75))
;; (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;; (defun my-matlab-shell-mode-hook ()
;; '())
;; (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
