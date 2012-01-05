;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-org2blog.el'
;; Time-stamp:<2012-01-05 Thu 05:28 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `org2blog.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun org2blog-settings ()
  "Settings of `org2blog.el'."
  (setq org2blog/wp-blog-alist
        '(("wordpress.com"
           :url "http://etimecowboy.wordpress.com/xmlrpc.php"
           :username "etimecowboy"
           :default-title "New Post"
           :default-categories ("Uncategorized")
           :tags-as-categories nil
           )))

  (setq org2blog/wp-buffer-template "# -*- mode: org -*-
# Time-stamp:<>
#
#+OPTIONS: toc:nil num:nil todo:nil pri:nil tags:nil ^:nil
#+OPTIONS: TeX:nil LaTeX:nil
#+STARTUP: content showstars oddeven align indent
#+STARTUP: lognotestate hideblocks
#+DATE:    %s
#+CATEGORY: %s
#+TAGS:
#+PERMALINK:
#+PARENT:
#
#+TITLE:  %s
#+AUTHOR: Xin Yang
#+EMAIL:  xin2.yang@gmail.com
#+DESCRIPTION:
")
  (message "* ---[ org2blog configuration is complete ]---"))

(provide 'xy-rc-org2blog)
