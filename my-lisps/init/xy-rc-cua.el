;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-cua.el'
;; Time-stamp:<2011-11-23 Wed 04:52 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `cua' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun cua-settings ()
  "settings for `cua'."

  (setq cua-rectangle-mark-key [C-RET]) ;; default is [C-RET]
  (setq cua-keep-region-after-copy t)
  (setq cua-remap-control-z nil)
  (setq cua-remap-control-v nil)
  (define-key cua--cua-keys-keymap [(control z)] nil)
  (define-key cua--cua-keys-keymap [(control v)] nil)
  (define-key cua--cua-keys-keymap [(meta v)] nil)
  (setq pc-select-selection-keys-only t)
  (pc-selection-mode 1)

;;   (apply-args-list-to-fun
;;    'def-mark-move-command
;;    `("cua-resize-rectangle-down"
;;      "cua-resize-rectangle-up"
;;      "cua-resize-rectangle-right"
;;      "cua-resize-rectangle-left"
;;      "cua-resize-rectangle-top"
;;      "cua-resize-rectangle-page-up"
;;      "cua-resize-rectangle-page-down"
;;      "cua-resize-rectangle-bot"))

;;   (autoload 'cua--init-rectangles "cua-rect")

;;   (cua--init-rectangles)

;;   (eal-define-keys
;;    'cua--rectangle-keymap
;;    `(("M-f"     forward-word-remember)
;;      ("M-b"     backward-word-remember)
;;      ("C-c C-f" cua-fill-char-rectangle)
;;      ("'"       cua-insert-char-rectangle)
;;      ("<right>" cua-resize-rectangle-right)
;;      ("<left>"  cua-resize-rectangle-left)
;;      ("<down"   cua-resize-rectangle-down)
;;      ("<up>"    cua-resize-rectangle-up)))
  )

(provide 'xy-rc-cua)
