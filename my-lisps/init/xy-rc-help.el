;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-help.el'
;; Time-stamp:<2011-12-04 Sun 16:56 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `help-mode' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun goto-help-buffer ()
  "Goto *Help* buffer."
  (interactive)
  (let ((buffer (get-buffer "*Help*")))
    (if buffer
        (switch-to-buffer buffer)
      (message "*Help* buffer dose not exist!"))))

;;;###autoload
(defun help-mode-settings ()
  "settings of `help-mode'."
  (def-turn-on "view-mode" nil)
  (am-add-hooks 'help-mode-hook 'view-mode-off)
  (message "* ---[ help configuration is complete ]---")
)

;; ;;;###autoload
;; (defun help-mode-face-settings ()
;;   "Face settings for `help-mode'."
;;   (unless is-before-emacs-21
;;     (set-face-foreground 'help-argument-name "green")))

(provide 'xy-rc-help)
