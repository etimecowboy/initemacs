;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auto-insert.el'
;; Time-stamp:<2011-08-09 Tue 08:11 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `auto-insert.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun auto-insert-settings ()
;;   "Settings for `auto-insert'."
;;   (setq auto-insert-query nil)
;;   (setq auto-insert-directory ;; my-emacs-templates-path)
;;         (list (concat my-emacs-path "/template/templates"))) 
;;           ;; (concat (my-emacs-path "/template/templates")))
;;   (define-auto-insert "build.properties" "build.properties.tpl")

;;   (defun expand-template (template)
;;     "Expand template."
;;     (template-expand-template ;; (concat my-emacs-templates-path template)))
;;             (concat (my-emacs-path "template/templates/temp"))))
;;   ;; (define-auto-insert
;;   ;;   '("\\.\\([Hh]\\|hh\\|hxx\\|hpp\\)$" . "C/C++ header")
;;   ;;   (lambda ()
;;   ;;     (expand-template "h.tpl")))
;;   ;; (define-auto-insert
;;   ;;   '("\\.c$" . "C")
;;   ;;   (lambda ()
;;   ;;     (expand-template "c.tpl")))
;;   ;; (define-auto-insert
;;   ;;   '("\\.cpp$" . "Cpp")
;;   ;;   (lambda ()
;;   ;;     (expand-template "cpp.tpl")))

;;   (defun insert-headx-snippet ()
;;     "Insert headx snippet."
;;     (insert-snippet "headx"))

;;   (defun insert-abbrev (abbrev-name)
;;     "Insert abbrev ABBREV-NAME"
;;     (interactive "s")
;;     (insert abbrev-name)
;;     (expand-abbrev))

;;   (defun insert-snippet (snippet)
;;     "Insert snippet SNIPPET."
;;     (interactive "s")
;;     (insert snippet)
;;     (yas/expand))

;;   (mapc
;;    (lambda (suffix)
;;      (define-auto-insert (concat "\\." suffix "$") 'insert-headx-snippet))
;;    '("el" "sh" "org" "pl" "py" "htm\\(l\\)?")))

(provide 'xy-rc-auto-insert)
