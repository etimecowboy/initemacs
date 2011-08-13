;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-app.el'
;; Time-stamp:<2011-08-13 Sat 17:49 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  Emacs apparence
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
;; Simple settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Wrap line dynamically
(global-visual-line-mode 1)
(setq visual-line-fringe-indicators '(nil right-curly-arrow))
(setq word-wrap t)
;; Display buffer boudaries
(setq-default indicate-buffer-boundaries 'left)
;; Indicate empty lines
(setq-default indicate-empty-lines t)
;; Do not display starup welcome screen
(setq inhibit-startup-screen t)
;; User visible bell instead of bell sound
(setq visible-bell t)
;; menu bar
(menu-bar-mode nil)
;; This library enhances the "Text Properties" menu.  It adds menu
;; items to the menu, and provides two different versions of the
;; menu: one for the menu-bar Edit menu (`facemenu-menu') and one for
;; the mouse popup menu (`facemenu-mouse-menu').  In standard library
;; `facemenu.el', these two menus are the same.
;; (require 'facemenu+)
;; No tool bar
(tool-bar-mode nil)
;; No scroll bar
(scroll-bar-mode nil)
;; Match parens
(show-paren-mode 1)
;; Display key strokes quickly
(setq-default echo-keystrokes 0.1)
;; Prefer pixmap icons
;; (setq chart-face-use-pixmaps t)
;; Use "y-or-n" instead of "yes-or-no"
;; (defalias 'yes-or-no-p 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)
;; 关闭buffer的时候, 如果该buffer有对应的进程存在, 不提示, 烦
(delq 'process-kill-buffer-query-function 
      kill-buffer-query-functions)
;; automatically display images
(auto-image-file-mode 1)
;; automatically refresh buffer
(global-auto-revert-mode 1)
(defun gbk-revert ()
  "Revert current buffer with gbk-dos encoding."
  (interactive)
  (revert-buffer-with-coding-system 'gbk-dos))
(global-set-key [f5] 'revert-buffer)
(global-set-key [C-f5] 'gbk-revert)

;; Delete extra white spaces at the end of a sentence
(setq sentence-end-double-space nil)
;; Do not redraw on reenter
(setq no-redraw-on-reenter t)
;; Use clipboard with x window system
(setq x-select-enable-clipboard t)
(setq x-stretch-cursor t)
;; emacs lock
;; (autoload 'toggle-emacs-lock "emacs-lock" "Emacs lock" t)
;; Winner mode for window splits
(winner-mode 1)

;; Frame layout
(when window-system
  ;; Initial fram layout
  ;; (setq initial-frame-alist 
  ;; 	'((height . 40) 
  ;; 	  (width  . 90))) 
  ;; ;; New frame layout
  ;; (setq pop-up-frame-alist 
  ;; 	'((height . 40) 
  ;; 	  (width  . 90)))
  ;; Default frame layout
  ;; (setq 'default-frame-alist 
  ;; 	'((height . 40) 
  ;; 	  (width  . 90)))
  (add-to-list 'default-frame-alist '(height . 40))
  (add-to-list 'default-frame-alist '(width . 95)))

;; `fit-frame.el' and `autofit-frame.el'
;; NOTE:
;;      - `fit-frame.el':     resizes a frame in order to  fit a frame
;;                            to its buffers.
;;      - `autofit-frame.el': do it automatically. May be annoying. I
;;                            don't like it.
;; (require 'fit-frame)
;; (require 'autofit-frame)
;; (add-hook 'after-make-frame-functions 'fit-frame)
;; (add-hook 'temp-buffer-show-hook
;;           'fit-frame-if-one-window 'append)

(global-set-key [M-f5] 'fit-frame)
;; (global-set-key [vertical-line down-mouse-1]
;;                 'fit-frame-or-mouse-drag-vertical-line)

;; ;;  Customize the menu-bar.  Uncomment this to try it out.
;; (defvar menu-bar-frames-menu (make-sparse-keymap "Frames"))
;; (define-key global-map [menu-bar frames]
;;   (cons "Frames" menu-bar-frames-menu))
;; (define-key menu-bar-frames-menu [fit-frame]
;;   '("Fit This Frame" . fit-frame))

;; `thumb-frm.el'
;;  Shrink frames to a thumbnail size and restore them again.
(require 'thumb-frm)
;; (define-key special-event-map [iconify-frame]
;;             'thumfr-thumbify-frame-upon-event)
;; (global-set-key [(shift mouse-3)]
;;                 'thumfr-toggle-thumbnail-frame)
;; (global-set-key [(shift control mouse-3)]
;;                 'thumfr-thumbify-other-frames)
(global-set-key [(shift control ?z)]
				'thumfr-thumbify-other-frames)
(global-set-key [(shift control ?p)]
				'thumfr-fisheye-previous-frame)
(global-set-key [(shift control ?n)]
				'thumfr-fisheye-next-frame)
(global-set-key [(control meta ?z)]
				'thumfr-really-iconify-or-deiconify-frame)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; mouse settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(setq mouse-autoselect-window 1.0)
(mouse-avoidance-mode 'jump)
(setq mouse-drag-copy-region nil)
(setq mouse-wheel-progressive-speed t)
(setq mouse-wheel-scroll-amount 
      '(5
	((shift) . 1)
	((control))))

(eval-after-load "mouse-drag"
  '(progn
     (setq mouse-throw-with-scroll-bar nil)))

(eal-define-keys-commonly
 global-map
 `(("<S-down-mouse-1>" mouse-drag-drag)
   ;; ("<down-mouse-1>"  mouse-drag-region-sb)
   ("<down-mouse-1>"  mouse-drag-region)
   ;; 使终端支持鼠标
   ("C-x T"            xterm-mouse-mode)))

;; Mouse support in terminal
(when (not window-system)
  (xterm-mouse-mode 1))

;; 防止页面滚动时跳动,scroll-margin 3
;; 可以在靠近屏幕边沿3行时就开始滚动,可以很好的看到上下文
(setq scroll-margin 3
      scroll-conservatively 10000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; mode-line settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; window-numbering
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
numbers with the C-x C-j prefix.  Another mode,
`window-number-meta-mode' enables the use of the M- prefix."
  t)
(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
windows, use `window-number-mode' to display the window numbers in
the mode-line."
  t)
(defun window-number-toggle ()
  "Toggle window number display and quick switch."
  (interactive)
  (window-number-mode)
  (window-number-meta-mode))
(global-set-key [f6] 'window-number-toggle)

;; Removing or abbreviating minor mode indicators
(eval-after-load "filladapt" '(diminish 'filladapt-mode))
(eval-after-load "icicle" '(diminish 'icicle-mode))
(eval-after-load "highlight-symbol" '(diminish 'highlight-symbol-mode))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
(eval-after-load "linkd" '(diminish 'linkd-mode))
(eval-after-load "simple" '(diminish 'global-visual-line-mode))
(eval-after-load "simple" '(diminish 'visual-line-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
(eval-after-load "flyspell" '(diminish 'flyspell-mode))
(eval-after-load "autopair" '(diminish 'autopair-mode))
(eval-after-load "hideshow" '(diminish 'hs-minor-mode))
(eval-after-load "yasnippet" '(diminish 'yas/minor-mode))
;; (eval-after-load "xy-recent-jump" '(diminish 'recent-jump-mode))
(eval-after-load "xy-recent-jump-small" '(diminish 'recent-jump-small-mode))
 
