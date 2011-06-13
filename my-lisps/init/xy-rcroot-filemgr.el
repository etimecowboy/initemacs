;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-filemgr.el'
;; Time-stamp:<2011-06-13 Mon 16:16 xin on P6T-WIN7>
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Buffer management
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;-------------------------------------------------------------------

;; ibuffer
(eval-after-load "ibuffer"
  `(progn
     (ibuffer-settings)))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;--------------------------------------------------------------------

;; uniquify, 可以为重名的 buffer 在前面加上其父目录的名字来让名字区分开来，
;; 而不是单纯的加一个没有太多意义的序号
(require 'uniquify)
(eval-after-load "uniquify"
  `(progn
     (uniquify-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; File management
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; dired 文件管理
(eal-define-keys-commonly
 global-map
 `(("C-x d" dired-jump)))

;; (define-key dired-mode-map (kbd "C-x 2") 'dired-two-columns)
(eal-define-keys-commonly
 dired-mode-map
    `(("C-x 2" dired-two-columns)
	  ("C-t"   dired-omit-mode)
	  ("C-q s" dired-sort-by-size)
	  ("C-q x" dired-sort-by-extension)
	  ("C-q t" dired-sort-by-time)
	  ("C-q n" dired-sort-by-name)))
;;  `(;; ("C-h"         dired-up-directory-same-buffer)
;;    ;; ("<backspace>" dired-up-directory-same-buffer)
;;    ;; ("'"           switch-to-other-buffer)
;;    ;; ("/"           dired-slash-map)
;;    ;; ("/m"          ywb-dired-filter-regexp)
;;    ;; ("/."          ywb-dired-filter-extension)
;;    ;; ("C-q"         ywb-dired-quickview)
;;    ;; ("r"           wdired-change-to-wdired-mode)
;;    ;; ("C-s"         dired-lis-isearch-forward-always?)
;;    ;; ("C-r"         dired-lis-isearch-backward-always?)
;;    ;; ("ESC C-s"     dired-lis-isearch-forward-regexp-always?)
;;    ;; ("ESC C-r"     dired-lis-isearch-backward-regexp-always?)
;;    ;; 让dired只使用一个buffer
;;    ;; ("RET"         dired-lis-find-file-reuse-dir-buffer)
;;    ;; ("<return>"    dired-lis-find-file-reuse-dir-buffer)
;;    ;; ("M"           wuxch-mark-all-files-directories)
;;    ;; ("g"           revert-buffer)
;;    ;; ("M-o"         dired-omit-mode)
;;    ;; ("M-Y"         dired-redo)
;;    ;; ("C-k"         dired-do-delete)
;;    ;; ("M-s"         dired-lis-off)
;;    ;; ("q"           dired-lis-on)
;;    ;; ("M"           dired-unmark)

;;    ("1"           delete-other-windows)
;;    ("2"           split-window-vertically)
;;    ("3"           split-window-horizontally)
;;    ("o"           other-window)

;;    ("j"           wuxch-dired-next-line)
;;    ("k"           wuxch-dired-previous-line)
;;    ("SPC"         dired-scroll-half-page-forward)
;;    ("u"           dired-scroll-half-page-backward)
;;    ("d"           dired-scroll-up)
;;    ("w"           dired-scroll-down)
;;    ("M->"         wuxch-dired-goto-last-line)
;;    ("M-<"         wuxch-dired-goto-first-line)

;;    ("M-w"         wuxch-dired-copy)
;;    ("C-y"         wuxch-dired-paste)
;;    ("M-k"         wuxch-dired-cut)

;;    ("c"           dired-do-copy)
;;    ("E"           dired-ediff)
;;    ("t"           sb-toggle-keep-buffer)
;;    ("M-m"         dired-unmark-backward)
;;    ("C-c M-m"     dired-create-directory)
   
;;    ("C-c C-m"     make-sb)
;;    ("C-c m"       make-check-sb)
;;    ("C-c M"       make-clean-sb)
;;    ("C-c c"       compile-buffer-sb)
;;    ("C-c r"       run-program-sb)
;;    ("C-c C"       smart-compile-sb)
;;    ("C-c g"       gdb)
;;    ("C-c b"       gud-break)
;;    ("C-c B"       gud-remove)))

(eval-after-load "dired" 
  `(progn
     (dired-settings)))


;;---------------------------------------------------------------

;; ;; dired-details+, 更多文件信息
;; ;;;###autoload
;; (defun dired-details+-settings ()
;;   "Settings for `dired-details+'.")

;; (eval-after-load "dired-details+"
;;   `(dired-details+-settings))

;;---------------------------------------------------------------

;; dired+, 增强的 dired
;; (eval-after-load "dired+"
;;   `(progn
;;      (dired+-face-settings)
;;      (dired+-settings)))

;;---------------------------------------------------------------

;; ;; dired-x, 忽略不感兴趣的文件
;; (autoload 'dired-omit-mode "dired-x"
;;   "Toggle Dired-Omit mode.
;; With numeric ARG, enable Dired-Omit mode if ARG is positive, disable
;; otherwise.  Enabling and disabling is buffer-local.
;; If enabled, \"uninteresting\" files are not listed.
;; Uninteresting files are those whose filenames match regexp `dired-omit-files',
;; plus those ending with extensions in `dired-omit-extensions'."
;;   t)
;; (am-add-hooks
;;  `(dired-mode-hook)
;;  'dired-omit-mode)
;; ;;;###autoload
;; (defun dired-x-settings ()
;;   "Settings for `dired-x'."
;;   ;; (unless is-before-emacs-21
;;   ;;   (setq dired-omit-files (concat dired-omit-files "\\|^\\.\\|^semantic.cache$\\|^CVS$"))
;;   ;;   (if mswin
;;   ;;       (setq dired-omit-files (concat dired-omit-files "\\|^_"))))
;;   ;; (setq dired-omit-size-limit 1000000)
;; )
;; (eval-after-load "dired-x" `(dired-x-settings))

;;-----------------------------------------------------------------------------

;; dired-lis.el
;; (eal-define-keys
;;  'isearch-mode-map
;;  `(("C-h" dired-lis-isearch-up-directory)))
;; ;;;###autoload
;; (defun dired-lis-settings ()
;;   "Settings for `dired-lis'.")
;; (eval-after-load "dired-lis"
;;   `(dired-lis-settings))

;;-----------------------------------------------------------------------------

;; image dired
(eval-after-load "image-dired"
   `(image-dired-settings))

;;-----------------------------------------------------------------------------

;; Sunrise commander; file manager
;; Check http://www.emacswiki.org/emacs/Sunrise_Commander_Tips
(autoload 'sunrise "sunrise-commander"
  "Two-pane file manager for Emacs based on Dired and inspired by MC." t)
(eval-after-load "sunrise-commander"
  `(sunrise-settings))
(global-set-key (kbd "C-x J") 'sunrise)

;; (try-require 'sunrise-commander)
;; (try-require 'sunrise-x-buttons) ;; cannot be used with popviewer
;; ;;(try-require 'sunrise-x-popviewer) ;; cannot be used with buttons
;; (try-require 'sunrise-x-mirror)
;; (try-require 'sunrise-x-loop)
;; (try-require 'sunrise-x-modeline)
;; (try-require 'sunrise-x-tabs)
;; (try-require 'sunrise-x-tree)

;;-----------------------------------------------------------------------------

;; open files in external applications
;; NOTE: it need to be patched in order to run on windows
(eval-after-load "openwith"
  `(openwith-settings))
(GNULinux
  (openwith-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Version control settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs internal version control
;; Do not make backup files 
(setq make-backup-files nil)
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;; Autosaved files
(setq auto-save-list-file-prefix 
      (concat my-var-path "/auto-save-list/.saves-"))

;;--------------------------------------------------------------------

;; git gui
(global-set-key [f11] 'git-start)
;; Automatically refresh version control information
(setq auto-revert-check-vc-info t)
;; egg git gui
(require 'egg)
(global-set-key [S-f11] 'egg-start)
(eval-after-load "egg"
  '(progn
	 (egg-settings)))

;;---------------------------------------------------------------------

;; subversion gui
;; (require 'svn-settings)

;;--------------------------------------------------------------------

(provide 'xy-rcroot-filemgr)
