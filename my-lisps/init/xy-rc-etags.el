;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-etags.el'
;; Time-stamp:<2011-12-11 Sun 09:04 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `etags.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun etags-settings ()
  "Settings of `etags.el'."
  (defadvice find-tag (before tags-file-name-advice activate)
    "Find TAGS file in ./ or ../ or ../../ dirs"
    (let ((list (mapcar 'expand-file-name '("./TAGS" "../TAGS" "../../TAGS"))))
      (while list
        (if (file-exists-p (car list))
            (progn
              (setq tags-file-name (car list))
              (setq list nil))
          (setq list (cdr list))))))
  (message "* ---[ etags configuration is complete ]---"))

(provide 'xy-rc-etags)
