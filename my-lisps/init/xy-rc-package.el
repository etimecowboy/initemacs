;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-package.el'
;; Time-stamp:<2012-01-07 Sat 18:11 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My ELPA `package.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun package-settings ()
  "settings of `package.el'."
  (setq-default package-enable-at-startup nil) ;; NOTE: t will be slow
  (setq-default package-user-dir my-elpa-lisp-path)
  (setq package-archives
        '(("tromey" . "http://tromey.com/elpa/") ;; Original ELPA package.
          ("gnu" . "http://elpa.gnu.org/packages/") ;; Add the official packages
          ("marmalade" . "http://marmalade-repo.org/packages/")
          ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))
  (package-initialize)  ;; Activate all packages
  (when (not package-archive-contents)
    (package-refresh-contents))
  (message "* ---[ package configuration is complete ]---"))

(provide 'xy-rc-package)