;; Do not display mode-line in non-selected windows
(setq-default mode-line-in-non-selected-windows 1)
;; Display column number
(column-number-mode 1)
;; Display the current location in the file
(size-indication-mode 1)
(setq-default mode-line-buffer-identification 
	      (propertized-buffer-identification "%b"))
;; Display time and date
(if (not window-system)
	(progn
	  (setq display-time-day-and-date t)
	  (display-time-mode 1))
  (progn
	(setq display-time-day-and-date nil)
	(display-time-mode -1)))

;; Display battery infomation, after Emacs-22
;; (when is-after-emacs-23 (display-battery-mode -1))
;; Display number of characters in a selected region
(require 'modeline-posn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; minibuffer settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(unless is-after-emacs-23
  (partial-completion-mode 1))
;; 可以递归的使用minibuffer
(setq enable-recursive-minibuffers t)
;; 当你在shell、telnet、w3m等模式下时，加密显出你的密码
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Frame title settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set frame title display: filename @ process
;; (setq frame-title-format "%f @ %s")
(setq frame-title-format
	  `(,(user-login-name) "@" ,(system-name) "     "
		global-mode-string "     %f" ))
;; 在标题栏显示登陆名称和文件名
;; (setq frame-title-format
;;       '((:eval
;;          (let ((login-name (getenv-internal "LOGNAME")))
;;            (if login-name (concat login-name "@") "")))
;;         (:eval (system-name))
;;         ":"
;;         (:eval (or (buffer-file-name) (buffer-name)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; menua-bar settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; menua-bar+，improved menu
;; (try-require 'menu-bar+)
;; toggle menua display
(global-set-key [M-f10] 'menu-bar-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; tool-bar settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tool-bar+, improved tool bar; broken
;; (try-require 'tool-bar+)
;; toggle toolbar display
(global-set-key [C-f10] 'tool-bar-mode)

;; tabbar，tab style buffer switch
;; (require 'tabbar)
;; (tabbar-mode 1)
;; (global-set-key (kbd "C-+") 'tabbar-forward-group)
;; (global-set-key (kbd "C-_") 'tabbar-backward-group)
;; (global-set-key (kbd "C-=") 'tabbar-forward)
;; (global-set-key (kbd "C--") 'tabbar-backward)
;; (setq tabbar-cycling-scope (quote tabs))
;; (setq tabbar-cycling-scope nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Beautiful apperance
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Transparent Emacs
;; REF: http://www.emacswiki.org/emacs/TransparentEmacs
(when (and is-after-emacs-23 window-system) ; actually after emacs-22

  ;; User controls the frame opacity
  ;; (set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>])) 
  (set-frame-parameter (selected-frame) 'alpha '(100 100))
  (add-to-list 'default-frame-alist '(alpha 100 100))
  (global-set-key (kbd "C-x W t") 'toggle-transparency)) 

;; 可以把光标由方块变成一个小长条
;; (require 'bar-cursor)

;; Emacs才是世界上最强大的IDE － 智能的改变光标形状
;; http://emacser.com/cursor-change.htm
;; (when (try-require 'cursor-change)
;;   (cursor-change-mode 1))
(cursor-change-mode 1)

;; Color-theme, fancy themes for emacs
;; REF: http://emacser.com/color-theme.htm
;; (require 'color-theme-autoloads)
(eval-after-load "color-theme-autoloads"
  '(progn
     (color-theme-settings)))
(color-theme-start)

(eal-define-keys-commonly
 color-theme-mode-map
 `(("'"   switch-to-other-buffer)
   ("u"   View-scroll-half-page-backward)
   ("SPC" scroll-up)
   ("1"   delete-other-windows)
   ("."   find-symbol-at-point)))

