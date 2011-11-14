;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-org2blog.el'
;; Time-stamp:<2011-11-14 Mon 15:06 xin on P6T-WIN7>
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

  ;; (setq org2blog-server-url "http://etimecowboy.wordpress.com/xmlrpc.php"
  ;; 		org2blog-server-user "etimecowboy"
  ;; 		org2blog-server-weblog-id ""
  ;; 		org2blog-use-tags-as-categories t)
  
  (setq org2blog/wp-blog-alist
		'(("wp"
		   :url "http://etimecowboy.wordpress.com/xmlrpc.php"
		   :username "etimecowboy"
		   :default-title ""
		   :default-categories ("Uncategorized")
		   :tags-as-categories nil
		   )
		  ))

  ;; (org2blog-login)
)

(provide 'xy-rc-org2blog)
