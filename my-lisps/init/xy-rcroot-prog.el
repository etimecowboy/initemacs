;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-prog.el'
;; Time-stamp:<2011-11-24 Thu 13:22 xin on p6t>
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

(require 'cl)
(require 'xy-rc-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Code formatting
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default comment-column 40) ;; set comment alignment position

;;** Auto indent
(eal-define-keys
 `(lisp-mode-map emacs-lisp-mode-map lisp-interaction-mode-map 
   sh-mode-map ,(if (not is-before-emacs-21) 'awk-mode-map) 
   java-mode-map ruby-mode-map c-mode-base-map tcl-mode-map
   python-mode-map perl-mode-map)
 `(("RET" newline-and-indent)))

;; BUG: not working
;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x A"   align)
;;    ("C-x A r" align-regexp)))
;; (global-set-key (kbd "C-x A a") 'align)
;; (global-set-key (kbd "C-x A r") 'align-regexp)

;;** Auto fill
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook
   cperl-mode-hook cc-mode-hook
   LaTeX-mode-hook latex-mode-hook
   matlab-mode-hook org-mode-hook)
 'turn-on-auto-fill)
(eval-after-load "simple" `(simple-settings))

;;** hungry-delete-mode
;; (autoload 'turn-on-hungry-delete-mode "hungry-delete"
;;   "Turns on hungry delete mode if the buffer is appropriate." t nil)
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-map
;;   sh-mode-map cperl-mode-hook cc-mode-hook
;;   vhdl-mode-map verilog-mode-map
;;   matlab-mode-hook)
;;  '(lambda ()
;; 	(hungry-delete-mode 1)))
 ;; 'turn-on-hungry-delete-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Code folding
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** hide-region
;; 代码区域折叠
;; (require 'hide-region)
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook
   cperl-mode-hook cc-mode-hook
   vhdl-mode-hook verilog-mode-hook
   matlab-mode-hook
   ;; org-mode-hook text-mode-hook
   )
 '(lambda ()
	(require 'hide-region)))
(eal-define-keys-commonly
 global-map
 `(("C-x M-r" hide-region-hide)
   ("C-x M-R" hide-region-unhide)))
(eval-after-load "hide-region"
  `(hide-region-settings))

;;-------------------------------------------------------------------

;;** hide show
;; a minor mode similar to outline-mode. 
;; It hides and shows blocks of text. 
;; In particular, HideShow hides balanced-expression code blocks and 
;; multi-line comment blocks.
;; REF: http://www.emacswiki.org/emacs/HideShow
(am-add-hooks
 `(c-mode-common-hook java-mode-hook
   lisp-mode-hook emacs-lisp-mode-hook)
   'hs-minor-mode)

(eval-after-load "hideshow"
  `(progn
     ;; (hs-minor-mode-face-settings) ;; TODO: to my theme
     (hs-minor-mode-settings)
	 ;; (define-key hs-minor-mode-map (kbd "C-c @ C-h") 'hs-hide-block)
	 ;; (define-key hs-minor-mode-map (kbd "C-c @ C-w") 'hs-show-block)
	 (define-key hs-minor-mode-map (kbd "S-<f6>") 'hs-toggle-hiding)
	 (define-key hs-minor-mode-map (kbd "C-<f6>") 'hs-hide-level)
	 (define-key hs-minor-mode-map (kbd "M-<f6>") 'hs-hide-all)
	 (define-key hs-minor-mode-map (kbd "C-S-<f6>") 'hs-show-all)
	 ))

;;*** hideshow-org
;; The extension makes hideshow.el’s functionality behave like org-mode’s.
;; REF: - https://github.com/secelis/hideshow-org
;;      - http://gnufool.blogspot.com/2009/03/make-hideshow-behave-more-like-org-mode.html
;; NOTE: the default <TAB> key conflicts with `icicles' and
;;       `yasnippet'
;; (add-hook 'hs-minor-mode
;; 		  (lambda ()
;; 			(require 'hideshow-org)))
;; (eval-after-load "hideshow-org"
;;   `(progn
;;      (hideshow-org-settings)))

;;--------------------------------------------------------------------

;;** outline-org-like
;; org-like code folding
;; REF:
;; http://www.cnblogs.com/bamanzi/archive/2011/10/09/emacs-outline-org-like.html
;; http://code.google.com/p/bamanzi-misc/source/browse/trunk/_emacs.d/lisp/outline-org-like.el
;; (require 'outline)
;; (require 'outline-magic)
;; (add-hook 'outline-mode-hook 
;;           (lambda () 
;;             (require 'outline-cycle)))
(add-hook 'outline-minor-mode-hook 
          (lambda () 
            (require 'outline-magic)
            (define-key outline-minor-mode-map [(f6)] 'outline-cycle)
			))
(am-add-hooks
 `(c-mode-common-hook java-mode-hook
   lisp-mode-hook emacs-lisp-mode-hook
   vhdl-mode-hook verilog-mode-hook)
 (lambda ()
   (require 'outline-org-like)
   (outline-org-mode 1)))

;;--------------------------------------------------------------------

;; BUG: not working in elisp code
;;** orgstruct-mode
;; universal cycling keys
;; (defun org-cycle-global ()
;;   (interactive)
;;   (org-cycle t))

;; (defun org-cycle-local ()
;;   (interactive)
;;   (save-excursion
;;     (move-beginning-of-line nil)
;;     (org-cycle)))

;; (global-set-key (kbd "M-[") 'org-cycle-global)
;; (global-set-key (kbd "M-]") 'org-cycle-local)
;; (add-hook 'emacs-lisp-mode-hook #'orgstruct-mode)
;; (add-hook 'lisp-mode-hook #'orgstruct-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Code exploration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** find-func
;; emacs build-in lisp for finding functions
;; (find-function-setup-keys)

;;** describe-symbol and find-symbol
;; (eal-define-keys
;;  `(emacs-lisp-mode-map lisp-interaction-mode-map
;;    completion-list-mode-map help-mode-map debugger-mode-map)
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
;;  `(("C-x C-k" describe-key)
;;    ("C-x C-m" describe-mode)
;;    ("C-x / A" describe-face)
;;    ("C-x / a" apropos)
;;    ("C-x A"   apropos-command)
;;    ("C-x C-d" find-symbol)
;;    ("C-x K"   find-symbol-fun-on-key)
;;    (,(if window-system "C-x C-/" "C-x C-_") describe-symbol)))

;;--------------------------------------------------------------------

;;** which-func
;; 用来显示当前光标在哪个函数
(which-func-mode 1)
(eval-after-load "which-func"
  `(progn
     ;; (which-func-face-settings) ;; TODO: to my theme
     (which-func-settings)))

;;--------------------------------------------------------------------

;;** imenu
;; (require 'imenu)
;; (eval-after-load "imenu"
;;   `(imenu-settings))
;; (defvar text-imenu-generic-expression
;;   `((nil ,"^ \\{0,4\\}\\([一二三四五六七八九十]+[、. )]\\)+ *[^,。，]+?$" 0)
;;     (nil ,"^ \\{0,4\\}\\([0-9]+[、. )]\\)+ *[^,。，]+?$" 0)))
;; (add-hook 'text-mode-hook
;;           (lambda ()
;;             (setq imenu-generic-expression text-imenu-generic-expression)
;;             (imenu-add-menubar-index)))

;;*** imenu-tree 
;; (require 'imenu-tree)
;; (eval-after-load "imenu-tree"
;;   `(imenu-tree-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Shell script development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (eal-define-keys
;;  'sh-mode-map
;;  `(("<"       self-insert-command)
;;    ("C-c M-c" sh-case)
;;    ("C-c C-c" comment)
;;    ("C-c g"   bashdb)))
(eval-after-load "sh-script"
  `(progn
     ;; (sh-mode-face-settings) ;; TODO: to my theme
     (sh-mode-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Windows DOS batch script programming
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'batch-mode "batch-mode")
(add-to-list 'auto-mode-alist '("\\.bat$" . batch-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Emacs-lisp development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (eval-after-load "lisp-mode"
;;   `(lisp-interaction-mode-settings))
;; (eal-define-keys
;;  'lisp-interaction-mode-map
;;  `(("C-j" goto-line)
;;    ("M-j" eval-print-last-sexp)))

;; ;; emacs-lisp-mode settings
;; (eal-define-keys
;;  `emacs-lisp-mode-map
;;  `(("C-c M-a" beginning-of-defun)
;;    ("C-c M-e" end-of-defun)))

(eval-after-load "emacs-lisp-mode"
  `(emacs-lisp-mode-settings))
(eval-after-load "lisp-mode"
  `(lisp-mode-settings))
;; BUG: lisp-interaction-mode error
;; Debugger entered--Lisp error: (error "Invalid function:
;; (progn (turn-on-auto-fill) (turn-on-eldoc-mode))") 
;; signal(error ("Invalid function: (progn (turn-on-auto-fill)
;; (turn-on-eldoc-mode))")) 
;; error("%s" "Invalid function: (progn (turn-on-auto-fill)
;; (turn-on-eldoc-mode))") 
;; byte-code("\302!\210\303\304\305	!\"\207" [icicle-orig-buff
;; act-on-choice icicle-try-switch-buffer error "%s"
;; error-message-string] 4) 
;; (eval-after-load "lisp-interaction-mode"
;;   `(lisp-mode-settings))

;;** eldoc
;; 显示变量, 函数的声明，可用在很多语言中(c)
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook
   lisp-interaction-mode-hook cperl-mode-hook)
 'turn-on-eldoc-mode)
(eval-after-load "eldoc"
  `(progn
     ;; (eldoc-face-settings) ;; TODO: to my theme
     (eldoc-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* c/c++ development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; NOTE: C include directories' list are defined in `xy-util.el'
;;** cc-mode
(eval-after-load "cc-mode"
  '(progn
	 (cc-mode-settings)
	 (eal-define-keys
	  `(c-mode-base-map)
	  `(("C-c H"     c-electric-backspace)
		("C-c M-a" beginning-of-defun)
		("C-c M-e" end-of-defun)
		("C-c M-F" copy-current-fun-name)
		;; ifdef settings
		("C-c I" mark-ifdef)
		;; sourcepair,可以在cpp与h文件之间切换
		("C-c S" sourcepair-load)))))

;;----------------------------------------------------------------------------

;;** ifdef
;; (eal-define-keys
;;  'c-mode-base-map
;;  `(("C-c I" mark-ifdef)))
;; (eval-after-load "ifdef"
;;   `(ifdef-settings))

;;----------------------------------------------------------------------------

;;** hide-ifdef
;; c中隐藏ifdef
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

(eval-after-load "hideif"
  '(progn
	 (hideif-settings)))

(eval-after-load "cc-mode"
  '(progn
     (dolist (hook '(c-mode-common-hook))
       (add-hook hook 'hide-ifdef-mode))
     ;; (dolist (map (list c-mode-base-map))
     ;;   (eal-define-keys-commonly
     ;;    map
     ;;    `(("C-c w"   hide-ifdef-block)
     ;;      ("C-c W"   hide-ifdefs)
     ;;      ("C-c M-i" show-ifdef-block)
     ;;      ("C-c M-I" show-ifdefs))))))
	 ))

;;-------------------------------------------------

;;** c-includes
;; (require 'c-includes)
(eval-after-load "c-includes"
  `(c-includes-settings))

;;-------------------------------------------------

;;** sourcepair
;; 可以在cpp与h文件之间切换
;; (eal-define-keys
;;  `(c-mode-base-map)
;;  `(("C-c S" sourcepair-load)))

(autoload 'sourcepair-load "sourcepair"
  "Load the corresponding C/C++ header or source file for the current buffer.

This function can be invoked by \\[sourcepair-load].  It will load the the
corresponding header or source file for the current buffer.  For example, if
you are looking at the file FooParser.cpp and press \\[sourcepair-load], the
file FooParser.h will be loaded.  It also works the other way as well.

There are six global variables that can be used to adjust how the function
works:

 `sourcepair-source-extensions'
 `sourcepair-header-extensions'
 `sourcepair-source-path'
 `sourcepair-header-path'
 `sourcepair-recurse-ignore'
 `sourcepair-private-header-suffixes'

See the documentation for these variables for more info.
" t)

(eval-after-load "sourcepair" `(sourcepair-settings))

;;-------------------------------------------------

;;** codepilot
;; someone else's c/c++ development environment

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

;;------------------------------------------------------------

;;** kde-emacs
;; 一个方便开发c的工具
;; ;; 改包中定义了C-j 为goto-line, 还设置了c-style
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

;;** snavigator
;; (try-require 'sn)
;; (eal-define-keys
;;  `(c-mode-base-map)
;;  `(("C-h"     c-electric-backspace)
;;    ("C-c M-a" beginning-of-defun)
;;    ("C-c M-e" end-of-defun)
;;    ("C-c M-F" copy-current-fun-name)))

;;-------------------------------------------------

;;** xrefactory settings
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
;;* vhdl development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load "vhdl"
  `(progn
     ;; (vhdl-mode-face-settings)
     (vhdl-mode-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* verilog development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load "verilog"
  `(progn
     ;; (verilog-mode-face-settings)
     (verilog-mode-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Matlab development settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'matlab-load)
(eval-after-load "matlab"
  `(progn
     ;; (matlab-face-settings) ;; TODO: to my theme
     (matlab-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Documentation settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** doxygen

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
;;* CEDET settings
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

(eval-after-load "cedet"
  '(progn
	 (cedet-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* ECB settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load "ecb"
  `(ecb-settings))

;;--------------------------------------------------------------------

;;* eclim settings
;; 把Eclipse的功能带给Emacs
;; (require 'eclim)
;; (dolist (hook (list 'c-mode-common-hook 'lisp-mode-hook 
;;                     'emacs-lisp-mode-hook 'java-mode-hook))
;;   (add-hook hook 'eclim-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Compile settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** autoconf-mode settings
;; (require 'autoconf-mode-settings)
;; ;;;###autoload
;; (defun autoconf-mode-settings ()
;;   "Settings for `autoconf-mode'.")
;; (eval-after-load "autoconf-mode"
;;   `(autoconf-mode-settings))

;;--------------------------------------------------------------------

;;** flymake
;; 动态检查语法错误
;; (defvar flymake-mode-map (make-sparse-keymap))
;; (autoload 'flymake-find-file-hook "flymake" "" t)
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (eval-after-load "flymake"
;;   '(progn
;; 	 (flymake-settings)
;; 	 (eal-define-keys
;; 	  'flymake-mode-map
;; 	  `(("C-c N"   flymake-goto-next-error-disp)
;; 		("C-c P"   flymake-goto-prev-error-disp)
;; 		("C-c M-w" flymake-display-current-warning/error)))))

;;--------------------------------------------------------------------

;;** ahei 的智能编译
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

;; (eal-define-keys-commonly
;;  global-map
;;  `(("M-n" next-error)
;;    ("M-p" previous-error)))

;; (eal-define-keys
;;  makefile-mode-map-list
;;  `(("M-p"	  previous-error)
;;    ("M-n"	  next-error)
;;    ("C-c p" makefile-previous-dependency)
;;    ("C-c n" makefile-next-dependency)))

;; (eal-define-keys
;;  'compilation-mode-map
;;  `(("n" compilation-next-error)
;;    ("p" compilation-previous-error)
;;    ("'" switch-to-other-buffer)
;;    ("u" View-scroll-half-page-backward)
;;    ("f" am-forward-word-or-to-word)
;;    ("d" scroll-up)
;;    ("w" scroll-down)))

;; (eval-after-load "compile"
;;   `(progn
;;      (compile-face-settings)
;;      (compile-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Debug settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** debug.el
;; (eval-after-load "debug"
;;   '(progn
;;      ;; (require 'util)

;;      (apply-define-key
;;       debugger-mode-map
;;       `(("'" switch-to-other-buffer)
;;         ("o" other-window)))))

;;----------------------------------------------------------------------

;;** edebug

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

;;---------------------------------------------------------------------

;;** gdb
;; (eal-define-keys
;;  'c-mode-base-map
;;  `(("C-c g" gdb)
;;    ("C-c b" gud-break)
;;    ("C-c B" gud-remove)))
;; (eal-define-keys
;;  'gud-mode-map
;;  `(("C-c B" gud-remove)
;;    ("M-s"   view)
;;    ("M-m"   comint-previous-matching-input)
;;    ("M-M"   comint-next-matching-input)
;;    ("C-c r" gud-run)
;;    ("C-c f" gud-finish)
;;    ("M-j"   gud-next)
;;    ("M-k"   gud-step)
;;    ("M-c"   gud-cont)
;;    ("M-C"   capitalize-word)
;;    ("C-c m" make)))

(eval-after-load "gdb-ui"
  `(gud-settings))
;; (eval-after-load "gdb-mi"
;;   `(gud-settings))

(provide 'xy-rcroot-prog)
