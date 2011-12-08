;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-session.el'
;; Time-stamp:<2011-12-08 Thu 04:02 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Save editor information between Emacs sessions
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;====================================================================
;;* Save editing information

;;** Winpoint,
;; When two windows view the same buffer at the same time, and one
;; window is switched to another buffer and back, point is now the
;; same as in the other window, not as it was before we switched away.
;; This mode tries to work around this problem by storing and
;; restoring per-window positions for each buffer.
(require 'winpoint)
(window-point-remember-mode 1)
(eval-after-load "winpoint"
  '(progn
     (winpoint-settings)))

;;-----------------------------------------------------------------------
;;** Bookmark
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
(setq bookmark-save-flag 1)
(require 'bookmark)
(eval-after-load "bookmark"
  '(progn
     (bookmark-settings)))

;;*** Bookmark+
;; (require 'bookmark+)

;;*** bm
;; provides visible, buffer local, bookmarks and the ability
;; to jump forward and backward to the next bookmark.
;; (require 'bm)
;; or
;; (autoload 'bm-toggle   "bm" "Toggle bookmark in current buffer." t)
;; (autoload 'bm-next     "bm" "Goto bookmark."                     t)
;; (autoload 'bm-previous "bm" "Goto previous bookmark."            t)

;;   M$ Visual Studio key setup.
(global-set-key (kbd "<f2>") 'bm-toggle)
(global-set-key (kbd "<C-f2>") 'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
;;
;;   Click on fringe to toggle bookmarks, and use mouse wheel to move
;;   between them.
;; (global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
;; (global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)
;;
;;   If you would like the markers on the right fringe instead of the
;;   left, add the following to line:
;;
;;   (setq bm-marker 'bm-marker-right)

;;====================================================================
;;* Save Emacs session information

;;** recentf
(recentf-mode 1)
(eval-after-load "recentf"
  '(progn
     (recentf-settings)))

;;--------------------------------------------------------------------
;;** save-place
;; Save point places in buffers
(setq-default save-place t)
(eval-after-load "saveplace"
  '(progn
     (saveplace-settings)))

;;--------------------------------------------------------------------
;;** savehist
(savehist-mode 1)
(eval-after-load "savehist"
  '(progn
     (savehist-settings)))

;;--------------------------------------------------------------------
;;** filecache
(eval-after-load "filecache"
  '(progn (file-cache-add-directory-list load-path)
          (file-cache-add-directory-list user-include-dirs)
          (file-cache-add-directory "/usr/include")
          (file-cache-add-directory-recursively "/usr/include/c++")
          (file-cache-add-directory-recursively "/usr/local/include")))

;;--------------------------------------------------------------------
;;** windows and revive
;; Workspace store and recover
;; windows.el
(eval-after-load "windows"
  '(progn
     (windows-settings)))
(add-hook 'after-init-hook 'windows-start)
(define-key ctl-x-map "C" 'see-you-again)
(define-key ctl-x-map "S" 'win-save-all-configurations)
(define-key ctl-x-map "V" 'resume-windows)
;; revive.el
(eval-after-load "revive"
  '(progn
     (revive-settings)))
;; And define favorite keys to those functions.
;; (define-key ctl-x-map "F" 'resume)
;; (define-key ctl-x-map "K" 'wipe)

;;--------------------------------------------------------------------
;;** session
;; ;; session.el can remember more information.
;; (add-hook 'after-init-hook ;; 'session-start)
;;           'session-initialize)
;; (eval-after-load "session"
;;   '(progn
;;     (session-settings)))

(provide 'xy-rcroot-session)

;; This is the last place to load emacs
