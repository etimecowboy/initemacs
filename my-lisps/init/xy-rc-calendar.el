;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-calendar.el'
;; Time-stamp:<2011-08-19 Fri 21:31 xin on P6T-WIN7>
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

  ;; years must be written in full
  (setq abbreviated-calendar-year nil)
  (setq diary-abbreviated-year-flag nil)

  ;; ;; interpret the date 1/2/1990 as February 1, 1990
  ;; (setq european-calendar-style t)  ; obsolete!

  ;; set the style of calendar and diary dates to ISO
  (setq calendar-date-style 'iso)

  ;; week in the calendar begins on Monday
  (setq calendar-week-start-day 1)

  ;; marks the current date, by changing its face
  (add-hook 'today-visible-calendar-hook 'calendar-mark-today)
  
  (setq calendar-chinese-all-holidays-flag t)
  (setq calendar-chinese-celestial-stem 
        ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
  (setq calendar-chinese-terrestrial-branch 
        ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])
  (setq calendar-christian-all-holidays-flag nil)
  
  (setq calendar-mark-holidays-flag t)
  ;; remove some holidays
  (setq holiday-bahai-holidays nil)       ; get rid of Baha'i holidays
  (setq holiday-general-holidays nil)     ; get rid of too U.S.-centric holidays
  (setq holiday-hebrew-holidays nil)      ; get rid of religious holidays
  (setq holiday-islamic-holidays nil)     ; get rid of religious holidays
  ;; (setq holiday-oriental-holidays nil)    ; get rid of Oriental holidays
  (setq holiday-solar-holidays nil)
  ;; (setq holiday-christian-holidays nil)
  (setq holiday-other-holidays nil)       ; user defined holidays

  ;; add some holidays
  (setq holiday-local-holidays
		'(
		  (holiday-fixed 01 01 "New Year's Day")
		  (holiday-fixed 02 14 "Valentine's Day")
		  (holiday-fixed 05 01 "Labor Day")
		  (holiday-fixed 06 01 "Children's Day")
		  (holiday-fixed 10 01 "PRC Anniversary")
		  ;; (holiday-fixed 11 01 "Toussaint")
		  ;; (holiday-fixed 11 11 "Armistice 1918")

		  ;; holidays with variable dates
		  (holiday-float 5 0 2 "Mother's Day")
		  (holiday-float 6 0 3 "Father's Day")))

  ;; mark all visible dates that have diary entries
  (setq mark-diary-entries-in-calendar t)
  ;; (add-hook 'initial-calendar-window-hook 'mark-diary-entries)

  ;; fix foolish calendar-mode scrolling
  (add-hook 'calendar-load-hook
			(lambda ()
			  ;; (setq mark-holidays-in-calendar t)
			  (define-key calendar-mode-map [(>)] 'scroll-calendar-left)
			  (define-key calendar-mode-map [(<)] 'scroll-calendar-right)
			  (define-key calendar-mode-map [(control x) (>)]
				'scroll-calendar-left)
			  (define-key calendar-mode-map [(control x) (<)]
				'scroll-calendar-right)))

  ;; Sunrise/Sunset
  ;; (setq calendar-latitude [50 87 north])
  ;; (setq calendar-longitude [4 71 east])
  ;; (setq calendar-location-name "Leuven, BE")
  )

(provide 'xy-rc-calendar)
