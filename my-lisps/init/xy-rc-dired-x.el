;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dired-x.el'
;; Time-stamp:<2011-12-06 Tue 22:22 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired-x.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun dired-x-settings ()
  "Settings of `dired-x.el'."
  ;;------------------------------------------------------------------
  ;; ahei's settings
  ;; (unless is-before-emacs-21
  ;;   (setq dired-omit-files
  ;;        (concat dired-omit-files
  ;;                "\\|^\\.\\|^semantic.cache$\\|^CVS$"))
  ;;   (if mswin
  ;;       (setq dired-omit-files (concat dired-omit-files "\\|^_"))))
  ;; (setq dired-omit-size-limit 1000000)

  ;;------------------------------------------------------------------
  ;; Omitting Git-ignored files in Emacs dired
  ;; REF: - (@url :file-name "http://newartisans.com/2008/08/omitting-git-ignored-files-in-emacs-dired/" :display "Post")
  ;;      - (@url :file-name "https://github.com/jwiegley/git-scripts/blob/master/git-dired.el" :display "Source")
  ;; (defvar dired-omit-regexp-orig (symbol-function 'dired-omit-regexp))

  ;; (defun dired-omit-regexp ()
  ;;   (let ((file (expand-file-name ".git"))
  ;;         parent-dir)
  ;;     (while (and (not (file-exists-p file))
  ;;                 (progn
  ;;                   (setq parent-dir
  ;;                         (file-name-directory
  ;;                          (directory-file-name
  ;;                           (file-name-directory file))))
  ;;                   ;; Give up if we are already at the root dir.
  ;;                   (not (string= (file-name-directory file)
  ;;                                 parent-dir))))
  ;;       ;; Move up to the parent dir and try again.
  ;;       (setq file (expand-file-name ".git" parent-dir)))
  ;;     ;; If we found a change log in a parent, use that.
  ;;     (if (file-exists-p file)
  ;;         (let ((regexp (funcall dired-omit-regexp-orig))
  ;;               (omitted-files (shell-command-to-string
  ;;                               "git clean -d -x -n")))
  ;;           (if (= 0 (length omitted-files))
  ;;               regexp
  ;;             (concat
  ;;              regexp
  ;;              (if (> (length regexp) 0)
  ;;                  "\\|" "")
  ;;              "\\("
  ;;              (mapconcat
  ;;               #'(lambda (str)
  ;;                   (concat "^"
  ;;                           (regexp-quote
  ;;                            (substring str 13
  ;;                                       (if (= ?/ (aref str (1- (length str))))
  ;;                                           (1- (length str))
  ;;                                         nil)))
  ;;                           "$"))
  ;;               (split-string omitted-files "\n" t)
  ;;               "\\|")
  ;;              "\\)")))
  ;;       (funcall dired-omit-regexp-orig))))
  ;;------------------------------------------------------------------

  (message "* ---[ dired-x configuration is complete ]---")
)

(provide 'xy-rc-dired-x)
