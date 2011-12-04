;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-url.el'
;; Time-stamp:<2011-12-04 Sun 18:06 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `url.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun url-settings ()
  "Settings of `url.el'."
  (setq url-configuration-directory
        (concat my-var-path "/url"))
  (setq url-privacy-level (quote high))
  (message "* ---[ url configuration is complete ]---")
)


(provide 'xy-rc-url)
