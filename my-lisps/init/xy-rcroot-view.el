;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-view.el'
;; Time-stamp:<2011-02-19 Sat 17:50 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Viewing files in Emacs
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; View files
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Allow to view read-only files
(setq view-read-only t)

;;--------------------------------------------------------------

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

;;-----------------------------------------------------------------

;; 把pdf,ps,dvi文件转换为png格式, 在Emacs里面浏览
(if is-after-emacs-23
    (eval-after-load "doc-view" `(doc-view-settings)))

;;-----------------------------------------------------------------

;; Emacs才是世界上最强大的IDE － 用Emaci阅读文件
;; http://emacser.com/emaci.htm
;; (require 'emaci)
(eal-define-keys-commonly
 global-map
 `(("C-x q" switch-major-mode-with-emaci)
   ("M-s" emaci-mode-on)
   ("M-S" emaci-mode-off)))
(eval-after-load "emaci"
  '(progn
	 (emaci-settings)
	 (eal-define-keys
	  'emaci-mode-map
	  `(("/" describe-symbol-at-point)
		("'" switch-to-other-buffer)
		("L" count-brf-lines)
		;; ("t" sb-toggle-keep-buffer)
		("]" goto-paren)))))

;;---------------------------------------------------------------

;; log viewing face settings
(eval-after-load "log-view"
  `(log-view-face-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Compare buffers/files
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; diff-mode
;; (eal-define-keys
;;  'diff-mode-map
;;  `(("C-k" diff-hunk-kill)
;;    ("SPC" scroll-up)
;;    ("'"   switch-to-other-buffer)
;;    ("Q"   kill-this-buffer)
;;    ("u"   View-scroll-half-page-backward)))
;; (eal-define-keys
;;  'diff-mode-shared-map
;;  `(("k" previous-line)
;;    ("K" roll-up)))
(eval-after-load "diff-mode"
  '(progn
     (diff-face-settings)
     (diff-settings)))

;;---------------------------------------------------------------

;; ediff mode
(global-set-key (kbd "C-x D") 'ediff)
;; (defun ediff-keys ()
;;   (interactive)
;;   "`ediff-mode'的按键设置"
;;   (define-prefix-command 'ediff-R-map)
;;   (define-key-list
;;     ediff-mode-map
;;     `(("# w" ediff+-toggle-ignore-whitespace)
;;       ("u"   ediff-update-diffs)
;;       ("/"   ediff-toggle-help)
;;       ("c"   ediff-inferior-compare-regions)
;;       ("f"   ediff-jump-to-difference)
;;       ("j"   ediff+-previous-line)
;;       ("k"   ediff-scroll-vertically)
;;       ("R"   ediff-R-map)
;;       ("R a" ediff-toggle-read-only)
;;       ("R b" ediff-toggle-read-only)
;;       ("o"   other-window)
;;       ("A"   ediff+-goto-buffer-a)
;;       ("B"   ediff+-goto-buffer-b))))
;; (add-hook 'ediff-keymap-setup-hook 'ediff-keys)
(eval-after-load "ediff"
  '(progn
     (ediff-face-settings)
     (ediff-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Grep related settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use grep in Emacs
;; (unless is-before-emacs-21
;;   (eal-define-keys-commonly
;;    global-map
;;    `(("C-x F"   find-grep-in-current-dir)
;;      ("C-x f"   find-grep-in-dir)
;;      ("C-x M-f" find-grep-current-word-in-current-dir)
;;      ("C-x M-F" find-grep-current-word)))
;;   (eal-define-keys
;;    'grep-mode-map
;;    `(("q"     bury-buffer)
;;      ("Q"     kill-this-buffer)
;;      ("1"     delete-other-windows)
;;      ("<"     beginning-of-buffer)
;;      (">"     end-of-buffer)
;;      ("'"     switch-to-other-buffer)
;;      ("u"     scroll-down)
;;      ("S-SPC" View-scroll-half-page-backward)
;;      ("SPC"   View-scroll-half-page-forward)
;;      ("/"     describe-symbol-at-point)
;;      ("t"     sb-toggle-keep-buffer)
;;      ("N"     select-buffer-forward)
;;      ("P"     select-buffer-backward)
;;      ("L"     count-brf-lines))))
;; (eval-after-load "grep" `(grep-settings))

;;-------------------------------------------------------------------

;; full-ack, grep 纯 perl 代替
;; (require 'full-ack)
;; (eal-define-keys
;;  'ack-mode-map
;;  `(("j"   next-line)
;;    ("k"   previous-line)
;;    ("h"   backward-char)
;;    ("l"   forward-char)
;;    ("u"   View-scroll-half-page-backward)
;;    ("SPC" View-scroll-page-forward)
;;    ("o"   other-window)
;;    ("g"   beginning-of-buffer)
;;    ("G"   end-of-buffer)
;;    (">"   end-of-buffer)
;;    ("<"   beginning-of-buffer)
;;    ("1"   delete-other-windows)
;;    ("'"   switch-to-other-buffer)
;;    ("Q"   kill-this-buffer)))
;; (eval-after-load "full-ack" `(full-ack-settings))

;;--------------------------------------------------------------------

;; color-moccur,
;; With color-moccur, you can search a regexp in all buffers. And you
;; can search files like grep(-find) without grep (and find) command.
(require 'color-moccur)

;; (eal-define-keys-commonly
;;  'global-map
;;  `(("C-x C-u" occur-by-moccur-displn)
;;    ("C-x M-U" occur-by-moccur-at-point-displn)))

;; (eal-define-keys
;;  'isearch-mode-map
;;  `(("C-x P" isearch-moccur-displn)))

(eval-after-load "color-moccur"
  '(progn 
     (moccur-face-settings)
     (moccur-settings)))

(global-set-key [C-f7] 'moccur-grep-find)

;;-------------------------------------------------------------------

;; ioccur, incremental occur, more convenient and faster than OccurMode,
;; which lists all lines of the current buffer that match a regexp.
(require 'ioccur)

;;------------------------------------------------------------------

(provide 'xy-rcroot-view)
