;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-url.el'
;; Time-stamp:<2011-12-29 Thu 15:56 xin on p6t>
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
  (message "* ---[ url configuration is complete ]---"))

(provide 'xy-rc-url)
