;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-package.el'
;; Time-stamp:<2011-02-22 Tue 11:54 xin on P6T>
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
  (setq-default package-archives 
    '(("ELPA" . "http://tromey.com/elpa/") 
      ("gnu"  . "http://elpa.gnu.org/packages/")
      ("SC"   . "http://joseito.republika.pl/sunrise-commander/")))
)

(provide 'xy-rc-package)
