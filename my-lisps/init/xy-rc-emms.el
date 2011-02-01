;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-emms.el'
;; Time-stamp:<2011-01-31 Mon 00:12 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `emms.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun init-emms ()
  "Initial emms"
  (interactive)
  (when (not (featurep 'emms-setup))
    (require 'emms-setup)
    (emms-standard)
    (emms-default-players)
    (setq emms-repeat-playlist t)
    (require 'emms-mode-line)
    (emms-mode-line 1)
    (emms-mode-line-blank)
    (require 'emms-playing-time)
    (emms-playing-time 1)))

;;;###autoload
(defadvice emms (before init-emms activate)
  "Initial emms first."
  (init-emms))

;;;###autoload
(defun emms-dir-tree ()
  "Switch to the current emms-playlist buffer, and query for a directory tree."
  (interactive)
  (init-emms)
  (if (or (null emms-playlist-buffer)
          (not (buffer-live-p emms-playlist-buffer)))
      (call-interactively 'emms-play-directory-tree))
  (emms-playlist-mode-go))

;;;###autoload
(defun emms-settings ()
  "Settings of `emms.el'."
)

(provide 'xy-emms.el)
