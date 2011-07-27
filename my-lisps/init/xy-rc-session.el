;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-session.el'
;; Time-stamp:<2011-07-26 Tue 17:37 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `session.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun session-start ()
  "Start session."

  (interactive)
  (require 'session)
  ;; (setq session-save-file (concat my-var-path "/session-"
  ;; 								  user-login-name "@"
  ;; 								  system-name "@"
  ;; 								  system-configuration))
  (session-initialize)  
)

;;;###autoload
(defun session-settings ()
  "Settings for `session'."

  ;; BUG: this setq seems to cause problem when recovering last point
  ;;      position.
  ;; (setq session-initialize '(session menus))
  (setq session-save-file (concat my-var-path "/session-"
								  user-login-name "@"
								  system-name "@"
								  system-configuration))
  
  ;; OrgMode org-mark-ring is a circular object.
  ;; Don't recursively display gtd files in session list
  (add-to-list 'session-globals-exclude 'org-mark-ring)
  ;; Don't display org agenda files
  (add-to-list 'session-globals-exclude 'org-agenda-files)
  
  (setq session-globals-max-size 100)
  (setq session-globals-max-string 40960)
  (setq session-registers-max-string 2048))

(provide 'xy-rc-session.el)
