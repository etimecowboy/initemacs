c;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-moccur-edit.el'
;; Time-stamp:<2011-12-10 Sat 00:42 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `moccur-edit.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun moccur-edit-settings ()
  "Settings for `moccur'."

  ;; Modified buffers are saved automatically.
  ;; Thanks request!
  ;; (defadvice moccur-edit-change-file
  ;;  (after save-after-moccur-edit-buffer activate)
  ;;  (save-buffer))
  (message "* ---[ moccur-edit configuration is complete ]---"))

(provide 'xy-rc-moccur-edit)
