;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-env.el'
;; Time-stamp:<2011-02-01 Tue 19:50 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My Emacs environment settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; Turn on Common Lisp support by loading cl (common lisp) package
(require 'cl)
;; `Header' for my Emacs configuration
(require 'xy-rc-utils)

;; User information
(setq user-full-name "Xin Yang")
(setq user-mail-address "xin2.yang@gmail.com")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs generated customization
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file (concat my-init-lisp-path "/xy-rcroot-auto.el"))
(load custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Install additional lisp packages, and add some system paths
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add all to load-path
(fni/add-to-load-path my-local-lisp-path 'with-subdirs 'recursive)
;; Single downloaded lisps
(xy/install-all-lisps my-local-lisp-path)
;; Manually installed packages
(xy/install-all-lisps (concat my-local-lisp-path "/dea")) ;; load first
(xy/install-all-lisps (concat my-local-lisp-path "/anything-1.287"))
(xy/install-all-lisps (concat my-local-lisp-path "/auto-complete-1.3.1"))
;; (load "auctex.el" nil t t)           ;; auctex
;; (load "preview-latex.el" nil t t)    ;; preview-latex
(xy/install-all-lisps (concat my-local-lisp-path "/babel"))
;; (xy/install-all-lisps (concat my-local-lisp-path "/bookmark+"))
;; (require 'cedet)
;; (require 'color-theme-autoloads)
(xy/install-all-lisps (concat my-local-lisp-path "/dired"))
(xy/install-all-lisps (concat my-local-lisp-path "/egg"))
(xy/install-all-lisps (concat my-local-lisp-path "/yasnippet-0.6.1c"))
;; ELPA packages
(require 'archive-downloader-autoloads)
(require 'blank-mode-autoloads)
(require 'chess-autoloads)
;; (require 'company-autoloads)
(require 'dictionary-autoloads)
(require 'emms-autoloads)
;; My own lisps, loaded at last
(xy/install-all-lisps my-own-lisp-path 'with-subdirs 'recursive)

;; NOTE: Another scheme for managing Emacs configurations
;; REF: - http://www.emacswiki.org/emacs/DotEmacsModular
;;      - http://www.emacswiki.org/emacs/elinstall
;; (autoload 'my-site-start "my-site-start" nil t)
;; (my-site-start "~/.emacs.d/site-start.d/")

;; Icon search path
(fni/add-to-image-load-path my-local-image-path 'with-subdirs 'recursive)

;; Exec binary search path in the front of exec-path
(add-to-list 'exec-path my-local-exec-path)
(Windows
 (add-to-list 'exec-path (concat my-local-exec-path "/win32")))
(HomeDesktop
 (GNULinux
  (add-to-list 'exec-path (concat my-local-exec-path "/lin64"))))
(Laptop
 (add-to-list 'exec-path (concat my-local-exec-path "/lin32")))

;; Info search path
;; NOTE: auto-customised by setting `Info-additional-directory-list'
;;
;;   (add-to-list 'Info-additional-directory-list "~/.emacs.d/info")
;;
;; But seems not working
(add-to-list 'Info-default-directory-list my-local-info-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs help system customisation
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Info
(apply-args-list-to-fun
 'def-command-max-window `("info"))
(global-set-key [C-f1] 'info-max-window)

(eval-after-load "info"
  `(progn
     (info-face-settings)
     (info-settings)))

(eal-define-keys
 'Info-mode-map
 `(("j"         next-line)
   ("k"         previous-line)
   ("h"         backward-char)
   ("l"         forward-char)
   ("J"         emaci-roll-down)
   ("K"         emaci-roll-up)
   ("f"         am-forward-word-or-to-word)
   ("/"         describe-symbol-at-point)
   ("U"         Info-up)
   ("u"         View-scroll-half-page-backward)
   ("Q"         kill-this-buffer)
   ("o"         other-window)
   ("S-SPC"     View-scroll-half-page-backward)
   ("SPC"       View-scroll-half-page-forward)
   ("C-h"       Info-up)
   ("N"         Info-next-reference)
   ("P"         Info-prev-reference)
   ("'"         switch-to-other-buffer)
   ("."         find-symbol-at-point)
   ("<mouse-4>" mwheel-scroll)
   ("<mouse-5>" mwheel-scroll)
   ("C-c ,"     Info-history-back)
   ("C-c ."     Info-history-forward)))

(eval-after-load "info+"
  `(progn
     (info+-face-settings)))

;; Man
(global-set-key [S-f1] 'man-follow)

(eal-define-keys
 'Man-mode-map
 `(("Q"     Man-kill)
   ("1"     delete-other-windows)
   ("2"     split-window-vertically)
   ("3"     split-window-horizontally)
   ("u"     View-scroll-half-page-backward)
   ("S-SPC" View-scroll-half-page-backward)
   ("SPC"   View-scroll-half-page-forward)
   ("w"     scroll-down)
   ("d"     scroll-up)
   ("f"     am-forward-word-or-to-word)
   ("b"     emaci-b)
   ("n"     emaci-n)
   ("p"     emaci-p)
   ("N"     Man-next-section)
   ("P"     Man-previous-section)
   ("m"     back-to-indentation)
   ("M-j"   Man-goto-section)
   ("."     set-mark-command)
   ("g"     emaci-g)
   ("'"     switch-to-other-buffer)))

(eal-define-keys
 `(c-mode-base-map sh-mode-map)
 `(("C-c /" man-current-word)))

(eval-after-load "man"
  `(progn
     (man-face-settings)
     (man-settings)))

;; woman settings
(global-set-key [M-f1] 'woman)

(eval-after-load "woman"
  `(progn
    (woman-face-settings)
    (woman-settings)))

;; help-mode settings
(global-set-key (kbd "C-x H") 'goto-help-buffer)

(eal-define-keys
 'help-mode-map
 `(("B"   help-go-back)
   ("F"   help-go-forward)
   ("f"   am-forward-word-or-to-word)
   ("d"   scroll-up)
   ("w"   scroll-down)
   ("C-h" help-go-back)
   ("C-;" help-go-forward)
   ("n"   forward-button)
   ("p"   backward-button)
   ("q"   delete-current-window)
   ("'"   switch-to-other-buffer)
   ("u"   View-scroll-half-page-backward)
   ("SPC" scroll-up)
   ("."   find-symbol-at-point)
   ("/"   describe-symbol-at-point)))

(eval-after-load "help-mode"
  `(progn
     (help-mode-face-settings)
     (help-mode-settings)))

;;---------------------------------------------------------------------------

;; 非常方便的查看emacs帮助的插件

;; (eal-define-keys `(emacs-lisp-mode-map 
;; 		   lisp-interaction-mode-map 
;; 		   completion-list-mode-map 
;; 		   help-mode-map
;; 		   debugger-mode-map)
;;  `(("C-c /"   describe-symbol-at-point)
;;    ("C-c M-v" describe-variable-at-point)
;;    ("C-c M-f" describe-function-at-point)
;;    ("C-c M-s" describe-face-at-point)
;;    ("C-c C-j" find-symbol-at-point)
;;    ("C-c C-h" find-symbol-go-back)
;;    ("C-c M-V" find-symbol-var-at-point)
;;    ("C-c M-F" find-symbol-fun-at-point)
;;    ("C-c M-S" find-symbol-face-at-point)
;;    ("C-c w"   where-is-at-point)))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x C-k" describe-key-sb)
;;    ("C-x C-m" describe-mode)
;;    ("C-x / A" describe-face)
;;    ("C-x / a" apropos)
;;    ("C-x A"   apropos-command)
;;    ("C-x C-d" find-symbol-sb)
;;    ("C-x K"   find-symbol-fun-on-key-sb)
;;    (,(if window-system "C-x C-/" "C-x C-_") describe-symbol-sb)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Language environment
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-language-environment 'UTF-8)
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-sendmail-coding-system 'utf-8-unix)
(Windows
  (setq default-file-name-coding-system 'gbk-dos)
  (setq default-terminal-coding-system 'gbk-dos)
  (setq default-process-coding-system '(gbk-dos . gbk-dos)))
(GNULinux
  (setq default-file-name-coding-system 'utf-8-unix)
  (setq default-terminal-coding-system 'utf-8-unix)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix)))
;; Time string format
(setq system-time-locale "C")

;; Fonts
;; 设置 sentence-end 可以识别中文断句。
(setq sentence-end 
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;; Use scalable fonts
(setq scalable-fonts-allowed t)
;; 默认字体，term 下的字体
(set-default-font "Monospace 11")
;; Emacs auto font selection for different OS
;; REF: http://emacser.com/torture-emacs.htm
;; 设置字体 Emacs 会优先选用 Concolas + “雅黑”的组合。
;; 如果“雅黑”没有装的话，就使用“文泉驿等宽正黑”，依此类推。
;; 这份字体配置不用改动就能在不同的操作系统字体环境下面使用。
;; 另注：中文要用大一点的字体，使中文字符的宽度正好等于两倍
;;（整数倍）英文字符，才能配合 org mode 下的 table，不至于对不齐。
;; 测试：
;;       1234567890abcdefghijklmnopqr
;;       中文字体宽度测试，这里对对齐
(when window-system
  (qiang-set-font
   '("Consolas" "Courier" "Monaco" "DejaVu Sans Mono" "Monospace" 
     "Courier New") ":pixelsize=14"
   '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑" 
     "黑体" "新宋体" "宋体") 16))

;; Emacs 中文输入法
;; NOTE: 现在 Emacs 下没什么好的中文输入法，还是用操作系统自带的输入法。
;;       除非不在图形系统下，才用 Emacs 内置的输入法或 eim。

;; eim
;; (when (<= emacs-major-version 21)
;;   (provide 'help-mode)
;;   (defalias 'locate-file 'locate-library)
;;   (defvar emacs-basic-display nil))
;; (autoload 'eim-use-package "eim" "The eim input method" t)
;; (register-input-method
;;  "eim-wb" "utf-8" 'eim-use-package "eim-wb" "eim-wb" "wb.txt")
;; (register-input-method
;;  "eim-py" "utf-8" 'eim-use-package "eim-py" "eim-py" "py.txt")
;; (setq default-input-method "eim-py")
;; (setq eim-use-tooltip nil)
;; (eval-after-load "eim"
;;   `(when (require 'eim-extra nil 'noerror)
;;      (global-set-key ";" 'eim-insert-ascii)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs中的包管理器
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ELPA packages
;; BUG: Conflict with auctex's `style/url.el':
;;   "symbol's function definition is void: TeX-add-style-hook" error 
;; One solution is:
;;    1. Move auctex's `style/url.el' out of load-path
;;    2. Install the package
;;    3. Move it back
;; Another solution: 
;;    Change auctex's `style/url.el' to another name.
;;    (No bug found yet)
(eval-after-load "package"
  `(progn
    (package-settings)))

;; auto-install:
;; BUG: Conflict with auctex's `style/url.el'
(eval-after-load "auto-install"
  `(progn
    (auto-install-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Global keybindings 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eal-define-keys-commonly
 global-map
 `(("C-x R" load-dot-emacs-file)
   ("C-x E" open-init-dot-el-file)))

(eal-define-keys-commonly
 global-map
 `(("C-x G l" goto-my-local-lisp-dir)
   ("C-x G m" goto-my-own-lisp-dir)
   ("C-x G e" goto-my-emacs-dir)
   ("C-x G h" goto-my-home-dir)))

;;------------------------------------------------------------------------------

(provide 'xy-rcroot-env)
