;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-app.el'
;; Time-stamp:<2011-12-08 Thu 17:49 xin on p6t>
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

;;====================================================================
;;* Frame settings

;;** Default frame layout
;; (when window-system
;;   ;; Initial fram layout
;;   ;; (setq initial-frame-alist
;;   ;;     '((height . 40)
;;   ;;       (width  . 90)))
;;   ;; ;; New frame layout
;;   ;; (setq pop-up-frame-alist
;;   ;;     '((height . 40)
;;   ;;       (width  . 90)))
;;   ;; Default frame layout
;;   ;; (setq 'default-frame-alist
;;   ;;     '((height . 40)
;;   ;;       (width  . 90)))
;;   (add-to-list 'default-frame-alist '(height . 40))
;;   (add-to-list 'default-frame-alist '(width . 95)))

;;--------------------------------------------------------------------
;;** Frame title
;; ;; Set frame title display: filename @ process
;; ;; (setq frame-title-format "%f @ %s")
;; (setq frame-title-format
;;       `(,(user-login-name) "@" ,(system-name) "     "
;;         global-mode-string "     %f" ))
;; ;; 在标题栏显示登陆名称和文件名
;; ;; NOTE: `windows.el' and `revive.el' overwirte title
;; ;; (setq frame-title-format
;; ;;       '((:eval
;; ;;          (let ((login-name (getenv-internal "LOGNAME")))
;; ;;            (if login-name (concat login-name "@") "")))
;; ;;         (:eval (system-name))
;; ;;         ":"
;; ;;         (:eval (or (buffer-file-name) (buffer-name)))))

