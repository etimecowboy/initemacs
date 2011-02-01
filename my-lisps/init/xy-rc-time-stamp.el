;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-time-stamp.el'
;; Time-stamp:<2011-01-29 Sat 08:32 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `time-stamp.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun time-stamp-settings ()
   "settings of `time-stamp.el'."
   ;; Start of a time stamp
   (setq time-stamp-start "Time-stamp:")
   ;; End of a time stamp
   (setq time-stamp-end "\n")
   ;; format of the string inserted by `M-x time-stamp'
   (setq time-stamp-format "<%Y-%02m-%02d %3a %02H:%02M %u on %s>"))
;;`YYYY-MM-DD Weekday HH:MM user on system'
;; See `system-time-locale' for non-numeric formatted items of time

(provide 'xy-rc-time-stamp)