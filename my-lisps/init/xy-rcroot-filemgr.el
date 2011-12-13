;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-filemgr.el'
;; Time-stamp:<2011-12-13 Tue 11:30 xin on P6T-WIN7>
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
(eval-after-load "ibuffer" '(ibuffer-settings))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;--------------------------------------------------------------------
;;** uniquify
;; 可以为重名的 buffer 在前面加上其父目录的名字来让名字区分开来，
(eval-after-load "uniquify" '(uniquify-settings))
(require 'uniquify)

;;====================================================================
;;* File management

;;** dired
(eval-after-load "dired"
  '(progn
     (dired-settings)
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
        ;; ("E"         dired-ediff)
        ;; ("C-M-/"     dired-undo
        ;; ("C-M-?"     dired-redo)
        ("C-M-k"     dired-do-delete)
        ("M-q"       ywb-dired-quickview)
        ;; ("/m"        ywb-dired-filter-regexp)
        ;; ("/."        ywb-dired-filter-extension)
        ;; ("M->"       wuxch-dired-goto-last-line)
        ;; ("M-<"       wuxch-dired-goto-first-line)
        ;; ("M-w"       wuxch-dired-copy)
        ;; ("C-y"       wuxch-dired-paste)
        ;; ("M-k"       wuxch-dired-cut)
        ))))

;;*** GNU Emacs features for dired
;; 对特定文件简略显示
(eval-after-load "dired-x" '(dired-x-settings))
;; 以文件形式修改dired buffer,  has been a part of GNU Emacs since 23
;; (eval-after-load "wdired" '(wdired-settings))
;; 只对文件名isearch
;;   NOTE: Emacs 23 has builtin Isearch of filenames in Dired:
;;     M-s f C-s   – `dired-isearch-filenames'
;;     M-s f C-M-s – `dired-isearch-filenames-regexp'
;;     M-s a C-M-s – `dired-do-isearch-regexp'
;; (eval-after-load "dired-isearch" '(dired-isearch-settings))

;;*** Contrib features for dired
;; 简略文件列表信息
(eval-after-load "dired-details+" '(dired-details+-settings))
;; Use a single frame for visiting a sub-directory
;; (eval-after-load "dired-single" (dired-single-settings))
;; `T' 把目录压缩为.tar.gz文件
;; (eval-after-load "dired-tar" '(dired-tar-settings))
;; TODO: do a research and add more configurations.
(eval-after-load "dired+" '(dired+-settings)) ;; dired大补
;; open-with, open files in external applications
;; NOTE: it need to be patched in order to run on windows
(eval-after-load "openwith" '(openwith-settings))
;; image-dired
(eval-after-load "image-dired" '(image-dired-settings))
;; thumbs, Thumbnails previewer for images files
(eval-after-load "thumbs" '(thumbs-settings))

(require 'dired+)
(require 'dired-details+)
(require 'dired-tar)

;; (add-hook 'dired-load-hook
;;           (function (lambda ()
;;                       (load "dired+")
;;                       (load "dired-x")
;;                       (load "wdired")
;;                       (load "dired-tar")
;;                       (load "dired-details+")
;;                       ;; (load 'dired-single)
;;                       (load "openwith")
;;                       )))
(add-hook 'dired-mode-hook
          (function (lambda ()
                      (dired-omit-mode 1)
                      ;; (dired-details-install)
                      (define-key ctl-x-map   "d"
                        'diredp-dired-files)
                      (define-key ctl-x-4-map "d"
                        'diredp-dired-files-other-window)
                      )))
(GNULinux
 (add-hook 'dired-mode-hook
           (function (lambda ()
                       (require 'openwith)
                       (openwith-mode 1)))))

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

;;====================================================================
;;* Version control settings

;;** Emacs internal version control
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.backup")))
(setq make-backup-files nil)
(setq vc-make-backup-files nil)
(setq tramp-backup-directory-alist backup-directory-alist)
(setq version-control t)
(setq kept-old-versions 5)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq auto-revert-check-vc-info t)

;; Autosaved files
(setq auto-save-default nil)
;; (setq auto-save-list-file-prefix
;;       (concat my-var-path "/auto-save-list/auto-saves-"
;;               user-login-name "@" system-name "@" system-configuration
;;               "-"))

;;--------------------------------------------------------------------
;;** git settings

;;*** git.el

;;*** egg
;; (global-set-key [S-f11] 'xy/egg-start)
(eval-after-load "egg" '(egg-settings))

;;*** magit
;; Project range git
(eval-after-load "magit" '(magit-settings))
(global-set-key (kbd "<f11>") 'magit-status)

;;*** diff-git
;; Single file range
(eval-after-load "diff-git"
  '(progn
     (diff-git-settings)
     (eal-define-keys 'vc-prefix-map
                      `(("[" diff-git-diff-unstaged)
                        ("]" diff-git-diff-staged)))
     (eal-define-keys 'diff-mode-map
                      `(("C-c M-v" diff-git-buffer-stage)
                        ("C-c C-v" diff-git-diff-staged)))
     (define-key diff-mode-shared-map "g" 'diff-git-update-current-buffer)))
(global-set-key (kbd "C-<f11>") 'diff-git-diff-unstaged)
(global-set-key (kbd "M-<f11>") 'diff-git-diff-staged)

(provide 'xy-rcroot-filemgr)
