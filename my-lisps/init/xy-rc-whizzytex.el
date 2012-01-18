;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-whizzytex.el'
;; Time-stamp:<2012-01-17 Tue 23:58 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `whizzytex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun whizzytex-copy-sty ()
  "Copy the file `whizzytex.sty' file to the current directory."
  (interactive)
  (copy-file "~/.emacs.d/lisps/whizzytex/whizzytex.sty" "./" t)
  (message "whizzytex.sty copied."))

;;;###autoload
(defun xy/whizzytex-start ()
  "Start whizzytex."
  (interactive)
  (GNULinux
   (require 'whizzytex)
   (whizzytex-mode 1)
   (menu-bar-mode 1)
   (message "Writing your tex files in WYSIWYG environment!"))
  (Windows
   (message "Sorry, whizzytex cannot be used in Windows!")))

;;;###autoload
(defun whizzytex-settings ()
  "Settings of `whizzytex.el'."
  (message "* ---[ whizzytex configuration is complete ]---"))

(provide 'xy-rc-whizzytex)
