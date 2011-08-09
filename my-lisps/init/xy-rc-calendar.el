;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-calendar.el'
;; Time-stamp:<2011-08-09 Tue 08:12 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `calendar.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun calendar-settings ()
  "Settings of `calendar.el'."
  
  (setq calendar-chinese-all-holidays-flag t)
  (setq calendar-chinese-celestial-stem 
        ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
  (setq calendar-chinese-terrestrial-branch 
        ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])
  (setq calendar-christian-all-holidays-flag nil)
  (setq calendar-mark-holidays-flag t)
  (setq calendar-week-start-day 1))

(provide 'xy-rc-calendar)
