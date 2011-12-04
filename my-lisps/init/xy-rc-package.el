;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-package.el'
;; Time-stamp:<2011-12-04 Sun 17:37 xin on P6T-WIN7>
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

;; Conflict with auctex's `style/url.el',
;; "symbol's function definition is void: TeX-add-style-hook" error
;; One solution is:
;;    1. Move auctex's `style/url.el' out of load-path
;;    2. Install the package
;;    3. Move it back
;; Another solution:
;;    Change auctex's `style/url.el' to another name.
;;    (Used now, NO bug found yet)

;;;###autoload
(defun package-settings ()
  "settings of `package.el'."
  (setq-default package-user-dir
      (expand-file-name (convert-standard-filename
                 my-local-lisp-path)))

  ;; Original Emacs package.
  (setq package-archives
        (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

  ;; Add the official GNU packages archives
  (add-to-list 'package-archives
                 '("gnu" . "http://elpa.gnu.org/packages/"))

  ;; Add the user-contributed repository
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))

  ;; Add the sunrise repository
  (add-to-list 'package-archives
               '("sunrise"   .
                 "http://joseito.republika.pl/sunrise-commander/"))

  ;; go for it
  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents))

  (message "* ---[ package configuration is complete ]---")
)

(provide 'xy-rc-package)
