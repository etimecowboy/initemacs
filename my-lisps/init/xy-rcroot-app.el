;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-app.el'
;; Time-stamp:<2011-12-10 Sat 05:11 xin on p6t>
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

;; TODO: create my own frame layout
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

(when window-system
  (require 'fit-frame)
  ;; (eval-after-load "fit-frame"
  ;;   '(progn
  ;;      (fit-frame-settings)))
  (add-hook 'after-make-frame-functions 'fit-frame)
  (require 'autofit-frame)
  (require 'thumb-frm)
  ;; (require 'maxframe) ;; NOTE: not very stable with two or more
                         ;; monitors, so use system function is better.
  ;; ;; (eval-after-load "maxframe"
  ;;   '(progn
  ;;      (maxframe-settings)))
)

;;====================================================================
;;* Window settings

;;** window-number
;; (autoload 'window-number-mode "window-number"
;;   "A global minor mode that enables selection of windows according to
;; numbers with the C-x C-j prefix.  Another mode,
;; `window-number-meta-mode' enables the use of the M- prefix." t)
;; (autoload 'window-number-meta-mode "window-number"
;;   "A global minor mode that enables use of the M- prefix to select
;; windows, use `window-number-mode' to display the window numbers in
;; the mode-line." t)
;; (add-hook 'org-mode-hook
;;           '(lambda ()
;;              (window-number-meta-mode t)))
(when (try-require 'window-number)
  (window-number-meta-mode 1))

;;--------------------------------------------------------------------
;;** windmove
;; NOTE: not fast enough, use `window-number.el'
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

;;--------------------------------------------------------------------
;;** Winner mode for window splits
(winner-mode 1)

;;--------------------------------------------------------------------
;;** Windresize

;;====================================================================
;;* Buffer settings

(global-visual-line-mode 1) ;; Wrap line dynamically
(setq visual-line-fringe-indicators '(nil right-curly-arrow))
(setq word-wrap t)
(setq-default
 indicate-buffer-boundaries 'left)    ;; Display buffer boudaries
(setq-default indicate-empty-lines t) ;; Indicate empty lines
(setq inhibit-startup-screen t) ;; Do not display starup welcome screen
(setq visible-bell t) ;; Use visible bell instead of bell sound
(setq-default echo-keystrokes 0.1)    ;; Display key strokes quickly
;; (setq chart-face-use-pixmaps t)    ;; Prefer pixmap icons
;; (defalias 'yes-or-no-p 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)   ;; Use "y-or-n" instead of "yes-or-no"
(auto-image-file-mode 1)        ;; automatically display images
(global-auto-revert-mode 1)     ;; automatically refresh buffer
(setq sentence-end-double-space nil)
(setq no-redraw-on-reenter t)   ;; Do not redraw on reenter

;; emacs lock
;; (autoload 'toggle-emacs-lock "emacs-lock" "Emacs lock" t)

;;====================================================================
;;* mode-line settings

(setq-default ;; Display mode-line the same in non-selected windows
 mode-line-in-non-selected-windows nil)
(column-number-mode 1) ;; Display column number
(size-indication-mode 1) ;; Display the current location in the file
(setq-default mode-line-buffer-identification
              (propertized-buffer-identification "%b"))
;; (setq display-time-day-and-date t) ;; Display time and date
;; (display-time-mode 1)
;; (when is-after-emacs-23
;;   (display-battery-mode -1)) ;; battery infomation is not necessary

;;--------------------------------------------------------------------
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
(eval-after-load "flyspell" '(diminish 'flyspell-mode))
(eval-after-load "autopair" '(diminish 'autopair-mode))
(eval-after-load "hideshow" '(diminish 'hs-minor-mode))
(eval-after-load "xy-recent-jump" '(diminish 'recent-jump-mode))
(eval-after-load "xy-recent-jump-small" '(diminish 'recent-jump-small-mode))
(eval-after-load "ibus" '(diminish 'ibus-mode))
(eval-after-load "outline" '(diminish 'outline-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))

;;--------------------------------------------------------------------
;;** modeline-posn
;; (require 'modeline-posn)  ;; Display number of characters in region

;;--------------------------------------------------------------------
;;** hide-mode-line
;; REF: (@url :file-name "http://webonastick.com/emacs-lisp/hide-mode-line.el" :display "Source")
;; NOTE: NOT good for me, cause no screen sapce can be saved
;; (autoload 'hide-mode-line "hide-mode-line" nil t)
;; (hide-mode-line)
;; Don't show mode-line, after all mode-line configureation is done

;;--------------------------------------------------------------------
;;** mode-line-frame
;; offers a frame to show various information
;; Just call `xy/separate-line-frame' to use it.
(eval-after-load "mode-line-frame"
  '(progn
     (mode-line-frame-settings)))

;;====================================================================
;;* mini-buffer settings

(setq enable-recursive-minibuffers t)
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)
;; (minibuffer-electric-default-mode t) ;; ido or icicles

;;====================================================================
;;* Vaious bar settings

;;** menu-bar
(menu-bar-mode -1) ;; No menu bar as default

;;*** menua-bar+
(try-require 'menu-bar+)

;;*** facemenu+
;; This library enhances the "Text Properties" menu.  It adds menu
;; items to the menu, and provides two different versions of the
;; menu: one for the menu-bar Edit menu (`facemenu-menu') and one for
;; the mouse popup menu (`facemenu-mouse-menu').  In standard library
;; `facemenu.el', these two menus are the same.
;; (require 'facemenu+)

;;--------------------------------------------------------------------
;;** tool-bar
(tool-bar-mode -1)

;;*** tool-bar+
(try-require 'tool-bar+)

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

(blink-cursor-mode 1)
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
(setq mouse-wheel-scroll-amount '(5 ((shift) . 1) ((control))))
;;(setq mouse-autoselect-window 1.0) ;; don't auto select

(eval-after-load "mouse-drag"
  '(progn
     (setq mouse-throw-with-scroll-bar nil)))

;; Mouse support in terminal
(when (not window-system)
  (xterm-mouse-mode 1))

;;====================================================================
;;* Syntax highlighting

;;** font-lock
(global-font-lock-mode 1)
(eval-after-load "font-lock"
  '(progn
     (font-lock-settings)))

;;--------------------------------------------------------------------
;;** hl-line
;; (global-hl-line-mode 1) ; (if window-system 1 -1)

;;--------------------------------------------------------------------
;;** hi-lock
;; (global-hi-lock-mode 1)
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
