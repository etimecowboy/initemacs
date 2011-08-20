;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-appt.el'
;; Time-stamp:<2011-08-20 Sat 07:25 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `appt.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun appt-settings ()
  "Settings of `appt'."

  (setq appt-time-msg-list nil)
  
  (setq appt-audible t)

  ;; use echo notification when in terminal
  (setq appt-display-format 'echo)

  ;; warn 15 min in advance
  (setq appt-message-warning-time 15)  ; 12

  ;; number of minutes to wait between checking the appointment list
  (setq appt-display-interval 5)  ; 3

  ;; show in the modeline
  (setq appt-display-mode-line t)

  ;; (setq appt-disp-window-function (function rgr/org-display))
  
  (when window-system
  	(setq appt-display-format 'window)
	(setq appt-disp-window-function (function todochiku-appt-disp-window)))

	;; (setq appt-disp-window-function (function rgr/org-display))
	;; ;; FIXME Check `notify-send' (in `libnotify-bin' Ubuntu package) is installed
	;; (defun rgr/org-display (min-to-app new-time msg)
	;;   (shell-command
	;;    (concat "notify-send "
	;; 		   "-i /usr/share/icons/gnome/32x32/status/appointment-soon.png "
	;; 		   "'Appointment' "
	;; 		   "'" msg "'")))
	;; ;; TODO For Windows users: use `todochicku.el' and the snarl
	;; notifier

  ;; turn appointment checking on
  (appt-activate 1)
 )

(provide 'xy-rc-appt)
