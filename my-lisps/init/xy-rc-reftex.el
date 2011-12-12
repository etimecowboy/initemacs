;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-reftex.el'
;; Time-stamp:<2011-12-11 Sun 21:18 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `reftex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun reftex-settings ()
  "Settings of `reftex.el'."
  (setq reftex-default-bibliography
        (list "~/emacs/org/source/phd/bib/bio"
              "~/emacs/org/source/phd/bib/lyon"
              "~/emacs/org/source/phd/bib/meddis"
              "~/emacs/org/source/phd/bib/patterson"
              "~/emacs/org/source/phd/bib/manuals"))
  (message "* ---[ reftex configuration is complete ]---")
)

(provide 'xy-rc-reftex)
