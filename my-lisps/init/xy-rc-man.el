;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-man.el'
;; Time-stamp:<2011-01-27 Thu 22:02 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `man' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun man-current-word ()
  "Check the word at the point in `man'"
  (interactive)
  (manual-entry (current-word)))

;;;###autoload
(defun man-settings ()
  "settings for `man'."

  (setq Man-notify-method 'newframe)
  (setq woman-use-own-frame t)
  (setq woman-cache-filename (concat my-var-path "/wmncach")))

;;;###autoload
(defun man-face-settings ()
  "Face settings for `man'."
  (setq Man-overstrike-face 'yellow-face)
  (setq Man-underline-face 'underline-green-face)
  (setq Man-reverse-face 'red-face))

;;;###autoload
(defun woman-settings ()
  "Settings for `woman-mode'."
  (setq woman-use-own-frame nil)
  (setq woman-fill-column 100)

  (defun woman-mode-hook-settings ()
    "Settings for `woman-mode'."
    (setq truncate-lines nil))

  (am-add-hooks 'woman-mode-hook 'woman-mode-hook-settings)
  ;; ;; 只增加英文的man路径
  ;; (setq woman-manpath
  ;;       (or (woman-parse-colon-path (getenv "MANPATH"))
  ;;           '("/usr/man" "/usr/share/man" "/usr/local/man")))
    (add-to-list 'woman-manpath "~/.emacs.d/man"))

;;;###autoload
(defun woman-face-settings ()
  "Face settings for `woman'."
  (set-face-foreground 'woman-italic "green")
  (set-face-foreground 'woman-bold "red")
  (custom-set-faces
   '(woman-bold
     ((((class color)) :foreground "red" :bold nil))))
  (set-face-foreground 'woman-addition "yellow")
  (set-face-foreground 'woman-unknown "blue"))

(provide 'xy-rc-man.el)