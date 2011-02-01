;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-eshell.el'
;; Time-stamp:<2011-01-31 Mon 11:51 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `eshell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))
;;;###autoload
(defun eshell-settings ()
  "Settings for `term'."

  (add-hook 'eshell-preoutput-filter-functions
            'ansi-color-filter-apply)
  (add-to-list 'eshell-output-filter-functions 
               'eshell-handle-ansi-color)
  (setq eshell-directory-name (concat my-emacs-path "/eshell"))
  ;; (wrong) (setq eshell-ls-use-in-dired t nil (em-ls))
)

(provide 'xy-rc-eshell)
