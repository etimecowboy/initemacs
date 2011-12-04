;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-eim.el'
;; Time-stamp:<2011-12-04 Sun 16:36 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `eim.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun eim-settings ()
  "Settings for eim"
  (when (require 'eim-extra nil 'noerror)
    (global-set-key ";" 'eim-insert-ascii))
  (setq eim-use-tooltip nil)
  (message "* ---[ eim configuration is complete ]---")
)

(provide 'xy-rc-eim)
