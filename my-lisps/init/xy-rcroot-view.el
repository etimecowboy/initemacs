;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-view.el'
;; Time-stamp:<2011-01-29 Sat 10:24 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  View files in Emacs
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; Allow to view read-only files
(setq view-read-only t)

;; View mode settings
;; (eal-define-keys
;;  'view-mode-map
;;  `(("U"           View-scroll-page-backward)
;;    ("/"           describe-symbol-at-point)
;;    ("\C-j"        goto-line)
;;    ("'"           switch-to-other-buffer)
;;    ("m"           back-to-indentation)
;;    ("p"           previous-line-or-backward-button)
;;    ("Q"           delete-current-window)
;;    ("L"           count-brf-lines)
;;    ("1"           delete-other-windows)
;;    ("t"           sb-toggle-keep-buffer)
;;    ("<backspace>" c-electric-backspace)
;;    ("u"           View-scroll-half-page-backward)
;;    ("S-SPC"       View-scroll-half-page-backward)
;;    ("SPC"         View-scroll-half-page-forward)
;;    ("w"           scroll-down)
;;    ("d"           scroll-up)
;;    (","           find-symbol-go-back)
;;    ("1"           delete-other-windows)
;;    ("2"           split-window-vertically)
;;    ("3"           split-window-horizontally)
;;    ("B"           eval-buffer)))

(eval-after-load "view" `(view-mode-settings))

;;---------------------------------------------------------------------------------

;; 把文件或buffer彩色输出成html
(try-require 'htmlize)

;;---------------------------------------------------------------------------------

;; 把pdf,ps,dvi文件转换为png格式, 在Emacs里面浏览
;; (if is-after-emacs-23
;;    (require 'doc-view)
;;    (setq doc-view-conversion-refresh-interval 3)
;;    (setq doc-view-continuous t)
;; )

;;---------------------------------------------------------------------------------

;; Emacs才是世界上最强大的IDE － 用Emaci阅读文件
;; http://emacser.com/emaci.htm

;; (try-require 'emaci)

(eal-define-keys-commonly
 global-map
 `(("C-x q" switch-major-mode-with-emaci)
   ("M-s" emaci-mode-on)
   ("M-S" emaci-mode-off)))

(eal-define-keys
 'emaci-mode-map
 `(("/" describe-symbol-at-point)
   ("'" switch-to-other-buffer)
   ("L" count-brf-lines)
   ;; ("t" sb-toggle-keep-buffer)
   ("]" goto-paren)))

(eval-after-load "emaci" 
  `(emaci-settings))

;;-----------------------------------------------------------------------

;; log viewing face settings

(eval-after-load "log-view"
  `(log-view-face-settings))

;;-----------------------------------------------------------------------

;; conf-mode settings

;; ;;;###autoload
;; (defun conf-mode-settings ()
;;   "Settings for `conf-mode'.")

;; (eval-after-load "conf-mode"
;;   `(conf-mode-settings))

;;----------------------------------------------------------------------

(provide 'xy-rcroot-view)
