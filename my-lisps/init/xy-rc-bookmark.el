;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-bookmark.el'
;; Time-stamp:<2011-12-04 Sun 16:09 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `bookmark.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;; TODO: wirte a funtion to auto update all the lisps from EmacsWiki.
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun bookmark-settings ()
  "Settings of `bookmark.el'."

  ;; (setq bookmark-save-flag 1)
  (setq bookmark-default-file (concat my-var-path "/bookmark-"
                                      user-login-name "@"
                                      system-name "@"
                                      system-configuration))
  (message "* ---[ bookmark configuration is complete ]---")
  )

(provide 'xy-rc-bookmark)
