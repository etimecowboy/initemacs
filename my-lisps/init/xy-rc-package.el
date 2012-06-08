;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-package.el'
;; Time-stamp:<2012-06-08 Fri 19:35 xin on p5q>
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
          ("melpa" . "http://melpa.milkbox.net/packages/")
          ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

  ;; NOTE: there is an enhancement lisp `melpa.el' for the
  ;; `package.el' shipped by Emacs24. Provided by melpa.
  ;; REF: (@url :file-name "http://melpa.milkbox.net/" :display "Site")
  ;; (require 'melpa)

  (package-initialize)  ;; Activate all packages
  (when (not package-archive-contents)
    (package-refresh-contents))
  (message "* ---[ package configuration is complete ]---"))

(provide 'xy-rc-package)