;; 增加更丰富的高亮
;; (require 'generic-x)

;; pulse.el, 实现Emacs的淡入淡出效果
;; http://emacser.com/pulse.htm
;; (require 'pulse)
(eval-after-load "pulse"
  `(progn
     (pulse-face-settings)
     (pulse-settings)))

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

;; 输入左大花扩号自动补齐右大花括号
(eal-define-keys
 `(c-mode-base-map awk-mode-map)
 `(("{" skeleton-c-mode-left-brace)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Syntax highling
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs basic
(global-font-lock-mode 1)
(eval-after-load "font-lock"
  `(progn
     (font-lock-settings)
	 ;; (font-lock-face-settings)
	 ))

;; smart-hl.el, 像Eclipse那样双击高亮当前字符串
;; NOTE: A part of codepilot which is removed.
;;       Use highlight-symbol-mode instead.
;; (require 'smart-hl)

;; highlight-symbol.el, 像Eclipse那样高亮光标处单词
;; (require 'highlight-symbol)
(eval-after-load "highlight-symbol"
  `(progn
     (highlight-symbol-face-settings)
     (highlight-symbol-settings)))

(eal-define-keys
 `(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map
   c-mode-base-map text-mode-map ruby-mode-map html-mode-map)
 `(("C-c M-H" highlight-symbol-at-point)
   ("C-c M-R" highlight-symbol-remove-all)
   ("C-c M-N" highlight-symbol-next)
   ("C-c M-P" highlight-symbol-prev)
   ("C-c r"   highlight-symbol-query-replace)
   ("C-c M-n" highlight-symbol-next-in-defun)
   ("C-c M-p" highlight-symbol-prev-in-defun)))

;; zjl-hl, use CEDET semantic to highlight function calls
(eval-after-load "zjl-hl"
  '(progn
	 (zjl-hl-face-settings)
	 (zjl-hl-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Color settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; `palette.el' emacs 的调色板

(defvar facemenup-palette-change-face-bg nil "Face background be changed or not.")
(defvar facemenup-last-face-color nil "Last face color used.")

(eval-after-load "palette"
  `(progn
     (palette-settings)
     (eal-define-keys
      'palette-mode-map
      `(("j"     palette-down)
		("k"     palette-up)
		("h"     palette-left)
		("l"     palette-right)
		("J"     palette-down-quickly)
		("K"     palette-up-quickly)
		("H"     palette-left-quickly)
		("L"     palette-right-quickly)
		("r"     palette-face-restore-bg-fg)
		("f"     palette-set-face-changed-to-foreground)
		("b"     palette-set-face-changed-to-background)
		("B"     facemenup-face-bg-restore)
		("F"     facemenup-face-fg-restore)
		("d"     palette-disply-which-in-changine)
		("m"     palette-pick-background-at-point)
		("C"     palette-copy-current-color)
		("C-x k" palette-quit-restore-bg-fg)))))

(eal-define-keys-commonly
 global-map
 `(("C-x P" palette)
   ("C-x M-F" facemenup-palette-face-fg-at-point)
   ("C-x M-B" facemenup-palette-face-bg-at-point)))

(provide 'xy-rcroot-app)
