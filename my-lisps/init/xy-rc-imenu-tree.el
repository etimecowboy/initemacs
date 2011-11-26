;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-imenu-tree.el'
;; Time-stamp:<2011-11-26 Sat 02:59 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `imenu-tree.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun imenu-tree-settings ()
  "Settings for `imenu-tree'."
  (defun imenu-tree-expand (tree)
    (or (widget-get tree :args)
        (let ((buf (widget-get tree :buffer))
              index)
          (setq index
                (with-current-buffer buf
                  (setq imenu--index-alist nil)
                  (let ((imenu-create-index-function 'imenu-default-create-index-function))
                    (imenu--make-index-alist t))
                  (delq nil imenu--index-alist)))
          (mapcar
           (lambda (item)
             (imenu-tree-item item buf "function"))
           index)))))

(provide 'xy-rc-imenu-tree)