;;--------------------------------------------------------------------
;;** Transparent frame
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/TransparentEmacs" :display "emacswiki")
;; BUG: not work in Windows 7, nor in Linux with gnome 3
;; (when (and is-after-emacs-23 window-system) ; from emacs-22

;;   ;; User controls the frame opacity
;;   ;; (set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;;   (set-frame-parameter (selected-frame) 'alpha '(100 100))
;;   (add-to-list 'default-frame-alist '(alpha 100 100))
;;   (global-set-key (kbd "C-x W t") 'toggle-transparency))

;;---------------------------------------------------------------------
;;** Resize frame and window
;;*** fit-frame
;; NOTE:
;;      - `fit-frame.el':     resizes a frame in order to  fit a frame
;;                            to its buffers.
;;      - `autofit-frame.el': do it automatically. May be annoying. I
;;                            don't like it.
;; (require 'fit-frame)
(eval-after-load "fit-frame"
  '(progn
     (fit-frame-settings)))

;;*** thumb-frm
;; Shrink frames to a thumbnail size and restore them again.
;; BUG: Info-mode conflict with thumb-frm when doing isearch or mouse
;; click on info links. However, it is easy to fix when you
;; `fit-frame' (`M-x xy/fit-frame' or S-<f5>)
;; (require 'thumb-frm)
;; (define-key special-event-map [iconify-frame]
;;             'thumfr-thumbify-frame-upon-event)
;; (global-set-key [(shift mouse-3)]
;;                 'thumfr-toggle-thumbnail-frame)
;; (global-set-key [(shift control mouse-3)]
;;                 'thumfr-thumbify-other-frames)
(global-set-key [(shift meta ?z)]
                'thumfr-thumbify-other-frames)
(global-set-key [(shift control ?p)]
                'thumfr-fisheye-previous-frame)
(global-set-key [(shift control ?n)]
                'thumfr-fisheye-next-frame)
(global-set-key [(shift control ?z)]
                ;;'thumfr-really-iconify-or-deiconify-frame)
                'thumfr-toggle-thumbnail-frame)

;;*** maxframe
(eval-after-load "maxframe"
  '(progn
     (maxframe-settings)))
(global-set-key (kbd "C-<f5>") 'maximize-frame)
(global-set-key (kbd "C-S-<f5>") 'restore-frame)

;;====================================================================
;;* Window settings

;;** window-number
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
numbers with the C-x C-j prefix.  Another mode,
`window-number-meta-mode' enables the use of the M- prefix." t)
(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
windows, use `window-number-mode' to display the window numbers in
the mode-line." t)
(global-set-key (kbd "M-S-<f5>") 'window-number-meta-toggle)

;;--------------------------------------------------------------------
;;** Windmove
(eval-after-load "windmove"
  '(progn
     (windmove-settings)))

;;--------------------------------------------------------------------
;;** buffer-move
;; swap buffers without typing C-x b on each window
;; (require 'buffer-move)
(autoload 'buf-move-up "buffer-move" nil t)
(autoload 'buf-move-down "buffer-move" nil t)
(autoload 'buf-move-left "buffer-move" nil t)
(autoload 'buf-move-right "buffer-move" nil t)
(global-set-key (kbd "M-S-<up>")     'buf-move-up)
(global-set-key (kbd "M-S-<down>")   'buf-move-down)
(global-set-key (kbd "M-S-<left>")   'buf-move-left)
(global-set-key (kbd "M-S-<right>")  'buf-move-right)

;;--------------------------------------------------------------------
;;** Winner mode for window splits
(winner-mode 1)

;;--------------------------------------------------------------------
;;** Windresize
(global-set-key (kbd "M-<f5>") 'windresize)

;;====================================================================
;;* Buffer settings

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

;;====================================================================
;;* mode-line settings

;; Do not display mode-line in non-selected windows
(setq-default mode-line-in-non-selected-windows 1)

;; Display column number
(column-number-mode 1)

;; Display the current location in the file
(size-indication-mode 1)
(setq-default mode-line-buffer-identification
              (propertized-buffer-identification "%b"))

;; Display time and date
;; NOTE: with the use of `maxframe.el', the maximized frame takes the
;; whole monitor, so I have to display the time.
;; (if (not window-system)
;;     (progn
;;       (setq display-time-day-and-date t)
;;       (display-time-mode 1))
;;   (progn
;;     (setq display-time-day-and-date nil)
;;     (display-time-mode -1)))
(setq display-time-day-and-date t)
(display-time-mode 1)

;; Display battery infomation, after Emacs-22
;; (when is-after-emacs-23 (display-battery-mode -1))

;;--------------------------------------------------------------------
;;** diminish
;; Removing or abbreviating minor mode indicators
(eval-after-load "filladapt" '(diminish 'filladapt-mode))
(eval-after-load "icicles" '(diminish 'icicle-mode))
(eval-after-load "highlight-symbol"
  '(diminish 'highlight-symbol-mode))
(eval-after-load "highlight-parentheses"
  '(diminish 'highlight-parentheses-mode))
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
(eval-after-load "xy-recent-jump-small"
  '(diminish 'recent-jump-small-mode))
(eval-after-load "ibus" '(diminish 'ibus-mode))
(eval-after-load "outline" '(diminish 'outline-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))

;;--------------------------------------------------------------------
;;** modeline-posn
;; Display number of characters in a selected region
(require 'modeline-posn)

;;--------------------------------------------------------------------
;;** mode-line-frame
;; offers a frame to show various information
;; (require 'mode-line-frame)
;; (mode-line-frame-create)

;;====================================================================
;;* mini-buffer settings

;; 可以递归的使用minibuffer
(setq enable-recursive-minibuffers t)
;; 当你在shell、telnet、w3m等模式下时，加密显出你的密码
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)
;; (minibuffer-electric-default-mode t)

;;====================================================================
;;* Vaious bar settings

;;** menu-bar
;; No menu bar as default
(menu-bar-mode -1)

;; Toggle menua display
(global-set-key (kbd "M-<f10>") 'menu-bar-mode)

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

;;--------------------------------------------------------------------
;;** tool-bar
;; No tool bar as default
(tool-bar-mode -1)

;; toggle tool-bar display
(global-set-key (kbd "C-<f10>") 'tool-bar-mode)

;;*** tool-bar+
;; improved tool bar; broken
;; (try-require 'tool-bar+)

;;--------------------------------------------------------------------
;;** scroll-bar
;; No scroll bar as default
(scroll-bar-mode -1)
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

;;--------------------------------------------------------------------
;;** tabbar
;; tab style buffer switch
;; (require 'tabbar)
;; (tabbar-mode 1)
;; (global-set-key (kbd "C-+") 'tabbar-forward-group)
;; (global-set-key (kbd "C-_") 'tabbar-backward-group)
;; (global-set-key (kbd "C-=") 'tabbar-forward)
;; (global-set-key (kbd "C--") 'tabbar-backward)
;; (setq tabbar-cycling-scope (quote tabs))
;; (setq tabbar-cycling-scope nil)

;;*** tabbar-ruler
;; (setq EmacsPortable-global-tabbar 't) ; If you want tabbar
;; (setq EmacsPortable-global-ruler 't) ; if you want a global ruler
;; (setq EmacsPortable-popup-menu 't) ; If you want a popup menu.
;; (setq EmacsPortable-popup-toolbar 't) ; If you want a popup toolbar
;; (require 'tabbar-ruler)

;;====================================================================
;;* Point (cursor) settings

;;光标不闪烁
(blink-cursor-mode 1)

;; Draw block cursor
(setq x-stretch-cursor t)

;;--------------------------------------------------------------------
;;** bar-cursor
;; 光标由方块变成一个小长条
;; (require 'bar-cursor)

;;--------------------------------------------------------------------
;;** cursor-change
;; 智能的改变光标形状
;; REF: (@url :file-name "http://emacser.com/cursor-change.htm" :display "emacser")
;; (when (try-require 'cursor-change)
;;   (cursor-change-mode 1))
;; (cursor-change-mode 1)

;;====================================================================
;;* Mouse settings

;; (mouse-wheel-mode 1)
;; (mouse-sel-mode 1)
(mouse-avoidance-mode 'jump)
(setq mouse-drag-copy-region nil)
(setq mouse-wheel-progressive-speed t)
(setq mouse-wheel-scroll-amount
      '(5
        ((shift) . 1)
        ((control))))
;;(setq mouse-autoselect-window 1.0)

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

;;====================================================================
;;* Syntax highlighting

;;** font-lock
(global-font-lock-mode 1)
(eval-after-load "font-lock"
  '(progn
     (font-lock-settings)
     ;; (font-lock-face-settings)
     ))

;;--------------------------------------------------------------------
;;** hl-line
;; Higligh current line
;; (setq hl-line-face 'underline)
;; (global-hl-line-mode 1) ; (if window-system 1 -1)

;;--------------------------------------------------------------------
;;** hi-lock
(global-hi-lock-mode 1)
(eal-define-keys
 'hi-lock-map
 `(("C-c H l" highlight-lines-matching-regexp)
   ("C-c H f" hi-lock-find-patterns)
   ("C-c H x" highlight-regexp)
   ("C-c H h" highlight-phrase)
   ("C-c H u" unhighlight-regexp)
   ("C-c H w" hi-lock-write-interactive-patterns)
   ("C-c H a" hi-lock-show-all)))

;;--------------------------------------------------------------------
;;** highlight-symbol
;; 像Eclipse那样高亮光标处单词, 基于hi-lock，方便但是不能保存高亮设置
;; (require 'highlight-symbol)
(eval-after-load "highlight-symbol"
  '(progn
     ;; (highlight-symbol-face-settings)
     (highlight-symbol-settings)))

;; NOTE: C-x H has been binded to `goto-help-buffer'
(eal-define-keys
 `(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map
   c-mode-base-map c++-mode-map perl-mode-map
   org-mode-map text-mode-map ruby-mode-map html-mode-map)
 `(("C-c H m" highlight-symbol-at-point)
   ("C-c H d" highlight-symbol-remove-all)
   ("C-c H n" highlidght-symbol-next)
   ("C-c H p" highldight-symbol-prev)
   ("C-c H r" highlight-symbol-query-replace)
   ("C-c H N" highlight-symbol-next-in-defun)
   ("C-c H P" highlight-symbol-prev-in-defun)))

;;--------------------------------------------------------------------
;;** smart-hl
;; 像Eclipse那样双击高亮当前字符串
;; NOTE: A part of codepilot which is removed.
;;       Use highlight-symbol-mode instead.
;; (require 'smart-hl)

;;--------------------------------------------------------------------
;;** zjl-hl
;; use CEDET semantic to highlight function calls
(eval-after-load "zjl-hl"
  '(progn
     (zjl-hl-face-settings)
     (zjl-hl-settings)))

;;====================================================================
;;* Color settings

;;** generic-x
;; 增加更丰富的高亮
;; (require 'generic-x)

;;--------------------------------------------------------------------
;;** color-theme
;; fancy themes for emacs
;; REF: (@url :file-name "http://emacser.com/color-theme.htm" :display "emacser")
;; (require 'color-theme-autoloads)
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-settings)
     ;; (color-theme-xy-dark)
     (color-theme-solarized-dark)
     ;; (color-theme-zenburn)
     (eal-define-keys-commonly
      color-theme-mode-map
      `(("'"   switch-to-other-buffer)
        ("u"   View-scroll-half-page-backward)
        ("SPC" scroll-up)
        ("1"   delete-other-windows)
        ("."   find-symbol-at-point)))))

;;--------------------------------------------------------------------
;;** doremi
;; (eval-after-load "icicles" `(doremi-settings))

;;--------------------------------------------------------------------
;;** palette
;; emacs 的调色板
;; (defvar facemenup-palette-change-face-bg nil
;;   "Face background be changed or not.")
;; (defvar facemenup-last-face-color nil
;;   "Last face color used.")
;; (eval-after-load "palette"
;;   '(progn
;;      (palette-settings)
;;      (eal-define-keys
;;       'palette-mode-map
;;       `(("j"     palette-down)
;;         ("k"     palette-up)
;;         ("h"     palette-left)
;;         ("l"     palette-right)
;;         ("J"     palette-down-quickly)
;;         ("K"     palette-up-quickly)
;;         ("H"     palette-left-quickly)
;;         ("L"     palette-right-quickly)
;;         ("r"     palette-face-restore-bg-fg)
;;         ("f"     palette-set-face-changed-to-foreground)
;;         ("b"     palette-set-face-changed-to-background)
;;         ("B"     facemenup-face-bg-restore)
;;         ("F"     facemenup-face-fg-restore)
;;         ("d"     palette-disply-which-in-changine)
;;         ("m"     palette-pick-background-at-point)
;;         ("C"     palette-copy-current-color)
;;         ("C-x k" palette-quit-restore-bg-fg)))))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x P" palette)
;;    ("C-x M-F" facemenup-palette-face-fg-at-point)
;;    ("C-x M-B" facemenup-palette-face-bg-at-point)))

(provide 'xy-rcroot-app)
