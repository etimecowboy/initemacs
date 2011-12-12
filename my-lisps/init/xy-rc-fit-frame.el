;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-fit-frame.el'
;; Time-stamp:<2011-12-11 Sun 21:12 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `fit-frame.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun fit-frame-settings ()
  ;;  Add menu-bar items
  (defvar menu-bar-frames-menu (make-sparse-keymap "Frames"))
  (define-key global-map [menu-bar frames]
    (cons "Frames" menu-bar-frames-menu))
  (define-key menu-bar-frames-menu [fit-frame]
    '("Fit This Frame" . fit-frame))
  ;; (add-hook 'after-make-frame-functions 'fit-frame)
  ;; (add-hook 'temp-buffer-show-hook
  ;;           'fit-frame-if-one-window 'append)
  ;; (global-set-key [vertical-line down-mouse-1]
  ;;                 'fit-frame-or-mouse-drag-vertical-line)
  (message "* ---[ fit-frame configuration is complete ]---"))

(provide 'xy-rc-fit-frame)
