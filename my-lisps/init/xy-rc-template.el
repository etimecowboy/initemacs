;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-template.el'
;; Time-stamp:<2011-02-06 Sun 01:26 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `template.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun template-settings ()
  "settings for `template'."
  (setq template-default-directories
        (list (concat my-emacs-path "/template/templates")))
  
  (defvar last-template nil "Last used template file")
  (defun my-template-expand-template (template)
    "Expand template file"
    (interactive
     (list
      (read-file-name
       (if last-template
           (format "Please select template file (default is %s): "
                   last-template) "Please select template file: ")
       (concat my-emacs-path "/template/templates") last-template t)))
    (template-expand-template template)
    (setq last-template template)))

(provide 'xy-rc-template.el)
