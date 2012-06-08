;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-url.el'
;; Time-stamp:<2012-06-08 Fri 18:22 xin on p5q>
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
  (setq-default url-configuration-directory
                (concat my-var-path "/url"))
  (setq url-privacy-level (quote high))
  ;; (setq url-proxy-services '(("no_proxy" . "work\\.com")
  ;;                            ("http" . "proxy.work.com:911")))
  ;; NOTE: Suggested in http://melpa.milkbox.net/#known-issues for
  ;;       melpa ELPA repo.
  (setq url-http-attempt-keepalives nil)
  (message "* ---[ url configuration is complete ]---"))

(provide 'xy-rc-url)
