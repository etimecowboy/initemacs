;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-env.el'
;; Time-stamp:<2011-06-10 Fri 19:58 xin on p6t>
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
(xy/install-all-lisps (concat my-local-lisp-path "/auto-complete-1.3.1"))
;; (load "auctex.el" nil t t)           ;; auctex
;; (load "preview-latex.el" nil t t)    ;; preview-latex
(xy/install-all-lisps (concat my-local-lisp-path "/babel"))
;; (xy/install-all-lisps (concat my-local-lisp-path "/bookmark+"))
 (xy/install-all-lisps (concat my-local-lisp-path "/org-7.5"))
;; (require 'cedet)
;; (require 'color-theme-autoloads)
(xy/install-all-lisps (concat my-local-lisp-path "/egg"))
(xy/install-all-lisps (concat my-local-lisp-path "/eim-2.4"))
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
     (info-settings)
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
		("C-c ."     Info-history-forward)))))

(eval-after-load "info+"
  `(progn
     (info+-face-settings)))

;; Man
(global-set-key [S-f1] 'man-follow)

(eal-define-keys
 `(c-mode-base-map sh-mode-map)
 `(("C-c /" man-current-word)))

(eval-after-load "man"
  `(progn
     (man-face-settings)
     (man-settings)
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
		("'"     switch-to-other-buffer)))))

;; woman settings
(global-set-key [M-f1] 'woman)

(eval-after-load "woman"
  `(progn
    (woman-face-settings)
    (woman-settings)))

;; help-mode settings
(global-set-key (kbd "C-x H") 'goto-help-buffer)

(eval-after-load "help-mode"
  `(progn
     (help-mode-face-settings)
     (help-mode-settings)
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
		("/"   describe-symbol-at-point)))))

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

;; System encoding
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
;; Emacs auto font selection for different OS
;; REF: http://emacser.com/torture-emacs.htm
;; TODO: set font for each frame seperately
(xy/set-font-default)
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook cc-mode-hook c-mode-hook
;;    c++-mode-hook sh-mode-hook vhdl-mode-hook verilog-mode-hook
;;    matlab-mode-hook)
;;  'xy/set-font-prog)
;; (am-add-hooks
;;  `(LaTeX-mode-hook latex-mode-hook tex-mode-hook
;;    muse-mode-hook org-mode-hook)
;;  'xy/set-font-write)
(global-set-key (kbd "C-x F d") 'xy/set-font-default)
(global-set-key (kbd "C-x F w") 'xy/set-font-write)
(global-set-key (kbd "C-x F p") 'xy/set-font-prog)

;; Ctrl+滚轮，字体放大缩小
(GNULinux
 (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
 (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease))
(Windows
 (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
 (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease))

;; 中文输入法
;; NOTE: 现在 Emacs 下没什么好的中文输入法，还是用操作系统自带的输入法。
;;       除非不在图形系统下，才用 Emacs 内置的输入法或 eim。

;; eim, another Emacs input-method
;; REF: http://www.emacswiki.org/emacs/InputMethods
;;   Basic usage:
;;   - `M-x set-input-method': switch to a new input method.
;;   - `C-h C-\' or `C-h I': describe the current input method.
;;   - `C-\': toggle the input method on and off
;;   To activate the input method on a per-buffer basis.
;;   1. Put the following lines in the .emacs:
;;      (set input-activate nil)
;;      (add-hook 'find-file-hook
;;        (lambda ()(if (eq input-activate t) (toggle-input-method))))
;;   2. Then put the following line at the beginning of a file:
;;       -*- input-activate: t -*-
;;   3. The input method will be activated for this file as soon loaded.
;;   如何輸入繁體:
;;      把 py.txt, otherpy.txt,  pychr.txt 用軟件轉成了繁體，然後重新打開 emacs。
;;      這樣使用軟件自動轉換肯定是不精確的，有些地方會出現錯誤。比如"碼表"被搞成
;;      了"碼錶"。
(autoload 'eim-use-package "eim" "The eim input method" t)
;; (register-input-method
;;  "eim-wb" "utf-8" 'eim-use-package "eim-wb" "eim-wb" "wb.txt")
(register-input-method
 "eim-py" "utf-8" 'eim-use-package "eim-py" "eim-py" (concat
													  my-emacs-path
													  "/eim/py.txt")) 
(setq default-input-method "eim-py")
(setq input-activate nil)
(add-hook 'find-file-hook
          (lambda ()(if (eq input-activate t) (toggle-input-method))))
(eval-after-load "eim"
  `(progn
     (eim-settings)))

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
;; (autoload 'package-list-packages "package"
;;   "Display a list of packages.
;; Fetches the updated list of packages before displaying.
;; The list is displayed in a buffer named `*Packages*'." nil t)
(require 'package)
(package-initialize)
(eval-after-load "package"
  `(progn
    (package-settings)))

;; auto-install:
;; BUG: Conflict with auctex's `style/url.el'
(require 'auto-install)
(eval-after-load "auto-install"
  `(progn
    (auto-install-settings)))
(eal-define-keys-commonly
 dired-mode-map
 `(("C-b"    auto-install-from-dired)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Start emacs server
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs可以做为一个server, 然后用emacsclient连接这个server,
;; 无需再打开两个Emacs。
;; Emacs 23.2 以后还提供了 `Emacs --daemon' 模式，加快启动。
;; Windows 下使用我定义的 `xy/done' 函数也能达到类似的效果，
;; 用 `C-x C-c' 隐藏 Emacs frame，但只能使用一个 frame。
;; Emacs-21 以前的版本要用 gnuserv
(if is-before-emacs-21
    (progn
      ;; gnuserv
      (require 'gnuserv-compat)
      (gnuserv-start)
      ;; 在当前frame打开
      (setq gnuserv-frame (selected-frame))
      ;; 打开后让emacs跳到前面来
      (setenv "GNUSERV_SHOW_EMACS" "1")))
(if is-after-emacs-23
	(progn
	  (setq server-auth-dir (concat my-var-path "/server"))
	  (server-force-delete)
	  (server-start)
	  ;; (global-set-key (kbd "C-x C-c") 'xy/done)
	  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Global keybindings for visit some files/directory 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eal-define-keys-commonly
 global-map
 `(("C-x G r" load-dot-emacs-file)
   ("C-x G i" open-init-dot-el-file)))

(eal-define-keys-commonly
 global-map
 `(("C-x G l" goto-my-local-lisp-dir)
   ("C-x G m" goto-my-own-lisp-dir)
   ("C-x G e" goto-my-emacs-dir)
   ("C-x G h" goto-my-home-dir)
   ("C-x G o" goto-my-org-source-dir)
   ("C-x G t" goto-my-org-latex-dir)))

;; try to improve slow performance on windows.
(Windows
 (setq w32-get-true-file-attributes nil))

;; Change default major mode of *scratch* buffer
(setq initial-major-mode 'text-mode)
;; Change default text in the *scratch* buffer
(setq initial-scratch-message "")

;;------------------------------------------------------------------------------

(provide 'xy-rcroot-env)
