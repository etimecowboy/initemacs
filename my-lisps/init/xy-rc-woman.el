;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-woman.el'
;; Time-stamp:<2011-11-26 Sat 03:04 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `woman' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun woman-settings ()
  "Settings for `woman-mode'."
  (add-to-list 'woman-manpath "~/.emacs.d/man")
  (setq woman-cache-filename (concat my-var-path "/wmncach"))
  (setq woman-use-own-frame t)
  (setq woman-fill-column 100)

  (defun woman-mode-hook-settings ()
    "Settings for `woman-mode'."
    (setq truncate-lines nil))
  (am-add-hooks 'woman-mode-hook 'woman-mode-hook-settings))

;;;###autoload
(defun woman-face-settings ()
  "Face settings for `woman'."
  (set-face-foreground 'woman-italic "green")
  (set-face-foreground 'woman-bold "red")
  (custom-set-faces
   '(woman-bold
     ((((class color)) :foreground "red" :bold nil))))
  (set-face-foreground 'woman-addition "yellow")
  (set-face-foreground 'woman-unknown "blue"))

(provide 'xy-rc-woman)
