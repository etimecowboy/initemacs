;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-session.el'
;; Time-stamp:<2011-09-02 Fri 09:48 xin on p6t>
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Save editing information
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Save point places in buffers
(setq save-place 1)
(eval-after-load "saveplace" `(saveplace-settings))

;;-----------------------------------------------------------------------

;; Winpoint,
;; When two windows view the same buffer at the same time, and one
;; window is switched to another buffer and back, point is now the
;; same as in the other window, not as it was before we switched away.
;; This mode tries to work around this problem by storing and
;; restoring per-window positions for each buffer.
(require 'winpoint)
(window-point-remember-mode 1)
(eval-after-load "winpoint" `(winpoint-settings))

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

(setq bookmark-save-flag 1)
(eval-after-load "bookmark" `(bookmark-settings))

;;---------------------------------------------------------------------

;; Bookmark+
;; (require 'bookmark+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Save Emacs session information 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Recent files
;; (recentf-mode 1)
;; (eval-after-load "recentf" `(recentf-settings))

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

;;--------------------------------------------------------------------

;; Use session.el instead of recentf.el
;; session.el can remember more information.
(add-hook 'after-init-hook ;; 'session-start)
		  'session-initialize)
(eval-after-load "session" `(session-settings))

(provide 'xy-rcroot-session)

;; This is the last place to load emacs
