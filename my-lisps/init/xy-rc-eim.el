;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-eim.el'
;; Time-stamp:<2011-12-15 Thu 15:38 xin on p6t>
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
  (setq eim-use-tooltip nil) ;; 显示效果不好，老是闪烁
  ;; (register-input-method
  ;;  "eim-wb" "utf-8" 'eim-use-package "eim-wb" "eim-wb" "wb.txt")
  (register-input-method
   "eim-py" "utf-8"
   'eim-use-package "eim-py" "eim-py" (concat my-emacs-path "/eim/py.txt"))
  (setq default-input-method "eim-py")
  ;; (setq input-activate nil)
  ;; (add-hook 'find-file-hook
  ;;           (lambda ()(if (eq input-activate t)
  ;;                       (toggle-input-method))))
  (message "* ---[ eim configuration is complete ]---"))

(provide 'xy-rc-eim)
