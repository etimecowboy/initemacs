;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-package.el'
;; Time-stamp:<2011-12-08 Thu 22:52 xin on p6t>
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
  (setq package-archives ;; Original ELPA package.
        (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
  (add-to-list 'package-archives ;; Add the official packages
                 '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives  ;; Add third-party packages
               '("marmalade" .
                 "http://marmalade-repo.org/packages/")
               '("sunrise"   .
                 "http://joseito.republika.pl/sunrise-commander/"))
  (package-initialize)  ;; Activate all packages
  (when (not package-archive-contents)
    (package-refresh-contents))
  (message "* ---[ package configuration is complete ]---"))

(provide 'xy-rc-package)
