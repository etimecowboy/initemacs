;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ido.el'
;; Time-stamp:<2011-01-30 Sun 16:42 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ido.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defmacro def-ido-enter-command (command)
  "Make definition of command which execute some command in ido."
  `(defun ,(am-intern "ido-enter-" command) ()
     ,(concat "Drop into `" command "' from file switching.")
     (interactive)
     (setq ido-exit (quote ,(intern command)))
     (exit-minibuffer)))

;;;###autoload
(defun ido-up-directory-clean-text ()
  "Run C-u `ido-up-directory'."
  (interactive)
  (ido-up-directory t))

;;;###autoload
(defun ido-clean-text ()
  "Clean `ido-text'."
  (interactive)
  (if (= (minibuffer-prompt-end) (point))
      (ido-up-directory t)
    (delete-region (minibuffer-prompt-end) (point-max))))

;;;###autoload
(defun ido-goto-home ()
  (interactive)
  "Go to home directory when use `ido-find-file'"
  (ido-set-current-home)
  (setq ido-exit 'refresh)
  (exit-minibuffer))

;;;###autoload
(defun ido-goto-root ()
  (interactive)
  "Go to root directory when use `ido-find-file'"
  (ido-set-current-directory "/")
  (setq ido-exit 'refresh)
  (exit-minibuffer))

;;;###autoload
(defun ido-settings ()
  "settings for `ido'."
  (If is-before-emacs-21
      (setq read-buffer-function 'ido-read-buffer)
    (ido-everywhere t)
    (setq ido-define-mode-map-hook 'ido-setup-hook))
  (setq ido-max-directory-size 1000000))

;;;###autoload
(defun ido-face-settings ()
  "Face settings for `ido'."
  (if is-before-emacs-21
      (progn
        (custom-set-faces 
         '(ido-first-match-face
           ((((type tty pc)) :foreground "yellow")
            (t :bold nil :foreground "yellow"))))
        (custom-set-faces 
         '(ido-only-match
           ((((class color)) (:bold nil :foreground "green"))))))
    
    (custom-set-faces 
     '(ido-first-match
       ((((type tty pc)) :foreground "yellow")
        (t :bold nil :foreground "yellow"))))
    (custom-set-faces 
     '(ido-only-match
       ((((class color)) (:bold nil :foreground "green")))))))

(provide 'xy-rc-ido)
