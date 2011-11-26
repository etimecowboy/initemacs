;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-recentf.el'
;; Time-stamp:<2011-11-26 Sat 03:02 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `recentf.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun recentf-settings ()
  "Settings of `recentf.el'."

  (setq-default recentf-save-file
                  (concat my-var-path "/recentf-"
                          user-login-name "@"
                          system-name "@"
                          system-configuration))
  (setq recentf-exclude '("bbdb" "gnus" "mew" "w3m" "gtd"))
  (setq recentf-menu-open-all-flag t)
  (setq recentf-max-saved-items 100)
  (setq recentf-max-menu-items 20)
  (setq recentf-menu-filter 'recentf-sort-basenames-ascending)
  (setq recentf-save-file-modes 5000)

  (defadvice recentf-track-closed-file (after push-beginning activate)
    "Move current buffer to the beginning of the recent list after killed."
    (recentf-track-opened-file))

  (defun undo-kill-buffer (arg)
    "Re-open the last buffer killed. With ARG, re-open the nth buffer."
    (interactive "p")
    (let ((recently-killed-list (copy-sequence recentf-list))
          (buffer-files-list
           (delq nil (mapcar (lambda (buf)
                               (when (buffer-file-name buf)
                                 (expand-file-name (buffer-file-name buf))))
                             (buffer-list)))))
      (mapc
       (lambda (buf-file)
         (setq recently-killed-list
               (delete buf-file recently-killed-list)))
       buffer-files-list)
      (find-file (nth (- arg 1) recently-killed-list))))
  )

(provide 'xy-rc-recentf)
