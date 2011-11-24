;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-app.el'
;; Time-stamp:<2011-11-24 Thu 19:44 xin on p6t>
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Frame settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** Default frame layout
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

;;** Frame title
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

;;** Transparent frame
;; REF: http://www.emacswiki.org/emacs/TransparentEmacs
;; BUG: not work in Windows 7, not work in Linux with gnome 3
;; (when (and is-after-emacs-23 window-system) ; from emacs-22

;;   ;; User controls the frame opacity
;;   ;; (set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>])) 
;;   (set-frame-parameter (selected-frame) 'alpha '(100 100))
;;   (add-to-list 'default-frame-alist '(alpha 100 100))
;;   (global-set-key (kbd "C-x W t") 'toggle-transparency))

;;** Resize frame
;; NOTE: `fit-frame' and `thumb-frm' cause issue when openning
;; info-mode links.
;;*** fit-frame and autofit-frame
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
;; (global-set-key [vertical-line down-mouse-1]
;;                 'fit-frame-or-mouse-drag-vertical-line)
;; (global-set-key [M-f5] ;; 'fit-frame)
;; 				'xy/fit-frame)

;;  Add menu-bar items
;; (defvar menu-bar-frames-menu (make-sparse-keymap "Frames"))
;; (define-key global-map [menu-bar frames]
;;   (cons "Frames" menu-bar-frames-menu))
;; (define-key menu-bar-frames-menu [fit-frame]
;;   '("Fit This Frame" . fit-frame))

;;*** thumb-frm
;;  Shrink frames to a thumbnail size and restore them again.
;; (require 'thumb-frm)
;; (define-key special-event-map [iconify-frame]
;;             'thumfr-thumbify-frame-upon-event)
;; (global-set-key [(shift mouse-3)]
;;                 'thumfr-toggle-thumbnail-frame)
;; (global-set-key [(shift control mouse-3)]
;;                 'thumfr-thumbify-other-frames)
;; (global-set-key [(shift meta ?z)]
;; 				'thumfr-thumbify-other-frames)
;; (global-set-key [(shift control ?p)]
;; 				'thumfr-fisheye-previous-frame)
;; (global-set-key [(shift control ?n)]
;; 				'thumfr-fisheye-next-frame)
;; (global-set-key [(shift control ?z)]
;; 				;;'thumfr-really-iconify-or-deiconify-frame)
;; 				'thumfr-toggle-thumbnail-frame)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Window settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** window-number
;; assign a number to a window
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

;; (defun xy/window-number-toggle ()
;;   "Toggle window number display and quick switch."
;;   (interactive)
;;   (window-number-mode) ;; C-c C-j
;;   ;; (window-number-meta-mode)
;;   )
;; (global-set-key [f6] 'xy/window-number-toggle)

;; NOTE: another approach to move the point between windows is to use
;; `windmove' which is a part of GNU Emacs. However, the default key
;; bindings are conflict with many other packages. 
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;** Winner mode for window splits
(winner-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Buffer settings
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

;; Use visible bell instead of bell sound
(setq visible-bell t)

;; Display key strokes quickly
(setq-default echo-keystrokes 0.1)

;; Prefer pixmap icons
;; (setq chart-face-use-pixmaps t)

;; Use "y-or-n" instead of "yes-or-no"
;; (defalias 'yes-or-no-p 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)

;; 关闭buffer的时候, 如果该buffer有对应的进程存在, 不提示
(delq 'process-kill-buffer-query-function 
      kill-buffer-query-functions)

;; automatically display images
(auto-image-file-mode 1)

;; automatically refresh buffer
(global-auto-revert-mode 1)

;; Delete extra white spaces at the end of a sentence
(setq sentence-end-double-space nil)

;; Do not redraw on reenter
(setq no-redraw-on-reenter t)

;; emacs lock
;; (autoload 'toggle-emacs-lock "emacs-lock" "Emacs lock" t)

;; hl-line
;; Higligh current line
;; (setq hl-line-face 'underline) ; for highlight-symbol
;; (global-hl-line-mode 1) ; (if window-system 1 -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* mode-line settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;** diminish
;; Removing or abbreviating minor mode indicators
(eval-after-load "filladapt" '(diminish 'filladapt-mode))
(eval-after-load "icicles" '(diminish 'icicle-mode))
(eval-after-load "highlight-symbol" '(diminish 'highlight-symbol-mode))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
(eval-after-load "linkd" '(diminish 'linkd-mode))
(eval-after-load "simple" '(diminish 'global-visual-line-mode))
(eval-after-load "simple" '(diminish 'visual-line-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
;; (eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
(eval-after-load "flyspell" '(diminish 'flyspell-mode))
(eval-after-load "autopair" '(diminish 'autopair-mode))
(eval-after-load "hideshow" '(diminish 'hs-minor-mode))
;; (eval-after-load "yasnippet" '(diminish 'yas/minor-mode))
(eval-after-load "xy-recent-jump" '(diminish 'recent-jump-mode))
(eval-after-load "xy-recent-jump-small" '(diminish 'recent-jump-small-mode))
(eval-after-load "ibus" '(diminish 'ibus-mode))
(eval-after-load "outline" '(diminish 'outline-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))

;;** modeline-posn
;; Display number of characters in a selected region
(require 'modeline-posn)

;;** mode-line-frame
;; offers a frame to show various information
;; (require 'mode-line-frame)
;; (mode-line-frame-create)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* mini-buffer settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 可以递归的使用minibuffer
(setq enable-recursive-minibuffers t)

;; 当你在shell、telnet、w3m等模式下时，加密显出你的密码
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Vaious bar settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** menu-bar
;; No menu bar as default
(menu-bar-mode -1)

;; Toggle menua display
(global-set-key [M-f10] 'menu-bar-mode)

;;*** menua-bar+
;; improved menu
;; (try-require 'menu-bar+)

;;*** facemenu+
;; This library enhances the "Text Properties" menu.  It adds menu
;; items to the menu, and provides two different versions of the
;; menu: one for the menu-bar Edit menu (`facemenu-menu') and one for
;; the mouse popup menu (`facemenu-mouse-menu').  In standard library
;; `facemenu.el', these two menus are the same.
;; (require 'facemenu+)

;;** tool-bar
;; No tool bar as default
(tool-bar-mode -1)

;; toggle tool-bar display
(global-set-key [C-f10] 'tool-bar-mode)

;;*** tool-bar+
;; improved tool bar; broken
;; (try-require 'tool-bar+)

;;** scroll-bar
;; No scroll bar as default
(scroll-bar-mode -1)

;;** tabbar
;; tab style buffer switch
;; `tabbar-mode'
;;     Toggle the Tabbar global minor mode.  When enabled a tab bar is
;;     displayed in the header line.
;;
;; `tabbar-local-mode'         (C-c <C-f10>)
;;     Toggle the Tabbar-Local minor mode.  Provided the global minor
;;     mode is turned on, the tab bar becomes local in the current
;;     buffer when the local minor mode is enabled.  This permits to
;;     see the tab bar in a buffer where the header line is already
;;     used by another mode (like `Info-mode' for example).
;;
;; `tabbar-mwheel-mode'
;;     Toggle the Tabbar-Mwheel global minor mode.  When enabled you
;;     can use the mouse wheel to navigate through tabs of groups.
;;
;; `tabbar-press-home'         (C-c <C-home>)
;; `tabbar-press-scroll-left'  (C-c <C-prior>)
;; `tabbar-press-scroll-right' (C-c <C-next>)
;;     Simulate a mouse-1 click on respectively the "home", "scroll
;;     left", and "scroll right" buttons.  A numeric prefix argument
;;     value of 2, or 3, respectively simulates a mouse-2, or mouse-3
;;     click.
;;
;; `tabbar-backward'           (C-c <C-left>)
;; `tabbar-forward'            (C-c <C-right>)
;;     Are the basic commands to navigate cyclically through tabs or
;;     groups of tabs.  The cycle is controlled by the
;;     `tabbar-cycle-scope' option.  The default is to navigate
;;     through all tabs across all existing groups of tabs.  You can
;;     change the default behavior to navigate only through the tabs
;;     visible on the tab bar, or through groups of tabs only.  Or use
;;     the more specialized commands below.
;;
;; `tabbar-backward-tab'
;; `tabbar-forward-tab'
;;     Navigate through the tabs visible on the tab bar.
;;
;; `tabbar-backward-group'     (C-c <C-up>)
;; `tabbar-forward-group'      (C-c <C-down>)
;;     Navigate through existing groups of tabs.

;; (require 'tabbar)
;; (tabbar-mode 1)
;; (global-set-key (kbd "C-+") 'tabbar-forward-group)
;; (global-set-key (kbd "C-_") 'tabbar-backward-group)
;; (global-set-key (kbd "C-=") 'tabbar-forward)
;; (global-set-key (kbd "C--") 'tabbar-backward)
;; (setq tabbar-cycling-scope (quote tabs))
;; (setq tabbar-cycling-scope nil)

;;-----------------------------------------------

;;*** tabbar-ruler
;; (setq EmacsPortable-global-tabbar 't) ; If you want tabbar
;; (setq EmacsPortable-global-ruler 't) ; if you want a global ruler
;; (setq EmacsPortable-popup-menu 't) ; If you want a popup menu.
;; (setq EmacsPortable-popup-toolbar 't) ; If you want a popup toolbar
;; (require 'tabbar-ruler)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Point (cursor) settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;光标不闪烁
(blink-cursor-mode -1)

;; Draw block cursor
(setq x-stretch-cursor t)

;;** bar-cursor
;; 光标由方块变成一个小长条
;; (require 'bar-cursor)

;;** cursor-change
;; 智能的改变光标形状
;; REF: http://emacser.com/cursor-change.htm
;; (when (try-require 'cursor-change)
;;   (cursor-change-mode 1))
;; (cursor-change-mode 1)

;;** pulse
;; 实现Emacs的淡入淡出效果
;; REF: http://emacser.com/pulse.htm
;; (require 'pulse)
(eval-after-load "pulse"
  `(progn
     (pulse-face-settings)
     (pulse-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Mouse settings
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* 所有关于括号的配置
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** paren-mode
;; (show-paren-mode 1)
;; (eval-after-load "paren"
;;   `(progn
;;      ;; (paren-face-settings)
;;      (paren-settings)))

;;** mic-paren
;; An extension and replacement to the packages `paren.el' and
;; `stig-paren.el' for Emacs
;; (require 'mic-paren)
(paren-activate)
(eval-after-load "mic-paren"
  `(progn
     ;; (mic-paren-face-settings)
     (mic-paren-settings)))

;;** rainbow-delimiters
;; With this package, the delimiters all get different colors based on
;; their nesting level. It works wonderfully well
;; NOTE: It takes a lot of computation resource, so I disabled it.
;; (require 'rainbow-delimiters)
;; (am-add-hooks
;;  `(find-file-hook
;;    help-mode-hook Man-mode-hook log-view-mode-hook
;;    compilation-mode-hook gdb-mode-hook lisp-interaction-mode-hook
;;    browse-kill-ring-mode-hook completion-list-mode-hook hs-hide-hook
;;    inferior-ruby-mode-hook custom-mode-hook Info-mode-hook
;;    svn-log-edit-mode-hook package-menu-mode-hook dired-mode-hook
;;    apropos-mode-hook)
;;  'rainbow-delimiters-mode)
;; (eval-after-load "rainbow-delimiters"
;;   `(progn
;; 	 (rainbow-delimiters-settings)))

;;** highlight-parentheses
;; 用颜色配对括号
;; (require 'highlight-parentheses)
(eval-after-load "highlight-parentheses"
  `(progn
     (highlight-parentheses-settings)))
(am-add-hooks
 `(find-file-hook help-mode-hook Man-mode-hook log-view-mode-hook
   custom-mode-hook Info-mode-hook compilation-mode-hook
   svn-log-edit-mode-hook package-menu-mode-hook dired-mode-hook
   browse-kill-ring-mode-hook completion-list-mode-hook
   apropos-mode-hook hs-hide-hook inferior-ruby-mode-hook
   gdb-mode-hook
   emacs-lisp-mode-hook lisp-interaction-mode-hook lisp-mode-hook
   c-mode-common-hook cc-mode-hook
   vhdl-mode-hook verilog-mode-hook
   matlab-mode-hook
   LaTeX-mode-hook latex-mode-hook)
 '(lambda ()
	(require 'highlight-parentheses)
	(highlight-parentheses-mode 1)))

;;** autopair
;; 自动给你加上括号
;; NOTE: autopair-global-mode cause problem with auctex, so use hooks
;; with other modes.
;; (autopair-global-mode 1)

;; (require 'autopair)
;; (eval-after-load "autopair"
;;   '(autopair-settings))
(am-add-hooks
 `(lisp-interaction-mode-hook lisp-mode-hook emacs-lisp-mode-hook
   cperl-mode-hook cc-mode-hook
   vhdl-mode-hook verilog-mode-hook
   matlab-mode-hook
   ;; org-mode-hook text-mode-hook
   )
 '(lambda ()
	(require 'autopair)
	(autopair-mode)))

;; ;; 输入左大花扩号自动补齐右大花括号
;; (eal-define-keys
;;  `(c-mode-base-map awk-mode-map)
;;  `(("{" skeleton-c-mode-left-brace)))

;; Global key bindings
(eal-define-keys-commonly
 global-map
 `(("C-M-]" ywb-indent-accoding-to-paren)
   ("\C-]"  goto-paren)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Syntax highlighting
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** font-lock
(global-font-lock-mode 1)
(eval-after-load "font-lock"
  `(progn
     (font-lock-settings)
	 ;; (font-lock-face-settings)
	 ))

;;** smart-hl
;; 像Eclipse那样双击高亮当前字符串
;; NOTE: A part of codepilot which is removed.
;;       Use highlight-symbol-mode instead.
;; (require 'smart-hl)

;;** highlight-symbol
;; 像Eclipse那样高亮光标处单词
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

;;** zjl-hl
;; use CEDET semantic to highlight function calls
(eval-after-load "zjl-hl"
  '(progn
	 (zjl-hl-face-settings)
	 (zjl-hl-settings)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Color settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;** generic-x
;; 增加更丰富的高亮
;; (require 'generic-x)

;;** color-theme
;; fancy themes for emacs
;; REF: http://emacser.com/color-theme.htm
;; (require 'color-theme-autoloads)
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-settings)))
(eal-define-keys-commonly
 color-theme-mode-map
 `(("'"   switch-to-other-buffer)
   ("u"   View-scroll-half-page-backward)
   ("SPC" scroll-up)
   ("1"   delete-other-windows)
   ("."   find-symbol-at-point)))

;;** doremi
;; (eval-after-load "icicles" `(doremi-settings))

;;** palette
;; emacs 的调色板
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
