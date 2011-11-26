;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sh.el'
;; Time-stamp:<2011-11-26 Sat 03:02 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sh.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun sh-mode-settings ()
  "settings for `sh-mode'."
  (font-lock-add-keywords
   'sh-mode
   '(("\\<\\(local\\|let\\)\\>" . font-lock-keyword-face)))
  ;; (xy/set-font-default)
  )

;;;###autoload
  (defun sh-mode-face-settings ()
    "Face settings for `sh-mode'."
    (custom-set-faces
     '(sh-heredoc
       ((((min-colors 88) (class color)
          (background dark))
         (:foreground "deeppink"))
        (((class color)
          (background dark))
         (:foreground "deeppink"))
        (((class color)
          (background light))
         (:foreground "tan1" ))
        (t
         (:weight bold))))))

(provide 'xy-rc-sh)
