;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-rw-hunspell.el'
;; Time-stamp:<2011-12-13 Tue 00:35 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `rw-hunspell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun rw-hunspell-settings ()
  "Settings of `rw-hunspell.el'."
  (GNULinux
   (setq rw-hunspell-dicpath-list
         (quote
          ("/usr/share/hunspell"))))
  (Windows
   (setq rw-hunspell-dicpath-list
         (quote
          ("~/.emacs.d/bin/win32/hunspell"))))
  (setq rw-hunspell-default-dictionary "en_GB_hunspell")
  (setq rw-hunspell-make-dictionary-menu t)
  (setq rw-hunspell-use-rw-ispell t)
  (message "* ---[ rw-hunspell configuration is complete ]---"))

;;;###autoload
(defun rw-ispell-settings ()
  "Settings of `rw-ispell.el'."
  (setq rw-ispell-language-pdict-alist
    (quote (("emacs" . "~/emacs/ispell/personal.dict"))))
  (setq rw-ispell-create-pdict-files t)
  (message "* ---[ rw-ispell configuration is complete ]---"))

(provide 'xy-rc-rw-hunspell)