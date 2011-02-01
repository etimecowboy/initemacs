;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-prog.el'
;; Time-stamp:<2011-02-01 Tue 20:47 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  My programming settings
;; Shell script development settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Code formatting
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Auto indent
(eal-define-keys
 `(lisp-mode-map emacs-lisp-mode-map lisp-interaction-mode-map 
   sh-mode-map ,(if (not is-before-emacs-21) 'awk-mode-map) 
   java-mode-map ruby-mode-map c-mode-base-map tcl-mode-map
   python-mode-map perl-mode-map)
 `(("RET" newline-and-indent)))

;; BUG: not working
(eal-define-keys-commonly
 global-map
 `(("C-x a"   align)
   ("C-x M-a" align-regexp)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 所有关于括号的配置
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; paren-mode settings
(show-paren-mode 1)
(eval-after-load "paren"
  `(progn
     (paren-face-settings)
     (paren-settings)))

;;--------------------------------------------------------------------

;; highlight-parentheses.el, 用颜色配对括号
(require 'highlight-parentheses)
(am-add-hooks
 `(find-file-hook
   help-mode-hook Man-mode-hook log-view-mode-hook
   compilation-mode-hook gdb-mode-hook lisp-interaction-mode-hook
   browse-kill-ring-mode-hook completion-list-mode-hook hs-hide-hook
   inferior-ruby-mode-hook custom-mode-hook Info-mode-hook
   svn-log-edit-mode-hook package-menu-mode-hook dired-mode-hook
   apropos-mode-hook)
 'highlight-parentheses-mode)
(eval-after-load "highlight-parentheses"
  `(progn
     ;; (mic-paren-face-settings)
     (highlight-parentheses-settings)))

;; mic-paren
(require 'mic-paren)
(eval-after-load "mic-paren"
  `(progn
     (mic-paren-face-settings)
     (mic-paren-settings)))

;; autopair
;; 自动给你加上括号
(require 'autopair)
(autopair-global-mode 1)
(eval-after-load "autopair"
  '(autopair-settings))
;; some keybindings
(eal-define-keys-commonly
 global-map
 `(("C-M-]" ywb-indent-accoding-to-paren)
   ("\C-]" goto-paren)))

;;--------------------------------------------------------------------

;; 输入左大花扩号自动补齐右大花括号
(eal-define-keys
 `(c-mode-base-map awk-mode-map)
 `(("{" skeleton-c-mode-left-brace)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Code folding
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hide-region
;; 代码区域折叠
(require 'hide-region)
(eal-define-keys-commonly
 global-map
 `(("C-x M-r" hide-region-hide)
   ("C-x M-R" hide-region-unhide)))
(eval-after-load "hide-region"
  `(hide-region-settings))

;;-------------------------------------------------------------------

;; hs-minor-mode: a minor mode similar to outline-mode. 
;; It hides and shows blocks of text. 
;; In particular, HideShow hides balanced-expression code blocks and 
;; multi-line comment blocks.
(am-add-hooks
 `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook java-mode-hook)
 'hs-minor-mode)

(eval-after-load "hideshow"
  `(progn
     (hs-minor-mode-face-settings)
     (hs-minor-mode-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Code exploration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;describe-symbol, find-symbol
(eal-define-keys
 `(emacs-lisp-mode-map lisp-interaction-mode-map
   completion-list-mode-map help-mode-map debugger-mode-map)
 `(("C-c /"   describe-symbol-at-point)
   ("C-c M-v" describe-variable-at-point)
   ("C-c M-f" describe-function-at-point)
   ("C-c M-s" describe-face-at-point)
   ("C-c C-j" find-symbol-at-point)
   ("C-c C-h" find-symbol-go-back)
   ("C-c M-V" find-symbol-var-at-point)
   ("C-c M-F" find-symbol-fun-at-point)
   ("C-c M-S" find-symbol-face-at-point)
   ("C-c w"   where-is-at-point)))

(eal-define-keys-commonly
 global-map
 `(("C-x C-k" describe-key-sb)
   ("C-x C-m" describe-mode)
   ("C-x / A" describe-face)
   ("C-x / a" apropos)
   ("C-x A"   apropos-command)
   ("C-x C-d" find-symbol-sb)
   ("C-x K"   find-symbol-fun-on-key-sb)
   (,(if window-system "C-x C-/" "C-x C-_") describe-symbol-sb)))

;;--------------------------------------------------------------------

;; which-func.el, 用来显示当前光标在哪个函数
(which-func-mode 1)
(eval-after-load "which-func"
  `(progn
     (which-func-face-settings)
     (which-func-settings)))

;;--------------------------------------------------------------------

;; ;; imenu-tree: 
;; (require 'imenu-tree)
;; (eval-after-load "imenu-tree"
;;   `(imenu-tree-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Shell script development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eal-define-keys
 'sh-mode-map
 `(("<"       self-insert-command)
   ("C-c M-c" sh-case)
   ("C-c C-c" comment)
   ("C-c g"   bashdb)))
(eval-after-load "sh-script"
  `(progn
     (sh-mode-face-settings)
     (sh-mode-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; c/c++ development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; codepilot, someone else's c/c++ development environment

;; (setq codepilot-dir (concat my-local-lisp-path "codepilot"))
;; (try-require 'mycutil)
;; ;;;###autoload
;; (defun codepilot-settings-4-emaci ()
;;   "`codepilot' settings for `emaci'."
;;   (emaci-add-key-definition
;;    "[" 'cp-pb-where-we-are
;;    '(memq major-mode dev-modes)))

;; (eval-after-load "emaci"
;;   `(codepilot-settings-4-emaci))

;;-------------------------------------------------------------------------

;; c/c++ include dir
(Windows
 (defvar user-include-dirs
   '(".." "../include" "../inc" "../common" "../public"
     "../.." "../../include" "../../inc" "../../common" "../../public"
     ;; "C:/Program Files/Microsoft Visual Studio/VC98/Include"
     ;; "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"
     ;; "D:/Microsoft Visual Studio 9.0/VC/include"
     ;; "D:/Microsoft Visual Studio 9.0/VC/atlmfc/include"
     "E:/program/MinGW/include"
     "E:/program/MinGW/lib/gcc/mingw32/4.5.2/include"
     "E:/program/MinGW/lib/gcc/mingw32/4.5.2/include-fixed"
     "D:/WpdPack/Include"
     ;; "E:/program/MinGW/msys/1.0/include"
     ;; "E:/program/MinGW/msys/1.0/include/w32api"
     )
   "User include dirs for c/c++ mode")
 (defvar c-preprocessor-symbol-files
   '(
     ;; "C:/MinGW/include/c++/3.4.5/mingw32/bits/c++config.h"
     ;; "C:/Program Files/Microsoft Visual Studio/VC98/Include/xstddef"
     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/yvals.h"
     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/crtdefs.h"
     )
   "Preprocessor symbol files for cedet"))

;; cc-mode settings
(eval-after-load "cc-mode"
  `(cc-mode-settings))

;;----------------------------------------------------------------------------

;; ifdef settings
(eal-define-keys
 'c-mode-base-map
 `(("C-c I" mark-ifdef)))

;;----------------------------------------------------------------------------

;; hide-ifdef, c中隐藏ifdef
;; (autoload 'hide-ifdef-block "hideif"
;;   "Hide the ifdef block (true or false part) enclosing or before the cursor."
;;   t)

;; (autoload 'hide-ifdefs "hideif"
;;   "Hide the contents of some #ifdefs.
;; Assume that defined symbols have been added to `hide-ifdef-env'.
;; The text hidden is the text that would not be included by the C
;; preprocessor if it were given the file with those symbols defined.

;; ;; Turn off hiding by calling `show-ifdefs'."
;;   t)

;; (autoload 'show-ifdef-block "hideif"
;;   "Show the ifdef block (true or false part) enclosing or before the cursor."
;;   t)

;; (autoload 'show-ifdefs "hideif"
;;   "Cancel the effects of `hide-ifdef': show the contents of all #ifdefs."
;;   t)

;; (eval-after-load "hideif"
;;   '(progn
;;      (setq hide-ifdef-env
;;            '((GNU_LINUX . t)
;;              (__GNUC__ . t)
;;              (__cplusplus . t)))))

;; (eval-after-load "cc-mode"
;;   '(progn
;;      (dolist (hook '(c-mode-common-hook))
;;        (add-hook hook 'hide-ifdef-mode))
;;      (dolist (map (list c-mode-base-map))
;;        (eal-define-keys-commonly
;;         map
;;         `(("C-c w"   hide-ifdef-block)
;;           ("C-c W"   hide-ifdefs)
;;           ("C-c M-i" show-ifdef-block)
;;           ("C-c M-I" show-ifdefs))))))

;;-------------------------------------------------

;; c-includes settings
;; (defun c-includes-settings ()
;;   "Settings for `c-includes'."
;;   (setq c-includes-binding t)
;;   (setq c-includes-path ffap-c-path))

;; (eval-after-load "c-includes"
;;   `(c-includes-settings))

;;-------------------------------------------------

;; sourcepair,可以在cpp与h文件之间切换
;; (eal-define-keys
;;  `(c-mode-base-map)
;;  `(("C-c s" sourcepair-load)))

;; (autoload 'sourcepair-load "sourcepair"
;;   "Load the corresponding C/C++ header or source file for the current buffer.

;; This function can be invoked by \\[sourcepair-load].  It will load the the
;; corresponding header or source file for the current buffer.  For example, if
;; you are looking at the file FooParser.cpp and press \\[sourcepair-load], the
;; file FooParser.h will be loaded.  It also works the other way as well.

;; There are six global variables that can be used to adjust how the function
;; works:

;;  `sourcepair-source-extensions'
;;  `sourcepair-header-extensions'
;;  `sourcepair-source-path'
;;  `sourcepair-header-path'
;;  `sourcepair-recurse-ignore'
;;  `sourcepair-private-header-suffixes'

;; See the documentation for these variables for more info.
;; " t)

;; (eval-after-load "sourcepair" `(sourcepair-settings))

;;-------------------------------------------------

;; kde-emacs 一个方便开发c的工具
;; 改包中定义了C-j 为goto-line, 还设置了c-style
;; (require 'kde-emacs-core)

;; (autoload 'agulbra-make-member "kde-emacs-utils"
;;   "make a skeleton member function in the .cpp or .cc file" t)

;; (eal-define-keys
;;  'c++-mode-map
;;  `(("C-c C-b" agulbra-make-member)))

;; ;;;###autoload
;; (defun kde-emacs-settings ()
;;   "Settings for `kde-emacs'."
;;   (setq magic-keys-mode nil)
;;   (setq kde-tab-behavior 'indent)

;;   (am-add-hooks
;;    `(java-mode-hook)
;;    (lambda ()
;;      (c-set-style "kde-c++"))))

;; (eval-after-load "kde-emacs-core"
;;   `(kde-emacs-settings))

;;-------------------------------------------------

;; snavigator
;; (try-require 'sn)
;; (eal-define-keys
;;  `(c-mode-base-map)
;;  `(("C-h"     c-electric-backspace)
;;    ("C-c M-a" beginning-of-defun)
;;    ("C-c M-e" end-of-defun)
;;    ("C-c M-F" copy-current-fun-name)))

;;-------------------------------------------------

;; xrefactory settings
;; (require 'xrefactory)
;; ;; 查找定义
;; (global-set-key (kbd "C-c x d") 'xref-push-and-goto-definition)
;; ;; 返回
;; (global-set-key (kbd "C-c x r") 'xref-pop-and-return)
;; ;; 浏览符号
;; (global-set-key (kbd "C-c x b") 'xref-browse-symbol)
;; ;; 上一个引用
;; (global-set-key (kbd "C-c x ,") 'xref-previous-reference)
;; ;; 下一个引用
;; (global-set-key (kbd "C-c x .") 'xref-next-reference)

;; ;;;###autoload
;; (defun xref-settings ()
;;   "settings for `xref'."
;;   (defvar xref-current-project nil)
;;   (defvar xref-key-binding 'global)
;;   (setq exec-path (cons (concat my-local-lisp-path "xref") exec-path)))

;; (eval-after-load "xref"
;;   `(xref-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; vhdl development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load "vhdl"
  `(progn
     ;; (vhdl-mode-face-settings)
     (vhdl-mode-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; vhdl development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; verilog settings
(eval-after-load "verilog"
  `(progn
     ;; (verilog-mode-face-settings)
     (verilog-mode-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Documentation settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; doxygen

;; (require 'doxymacs-settings)
;; (autoload 'doxymacs-mode "doxymacs"
;;   ;; All of the following text shows up in the "mode help" (C-h m)
;;   "Minor mode for using/creating Doxygen documentation.
;; To submit a problem report, request a feature or get support, please
;; visit doxymacs' homepage at http://doxymacs.sourceforge.net/.

;; To see what version of doxymacs you are running, enter
;; `\\[doxymacs-version]'.

;; In order for `doxymacs-lookup' to work you will need to customise the
;; variable `doxymacs-doxygen-dirs'.

;; Key bindings:
;; \\{doxymacs-mode-map}" t)

;; (am-add-hooks
;;  `(c-mode-common-hook php-mode-hook)
;;  (lambda ()
;;    (doxymacs-mode 1)
;;    (doxymacs-font-lock)))

;; ;;;###autoload
;; (defun doxymacs-settings ()
;;   "Settings for `doxymacs'.")

;; (eval-after-load "doxymacs"
;;   `(doxymacs-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; CEDET settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; if want to use offical cedet
;; (let ((cedet-possible-dirs 
;;        '((concat my-local-lisp-path "/cedet-1.0pre6")
;;          (concat my-local-lisp-path "/cedet-1.0pre7")
;;          (concat my-local-lisp-path "/cedet-1.0"))))
;;   (dolist (dir cedet-possible-dirs)
;;     (let ((default-directory (expand-file-name dir)))
;;       (when (file-exists-p default-directory)
;;         (add-to-list 'load-path default-directory)
;;         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;             (normal-top-level-add-subdirs-to-load-path))))))

;; (when (and (or (not (boundp 'semantic-mode))
;;                (and (boundp 'semantic-mode) (null semantic-mode)))
;;            (locate-library "semantic-ctxt") ; offical cedet
;;            (require 'cedet nil 'noerror))

(require 'cedet)
(eval-after-load "cedet"
  `(cedet-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ecb 代码浏览器
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ecb-autoloads)
(eval-after-load "ecb"
  `(ecb-settings))

;;--------------------------------------------------------------------

;; eclim
;; 把Eclipse的功能带给Emacs
;; (require 'eclim)
;; (dolist (hook (list 'c-mode-common-hook 'lisp-mode-hook 
;;                     'emacs-lisp-mode-hook 'java-mode-hook))
;;   (add-hook hook 'eclim-mode))

;;--------------------------------------------------------------------

;; autoconf-mode settings
;; (require 'autoconf-mode-settings)
;; ;;;###autoload
;; (defun autoconf-mode-settings ()
;;   "Settings for `autoconf-mode'.")
;; (eval-after-load "autoconf-mode"
;;   `(autoconf-mode-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Compile settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; flymake,
;; 动态检查语法错误
;; (defvar flymake-mode-map (make-sparse-keymap))
;; (autoload 'flymake-find-file-hook "flymake" "" t)
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (eval-after-load "flymake" `(flymake-settings))
;; (eal-define-keys
;;  'flymake-mode-map
;;  `(("C-c N"   flymake-goto-next-error-disp)
;;    ("C-c P"   flymake-goto-prev-error-disp)
;;    ("C-c M-w" flymake-display-current-warning/error)))

;;--------------------------------------------------------------------

;; ahei 的智能编译
;; (require 'my-smart-compile)

;; (defalias 'cpl 'compile)

;; (defvar makefile-mode-map-list nil "the list of `makefile-mode-map'")
;; (if is-before-emacs-21
;;     (setq makefile-mode-map-list '(makefile-mode-map))
;;   (setq makefile-mode-map-list '(makefile-gmake-mode-map makefile-automake-mode-map)))

;; (eal-define-keys
;;  (append makefile-mode-map-list
;;          '(c-mode-base-map svn-status-mode-map sh-mode-map
;;                            compilation-mode-map ruby-mode-map))
;;  `(("C-c C-m"  make-sb)
;;    ("C-c m"    make-check-sb)
;;    ("C-c M"    make-clean-sb)
;;    ("C-c c"    compile-buffer-sb)
;;    ("C-c r"    run-program-sb)
;;    ("C-c C"    smart-compile-sb)))

;; (eal-define-keys
;;  'java-mode-map
;;  `(("C-c C-m" ant-sb)
;;    ("C-c M"	  ant-clean-sb)
;;    ("C-c m"	  ant-test-sb)))


;; (require 'compile-misc)

;; (eal-define-keys-commonly
;;  global-map
;;  `(("M-n" next-error)
;;    ("M-p" previous-error)))

;; ;;;###autoload
;; (defun compile-settings ()
;;   "Settings for `compile'."
;;   ;; 设置编译命令
;;   (setq compile-command "make -k")

;;   (eal-define-keys
;;    makefile-mode-map-list
;;    `(("M-p"	  previous-error)
;;      ("M-n"	  next-error)
;;      ("C-c p" makefile-previous-dependency)
;;      ("C-c n" makefile-next-dependency)))

;;   (setq compilation-scroll-output t))

;; (eal-define-keys
;;  'compilation-mode-map
;;  `(("n" compilation-next-error)
;;    ("p" compilation-previous-error)
;;    ("'" switch-to-other-buffer)
;;    ("u" View-scroll-half-page-backward)
;;    ("f" am-forward-word-or-to-word)
;;    ("d" scroll-up)
;;    ("w" scroll-down)))

;; ;;;###autoload
;; (defun compile-face-settings ()
;;   "Face settings for `compile'."
;;   (custom-set-faces '(compilation-info
;;                       ((((type tty)) :bold t :foreground "green")
;;                        (t :foreground "green"))))
;;   (setq compilation-message-face nil)
;;   (custom-set-faces '(compilation-warning
;;                       ((((class color)) :foreground "red" :bold nil))))
;;   (custom-set-faces '(compilation-info
;;                       ((((type tty pc)) :foreground "magenta") (t (:foreground "magenta")))))
;;   (setq compilation-enter-directory-face 'beautiful-blue-face)
;;   (setq compilation-leave-directory-face 'magenta-face))

;; (eval-after-load "compile"
;;   `(progn
;;      (compile-face-settings)
;;      (compile-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Debug settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; debug.el
;; (eval-after-load "debug"
;;   '(progn
;;      ;; (require 'util)

;;      (apply-define-key
;;       debugger-mode-map
;;       `(("'" switch-to-other-buffer)
;;         ("o" other-window)))))

;;-------------------------------------------

;; edebug

;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x M-E" toggle-debug-on-error)
;;    ("C-x Q"   toggle-debug-on-quit)))

;; (eval-after-load "edebug"
;;   '(progn
;;      (define-key edebug-mode-map (kbd "C-c C-d") nil)))

;; (defun edebug-clear-global-break-condition ()
;;   "Clear `edebug-global-break-condition'."
;;   (interactive)
;;   (setq edebug-global-break-condition nil))

;;-------------------------------------------

;; `gdb'
;; (require 'gud-settings)

;; (require 'util)

;; (eal-define-keys
;;  'c-mode-base-map
;;  `(("C-c g" gdb)
;;    ("C-c b" gud-break)
;;    ("C-c B" gud-remove)))

;; ;;;###autoload
;; (defun gud-settings ()
;;   "Settings for `gud'."
;;   (eal-define-keys
;;    'gud-mode-map
;;    `(("C-c B" gud-remove)
;;      ("M-s"   view)
;;      ("M-m"   comint-previous-matching-input)
;;      ("M-M"   comint-next-matching-input)
;;      ("C-c r" gud-run)
;;      ("C-c f" gud-finish)
;;      ("M-j"   gud-next)
;;      ("M-k"   gud-step)
;;      ("M-c"   gud-cont)
;;      ("M-C"   capitalize-word)
;;      ("C-c m" make)))

;;   ;; 退出gdb的时候关闭gdb对应的buffer
;;   (add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit)

;;   ;; 显示gdb的鼠标提示
;;   (gud-tooltip-mode 1))

;; (eval-after-load "gdb-ui"
;;   `(gud-settings))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Version control settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs internal version control
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
(require 'git)
(require 'git-blame)
;; (global-set-key [f11] 'git-status)
;; Automatically refresh version control information
(setq auto-revert-check-vc-info t)
;; egg git gui
(when (try-require 'egg)
  ;; egg-grep could be loaded later.
  (setq egg-enable-tooltip t)
  (setq egg-refresh-index-in-backround t)
  (setq egg-show-key-help-in-buffers 
        '((:status :log :file-log :reflog :diff :commit)))
  ;; (global-set-key [S-f11] 'egg-status) 
  )

;;---------------------------------------------------------------------

;; subversion gui
;; (require 'svn-settings)

;;--------------------------------------------------------------------

(provide 'xy-rcroot-prog)
