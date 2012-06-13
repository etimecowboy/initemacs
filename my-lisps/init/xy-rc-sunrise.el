;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sunrise.el'
;; Time-stamp:<2012-06-13 Wed 16:44 xin on p5q>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sunrise.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun sunrise-settings ()
  "Settings of `sunrise.el'."
  (setq ;; sr-avfs-root "~/"
        sr-history-length 100
        sr-show-file-attributes nil
        sr-show-hidden-files t
        sr-windows-default-ratio 50
        sr-window-split-style (quote horizontal))

  (setq sr-start-hook
   (quote (sr-tree-menu-init
           sr-tabs-start-once
           sr-modeline-start-once)))

  (try-require 'sunrise-commander)
  (try-require 'sunrise-x-buttons) ;; cannot be used with popviewer
  (try-require 'sunrise-x-popviewer) ;; cannot be used with buttons
  (sr-popviewer-mode -1)
  (try-require 'sunrise-x-checkpoints)
  (try-require 'sunrise-x-loop)
  (try-require 'sunrise-x-mirror)
  (try-require 'sunrise-x-modeline)
  (try-require 'sunrise-x-tabs)
  (try-require 'sunrise-x-tree)
  (Windows
   (try-require 'sunrise-x-w32-addons))

  (message "* ---[ sunrise configuration is complete ]---"))

(provide 'xy-rc-sunrise)
