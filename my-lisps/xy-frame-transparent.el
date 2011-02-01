;;; xy-frame-transparent.el --- Set/toggle frame transparency

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Maintainer: Xin Yang
;; Created: 28 Jan 2011
;; Timestamp:
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Easily set/toggle frame transparency
;; REF: Transparent Emacs
;;      http://www.emacswiki.org/emacs/TransparentEmacs


;;; Code:


;;;###autoload
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha)) 100)
      (set-frame-parameter nil 'alpha '(85 50))
    (set-frame-parameter nil 'alpha '(100 100))))
  
;; A general transparency function:
;; Set transparency of emacs
;;;###autoload
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "Transparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(provide 'xy-frame-transparent)

;; xy-frame-transparent.el ends here
