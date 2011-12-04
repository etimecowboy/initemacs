;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-diary.el'
;; Time-stamp:<2011-12-04 Sun 16:24 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `diary.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun diary-settings ()
  "Settings of `diary'."
  (setq diary-file (concat my-emacs-path "/diary/diary"))
  ;; create an empty diary file (if it does not exist yet)
  (unless (file-exists-p diary-file)
    (shell-command (concat "touch " diary-file)))

  (setq view-diary-entries-initially t)
  (setq mark-diary-entries-in-calendar t)
  (setq number-of-diary-entries 1)

  ;; Use latex to print diary
  (setq cal-tex-diary t)
  (setq cal-tex-holidays nil)

  ;; Copy the diary entries into a special buffer (also display the diary
  ;; when I do `M-x diary')
  (add-hook 'diary-display-hook 'fancy-diary-display)

  ;; TODO: Sort each day's diary entries by their time of day?
  (add-hook 'diary-display-hook 'sort-diary-entries)
  (add-hook 'list-diary-entries-hook 'sort-diary-entries t)

  ;; allow `#includes' in diary-file
  (add-hook 'list-diary-entries-hook 'include-other-diary-files)
  ;; Mark today when display
  (add-hook 'today-visible-calendar-hook 'calendar-mark-today)
  (add-hook 'diary-hook 'appt-make-list)

  (message "* ---[ diary configuration is complete ]---")
  )

(provide 'xy-rc-diary)
