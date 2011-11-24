;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ido.el'
;; Time-stamp:<2011-11-23 Wed 23:01 xin on p6t>
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
  
  ;; (If is-before-emacs-21
  ;;     (setq read-buffer-function 'ido-read-buffer)
  ;;   (ido-everywhere t)
  ;;   (setq ido-define-mode-map-hook 'ido-setup-hook))

  (setq-default ido-everywhere t)
  ;; (ido-mode 'both)
  (setq-default ido-save-directory-list-file
				(concat my-var-path "/ido-last-"
  						user-login-name "@"
  						system-name "@"
  						system-configuration))
  (setq ido-enable-last-directory-history t) ; remember last used dirs
  (setq ido-max-work-directory-list 50)      ; should be enough
  (setq ido-max-work-file-list      50)      ; remember many
  (setq ido-max-directory-size 1000000)
  ;; (setq ido-ignore-buffers ;; ignore these guys
  ;; 		'("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido"
  ;; 		  "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*" "^\*"))
  (setq ido-case-fold  t)              ; be case-insensitive
  (setq ido-use-filename-at-point 'guess)
  (setq ido-use-url-at-point t)
  (setq ido-enable-flex-matching t)
  (setq ido-max-prospects 8)
  (setq ido-confirm-unique-completion t) ; wait for RET, even with;
										; unique completion
  (setq ido-create-new-buffer 'always)
  ;; when using ido, the confirmation is rather annoying...
  ;; (setq confirm-nonexistent-file-or-buffer nil)

  ;; (require 'ido-ubiquitous)
  ;; (ido-ubiquitous-mode 1)
  )

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


;; (let ((map
;;        (unless is-before-emacs-21
;;          (setq ido-mode-map ido-completion-map)))))
;; (eal-define-keys-commonly
;;  map 
;;  `(("M-."   ido-next-match-dir)
;;    ("M-,"   ido-prev-match-dir)
;;    ("C-h"   ido-delete-backward-updir)
;;    ("M-h"   ido-up-directory)
;;    ("M-H"   ido-up-directory-clean-text)
;;    ("C-M-h" ido-goto-home)
;;    ("C-r"   ido-goto-root)
;;    ("C-u"   ido-clean-text)
;;    ("M-b"   backward-word)
;;    ("C-w"   ido-delete-backward-word-updir)
;;    ;; ("C-v"   ido-enter-svn-status-hide)
;;    ("C-n"   ido-next-match)
;;    ("C-p"   ido-prev-match)))
