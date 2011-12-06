;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-filemgr.el'
;; Time-stamp:<2011-12-06 Tue 20:19 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  File management packages settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;====================================================================
;;* Buffer management

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;--------------------------------------------------------------------
;;** ibuffer
(eval-after-load "ibuffer"
  '(progn
     (ibuffer-settings)))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;--------------------------------------------------------------------
;;** uniquify
;; 可以为重名的 buffer 在前面加上其父目录的名字来让名字区分开来，
;; 而不是单纯的加一个没有太多意义的序号
(require 'uniquify)
(eval-after-load "uniquify"
  '(progn
     (uniquify-settings)))

;;====================================================================
;;* File management

;;** dired
(eval-after-load "dired"
  '(progn
     (dired-settings)))

(eal-define-keys-commonly
 global-map
 `(("C-x d" dired-jump)))

(eal-define-keys
 'dired-mode-map
    `(("C-c C-x 3" dired-two-columns)
      ;; ("M-b s"    dired-sort-by-size)
      ;; ("M-b x"    dired-sort-by-extension)
      ;; ("M-b t"    dired-sort-by-time)
      ;; ("M-b n"    dired-sort-by-name)
      ("M-o"       dired-omit-mode)
      ("E"         dired-ediff)
      ("C-M-/"     dired-undo
      ;; ("C-M-?"     dired-redo)
      ("C-M-k"     dired-do-delete)
      ("M-q"       ywb-dired-quickview)
      ("/m"        ywb-dired-filter-regexp)
      ("/."        ywb-dired-filter-extension)
      ;; ("M->"       wuxch-dired-goto-last-line)
      ;; ("M-<"       wuxch-dired-goto-first-line)
      ;; ("M-w"       wuxch-dired-copy)
      ;; ("C-y"       wuxch-dired-paste)
      ;; ("M-k"       wuxch-dired-cut)
      )))

;;--------------------------------------------------------------------
;;** image-dired
(eval-after-load "image-dired"
  '(progn
    (image-dired-settings)))

;;--------------------------------------------------------------------
;;** thumbs
;; Thumbnails previewer for images files
(eval-after-load "thumbs"
  '(progn
     (thumbs-settings)))

;;--------------------------------------------------------------------
;;** Sunrise commander; file manager
;; BUG: NOT work properly with other dired lisps. Removed.
;; Check (@url :file-name "http://www.emacswiki.org/emacs/Sunrise_Commander_Tips" :display "emacswiki")
;; (autoload 'sunrise "sunrise-commander"
;;   "Two-pane file manager for Emacs based on Dired and inspired by MC." t)
;; (eval-after-load "sunrise-commander"
;;   '(progn (sunrise-settings)))
;; (global-set-key (kbd "C-x J") 'sunrise)
;; (try-require 'sunrise-commander)
;; (try-require 'sunrise-x-buttons) ;; cannot be used with popviewer
;; ;;(try-require 'sunrise-x-popviewer) ;; cannot be used with buttons
;; (try-require 'sunrise-x-mirror)
;; (try-require 'sunrise-x-loop)
;; (try-require 'sunrise-x-modeline)
;; (try-require 'sunrise-x-tabs)
;; (try-require 'sunrise-x-tree)

;;--------------------------------------------------------------------
;;** open-with
;; open files in external applications
;; NOTE: it need to be patched in order to run on windows
(eval-after-load "openwith"
  '(progn
    (openwith-settings)))
(GNULinux
  (openwith-mode 1))

;;====================================================================
;;* Version control settings

;;** Emacs internal version control
(setq make-backup-files nil)
(setq vc-make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.backup")))
(setq tramp-backup-directory-alist backup-directory-alist)
(setq version-control t)
(setq kept-old-versions 5)
(setq kept-new-versions 5)
(setq delete-old-versions t)

;; Autosaved files
(setq auto-save-list-file-prefix
      (concat my-var-path "/auto-save-list/auto-saves-"))

;; Automatically refresh version control information
(setq auto-revert-check-vc-info t)

;;--------------------------------------------------------------------
;;** git settings

;;*** git.el
;; (global-set-key [f11] 'xy/git-start)

;;*** egg
;; (global-set-key [S-f11] 'xy/egg-start)
(eval-after-load "egg"
  '(progn
  (egg-settings)))

;;*** magit
;; Project range git
(eval-after-load "magit"
  '(progn
    (magit-settings)))
(global-set-key (kbd "<f11>") 'magit-status)

;;*** diff-git
;; Single file range
(eval-after-load "diff-git"
  '(progn
     (diff-git-settings)))
(global-set-key (kbd "C-<f11>") 'diff-git-diff-unstaged)
(global-set-key (kbd "M-<f11>") 'diff-git-diff-staged)
;; NOTE: default key bindings after loading
;; (define-key vc-prefix-map "["        'diff-git-diff-unstaged)
;; (define-key vc-prefix-map "]"        'diff-git-diff-staged)
;; (define-key diff-mode-shared-map "g" 'diff-git-update-current-buffer)
;; (define-key diff-mode-map "\C-c\M-v" 'diff-git-buffer-stage)
;; (define-key diff-mode-map "\C-c\C-v" 'diff-git-hunk-stage))

(provide 'xy-rcroot-filemgr)
