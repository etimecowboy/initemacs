;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-flyspell.el'
;; Time-stamp:<2011-01-29 Sat 01:37 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `flyspell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun my-flyspell-ignore-uppercase (beg end &rest rest)
  (while (and (< beg end)
	      (let ((c (char-after beg)))
		(not (= c (downcase c)))))
    (setq beg (1+ beg)))
  (= beg end))

;;;###autoload
(defun flyspell-settings ()
  "settings of `flyspell.el'."
  (setq ispell-program-name "aspell")
  (setq ispell-dictionary "british")
  ;;(ispell-change-dictionary "british" t)
  ;;(ispell-change-dictionary "english" t)
  (setq flyspell-delay 1)
  (setq flyspell-issue-welcome-flag nil)
  ;; 令flyspell按照相近程度补齐
  (setq flyspell-sort-corrections nil)
  (add-hook 'flyspell-incorrect-hook 'my-flyspell-ignore-uppercase)
)

(provide 'xy-rc-flyspell)