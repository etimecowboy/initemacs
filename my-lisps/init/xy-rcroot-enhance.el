;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-enhance.el'
;; Time-stamp:<2011-02-19 Sat 17:10 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Basic enhancements
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enable some hidden functions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs system improvement
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ffap, finding Files and URLs at Point
;; REF: 
;;   http://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html#index-ffap-3860
(ffap-bindings)
(eval-after-load "ffap" `(ffap-settings))

;;------------------------------------------------------------------

;; undo and redo
;; BUG: redo does not work
(autoload 'redo "redo+"
  "Redo the the most recent undo.
Prefix arg COUNT means redo the COUNT most recent undos.
If you have modified the buffer since the last redo or undo,
then you cannot redo any undos before then." t)
(autoload 'undo "redo+"
  "Undo some previous changes.
Repeat this command to undo more changes.
A numeric argument serves as a repeat count." t)
(global-set-key (kbd "M-_") 'redo)
(global-set-key (kbd "C-_") 'undo) ;; or C-/

;;------------------------------------------------------------------

;; 打开压缩文件时自动解压缩, 必须在 `session.el' 前面启用。
(auto-compression-mode 1)

;;------------------------------------------------------------------

;; 查看Emacs内进程
(autoload 'list-processes+ "list-processes+" 
  "Enhanced `list-processes'" t)

;;------------------------------------------------------------------

;; 统计命令使用频率
(autoload 'command-frequence "command-frequence"
  "Emacs command frequence statistics" t)

;;------------------------------------------------------------------

;; Move deleted files to system trash
;; It seems that this cause error when quiting emacs-23.1
;; in Linux systems --- Org-babel temporary directories cannot
;; be deleted. emacs-23.2 seems OK with this problem, but it works
;; not as expected (move deleted files to system trash).
;; Comment out for comparability. 
(when is-after-emacs-23
  (setq delete-by-moving-to-trash t))

;;------------------------------------------------------------------

;; todochiku:  notification tool,
;; It started life interfacing with Growl (OS X, http://growl.info/), 
;; Snarl (Win 32, http://www.fullphat.net/) and libnotify (linux/unix). 
;; It can also do standard messages (in the minibuffer) and pop up a tooltip.

;;------------------------------------------------------------------

;; Kill ring
;; Do not save same cut
(setq kill-do-not-save-duplicates t)
;; Set a large kill ring
(setq kill-ring-max 500)
;; Save paster before kill emacs
(setq save-interprogram-paste-before-kill t)

;; browse-kill-ring，查看循环剪贴板的内容
;; (autoload 'browse-kill-ring "browse-kill-ring" 
;;   "Check contents in the kill ring" t)
(eval-after-load "browse-kill-ring"
  `(progn
     (browse-kill-ring-settings)
     (browse-kill-ring-face-settings)
	 (eal-define-keys
	  'browse-kill-ring-mode-map
	  `(("RET" browse-kill-ring-insert-and-quit)
		("<"   beginning-of-buffer)
		(">"   end-of-buffer)
		("j"   next-line)
		("k"   previous-line)
		("h"   backward-char)
		("l"   forward-char)
		("n"   browse-kill-ring-forward-without-linum-mode)
		("p"   browse-kill-ring-previous-without-linum-mode)
		("SPC" scroll-up)
		("U"   scroll-down)
		("u"   View-scroll-half-page-backward)
		("o"   other-window)))))

(global-set-key (kbd "C-=") 'browse-kill-ring)

;;-------------------------------------------------------------------

;; linum-mode settings
(am-add-hooks
 `(find-file-hook
   log-view-mode-hook chart-mode-hook
   hs-hide-hook
   svn-log-edit-mode-hook package-menu-mode-hook
   apropos-mode-hook svn-log-view-mode-hook
   diff-mode-hook emacs-lisp-mode-hook html-mode-hook
   data-debug-hook debugger-mode-hook
   semantic-symref-results-mode-hook sh-mode-hook
   matlab-mode-hook matlab-shell-mode-hook)
 '(lambda()
   (unless (or (eq major-mode 'image-mode)
	       (eq major-mode 'org-mode)
		   (eq major-mode 'custom-mode)
		   (eq major-mode 'lisp-interaction-mode))
     (linum-mode 1))))
(global-set-key [f7] 'linum-mode)
(eval-after-load 'linum
  `(progn 
     (linum-face-settings)
     (linum-settings)))

;;------------------------------------------------------------------

;; Add time stamp to file
;; maintain last change time stamps (`Time-stamp: <>' occurring within the
;; first 8 lines) in files edited by Emacs
(add-hook 'write-file-hooks 'time-stamp)
(eval-after-load "time-stamp"
  '(progn
     (time-stamp-settings)))

;;------------------------------------------------------------------

;; Add copyright statment
;; (GNUEmacs
;;  ;; update the copyright notice in current buffer
;;  (when (try-require 'copyright)
;; 	       ; XXX Check no other copyright.el gets in the way
;;    (add-hook 'write-file-hooks 'copyright-update)))

;;-------------------------------------------------------------

;; Spelling: Use ASpell & flyspell
(setq text-mode-hook 'flyspell-mode)
(eval-after-load 'flyspell
  `(progn
     (flyspell-settings)))

;;-------------------------------------------------------------

;; Hanconvert, 自动在简体中文和繁体中文间转换.
(autoload 'hanconvert-region "hanconvert"
  "Convert a region from simple chinese to tradition chinese or
from tradition chinese to simple chinese" t)

;;-------------------------------------------------------------

;; 把文件或buffer彩色输出成html
;; (require 'htmlize)

;;-------------------------------------------------------------

;; Calendar
(eval-after-load "calendar"
  `(progn
     (calendar-settings)))

;;-------------------------------------------------------------

;; inkd, 在各种 text 文档间提供链接
(eval-after-load "linkd"
  `(progn
     (linkd-settings)
     (linkd-face-settings)
	 (eal-define-keys
	  'linkd-overlay-map
	  `(("n"        linkd-next-link)
	    ("p"        linkd-previous-link)
	    ("<return>" linkd-follow-at-point)))
	 (eal-define-keys
	  'linkd-map
	  `(("<mouse-4>" nil)
	    ("C-c ," nil)))))

;;------------------------------------------------------------------

;; ascii表查询
;; (autoload 'ascii-on        "ascii"
;;   "Turn on ASCII code display."   t)
;; (autoload 'ascii-off       "ascii"
;;   "Turn off ASCII code display."  t)
;; (autoload 'ascii-display   "ascii"
;;   "Toggle ASCII code display."    t)
;; (autoload 'ascii-customize "ascii"
;;   "Customize ASCII code display." t)

;;------------------------------------------------------------------

;; 以另一用户编辑文件, 或者编辑远程主机文件
(eval-after-load "tramp" `(tramp-settings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Use terminals in Emacs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; term mode 
;; (eval-after-load "term" 
;;   `(progn
;;      (term-settings)))

;;--------------------------------------------------------------------

;; multi-term: a mode based on term.el, 
;; for managing multiple terminal buffers in Emacs.
(define-key global-map (kbd "C-x T") 'multi-term-start)
(eval-after-load "multi-term" 
  `(progn
     (multi-term-settings)
	 (eal-define-keys-commonly
	  'global-map
	  `(("C-x T n" multi-term-next)
	    ("C-x T p" multi-term-prev)))))
	 ;; (eal-define-keys
	 ;;  'text-mode-map
	 ;;  `(("M-J"   switch-term-and-text)
	 ;;    ("M-L"   enter-term-mode)))))

;;----------------------------------------------------------------------

;; Shell/eshell mode
;;(define-key shell-mode-map "\M-m" 'shell-add-to-history)

;;----------------------------------------------------------------------

;; Backgrounding a process in shell mode
;; You might find it difficult to background 
;; a process that’s started, once you’re in shell mode.
;; If you hit ‘C-z’, you end up backgrounding Emacs!
;; To solve this, just execute
;;  M-x local-set-key RET C-z self-insert-command 
;; And if you want to background Emacs, just go to a different buffer.
;; ‘C-q C-z’ doesn’t work? - No, but C-c C-z should.

;;----------------------------------------------------------------------

;; Shell-pop, pop up a window for shell
(autoload 'shell-pop "shell-pop" "Pop-up a shell" t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(eval-after-load "shell-pop"
  '(progn
     (shell-pop-settings)))

(global-set-key [f9] 'shell-pop)
(global-set-key [S-f9] 'shell)
(global-set-key [C-f9] 'eshell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Save editing information
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Save point places in buffers
(setq save-place 1)
(setq save-place-file (concat my-var-path "/sav_plc"))
(OfficePC
 (setq save-place-file (concat my-var-path "/sav_plc-office")))
(HomeDesktop
 (setq save-place-file (concat my-var-path "/sav_plc-home-desktop")))
(Laptop
 (setq save-place-file (concat my-var-path "/sav_plc-laptop")))

;;-----------------------------------------------------------------------

;; Winpoint,
;; When two windows view the same buffer at the same time, and one
;; window is switched to another buffer and back, point is now the
;; same as in the other window, not as it was before we switched away.
;; This mode tries to work around this problem by storing and
;; restoring per-window positions for each buffer.
(require 'winpoint)
(window-point-remember-mode 1)
(setq winpoint-non-restore-buffer-list '("*Group*"))

;;-----------------------------------------------------------------------

;; Bookmark
;; * ‘C-x r m’ – set a bookmark at the current location (e.g. in a file)
;; * ‘C-x r b’ – jump to a bookmark
;; * ‘C-x r l’ – list all of your bookmarks
;; * ‘M-x bookmark-delete’ – delete a bookmark by name
;; Some keys in `*Bookmark List*’:
;; * ‘a’ – show annotation for the current bookmark
;; * ‘A’ – show all annotations for your bookmarks
;; * ‘d’ – mark various entries for deletion 
;;         (‘x’ – to delete them)
;; * ‘e’ – edit the annotation for the current bookmark
;; * ‘m’ – mark various entries for display and other operations, 
;;         (‘v’ – to visit)
;; * ‘o’ – visit the current bookmark in another window, 
;;         keeping the bookmark list open
;; * ‘C-o’ – switch to the current bookmark in another window
;; * ‘r’ – rename the current bookmark

(setq bookmark-default-file (concat my-var-path "/bookmark"))
(OfficePC
 (setq bookmark-default-file (concat my-var-path "/bookmark-officePC")))
(HomeDesktop
 (setq bookmark-default-file (concat my-var-path "/bookmark-home-desktop")))
(Laptop
 (setq bookmark-default-file (concat my-var-path "/bookmark-laptop")))

(setq bookmark-save-flag 1)

;;---------------------------------------------------------------------

;; Bookmark+
(autoload 'bookmark+ "bookmark+" "Enhanced Emacs bookmark" t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Save Emacs session information 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Recent files
;; (recentf-mode 1)
;; (setq recentf-save-file "~/emacs/recentf")
;; (setq recentf-max-saved-items 100)
;; (setq recentf-max-menu-items 20)
;; (setq recentf-menu-filter 'recentf-sort-basenames-ascending)
;; (setq recentf-save-file-modes 1000)

;;--------------------------------------------------------------------

;; Use session.el instead of recentf.el
;; session.el can remember more information.
(eval-after-load "session" `(session-settings))
(add-hook 'after-init-hook 'session-initialize)

;;---------------------------------------------------------------------

;; Workspace store and recover
;; windows.el
(eval-after-load "windows" `(windows-settings))
(add-hook 'after-init-hook 'windows-start)
(define-key ctl-x-map "C" 'see-you-again)
(define-key ctl-x-map "S" 'win-save-all-configurations)
(define-key ctl-x-map "V" 'resume-windows)
;; revive.el
(eval-after-load "revive" `(revive-settings))
;; And define favorite keys to those functions.
;; (define-key ctl-x-map "F" 'resume)
;; (define-key ctl-x-map "K" 'wipe)

(provide 'xy-rcroot-enhance)
