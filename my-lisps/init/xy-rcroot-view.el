;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-view.el'
;; Time-stamp:<2011-12-06 Tue 08:04 xin on P6T-WIN7>
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

;;====================================================================
;;* View files

;; Revisit files in GBK encoding
;; (global-set-key (kbd "S-<f5>") 'revert-buffer)
(global-set-key (kbd "M-S-<f5>") 'gbk-revert)

;; Allow to view read-only files
(setq view-read-only t)
;; (toggle-read-only t)

;;--------------------------------------------------------------------
;;** view-mode settings
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
(eval-after-load "view"
  '(progn
     (view-mode-settings)))

;;--------------------------------------------------------------------
;;** doc-view
;; 把pdf,ps,dvi文件转换为png格式, 在Emacs里面浏览
(eval-after-load "doc-view"
  '(progn
     (doc-view-settings)))

;;--------------------------------------------------------------------
;;** log-view
;; (eval-after-load "log-view"
;;   '(progn
;;     (log-view-face-settings))) ;; TODO: to my theme

;;--------------------------------------------------------------------
;;** Emaci
;; Emacs才是世界上最强大的IDE － 用Emaci阅读文件
;; REF: (@url :file-name "http://emacser.com/emaci.htm" :display "emacser")
;; (require 'emaci)
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

(defun read-only ()
  "Read-only mode."
  (interactive)
  (emaci-mode-on)
  (view-mode t))

(defun normal-edit ()
  "Normal edit mode."
  (interactive)
  (View-quit)
  (emaci-mode-off))

;; (add-hook 'find-file-hook 'read-only)
(eal-define-keys-commonly
 global-map
 ;; `(("C-x q" switch-major-mode-with-emaci)
 ;; ("M-s" emaci-mode-on)
 ;; ("M-S" emaci-mode-off)))
 `(("M-s" read-only)
   ("M-S" normal-edit)))

;;--------------------------------------------------------------------
;;** hexl-mode
(add-to-list 'auto-mode-alist
             '("\\.\\(exe\\|vsd\\|so\\|dll\\)$" . hexl-mode))

;;====================================================================
;;* Compare buffers/files

;;** diff
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
     ;; (diff-face-settings) ;; TODO: to my theme
     (diff-settings)))

;;--------------------------------------------------------------------
;;** ediff
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
     ;; (ediff-face-settings) ;; TODO: to my theme
     (ediff-settings)))

;;====================================================================
;;* Grep related settings

;;** Use grep in Emacs
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

;;--------------------------------------------------------------------
;;** full-ack
;; ack is a tool like grep, designed for programmers with large trees
;; of heterogeneous source code.
;; ack is written purely in Perl, and takes advantage of the power of
;; Perl's regular expressions.
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
;;** color-moccur
;; With color-moccur, you can search a regexp in all buffers. And you
;; can search files like grep(-find) without grep (and find) command.
;; (require 'color-moccur)
;; (eal-define-keys-commonly
;;  'global-map
;;  `(("C-x C-u" occur-by-moccur-displn)
;;    ("C-x M-U" occur-by-moccur-at-point-displn)))
;; (eal-define-keys
;;  'isearch-mode-map
;;  `(("C-x P" isearch-moccur-displn)))
(autoload 'moccur-grep-find "color-moccur" nil t)
(autoload 'occur-by-moccur-displn "color-moccur" nil t)
(autoload 'occur-by-moccur-at-point-displn "color-moccur" nil t)
(eval-after-load "color-moccur"
  '(progn
     ;; (moccur-face-settings) ;; TODO: to my theme
     (moccur-settings)))
(global-set-key (kbd "C-<f7>") 'moccur-grep-find)
;; (global-set-key [C-f7] 'dmoccur)
;; (global-set-key (kbd "C-x O f") 'occur-by-moccur-displn)
;; (global-set-key (kbd "C-x O p") 'occur-by-moccur-at-point-displn)

;;--------------------------------------------------------------------
;;** ioccur
;; incremental occur, more convenient and faster than OccurMode,
;; which lists all lines of the current buffer that match a regexp.
;; This is ahei's ioccur which uses anything, not the emacswiki one.
(autoload 'ioccur "ioccur" "Incremental occur by ahei." t)
(global-set-key (kbd "M-<f7>") 'ioccur)

;;--------------------------------------------------------------------

(provide 'xy-rcroot-view)
