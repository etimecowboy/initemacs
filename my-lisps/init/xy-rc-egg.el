;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-egg.el'
;; Time-stamp:<2011-02-03 Thu 11:52 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `egg.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun egg-settings ()
  "Settings for `egg'."

  (setq egg-enable-tooltip t)
  (setq egg-refresh-index-in-backround t)
  (setq egg-show-key-help-in-buffers 
        '((:status :log :file-log :reflog :diff :commit))))
  
(provide 'xy-rc-egg.el)
