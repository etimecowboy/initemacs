;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-color-moccur.el'
;; Time-stamp:<2011-02-03 Thu 16:42 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `color-moccur.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;###autoload
(defun moccur-my-keys ()
  (local-set-key (kbd "o") 'other-window)
  (local-set-key (kbd "m") 'moccur-disp-cur-line)
  (local-set-key (kbd "h") 'backward-char)
  (local-set-key (kbd "l") 'forward-char)
  (local-set-key (kbd "b") 'backward-word)
  (local-set-key (kbd "w") 'forward-word-or-to-word)
  (local-set-key (kbd "f") 'forward-word)
  (local-set-key (kbd "y") 'copy-region-as-kill-nomark)
  (local-set-key (kbd "c") 'copy-region-as-kill-nomark)
  (local-set-key (kbd ".") 'set-mark-command)
  (local-set-key (kbd "L") 'count-brf-lines))

;;;###autoload
(defun occur-by-moccur-at-point ()
  "对当前光标所在的单词运行`occur-by-moccur'命令"
  (interactive)
  (if (current-word)
      (occur-by-moccur-displn (current-word) nil)))

;;;###autoload
(defun occur-by-moccur-at-point-displn ()
  "运行`occur-by-moccur-at-point'后显示行号"
  (interactive)
  (occur-by-moccur-at-point)
  (let ((buffer (get-buffer "*Moccur*")))
    (if buffer (with-current-buffer buffer (linum-mode 1)))))

;;;###autoload
(defun occur-by-moccur-displn (regexp arg)
  "运行`occur-by-moccur'后显示行号"
  (interactive (list (moccur-regexp-read-from-minibuf) current-prefix-arg))
  (occur-by-moccur regexp arg)
  (let ((buffer (get-buffer "*Moccur*")))
    (if buffer
	(with-current-buffer buffer
	  (linum-mode 1)
	  (moccur-my-keys)))))

;;;###autoload
(defun isearch-moccur-displn ()
  "运行`isearch-moccur'后显示行号"
  (interactive)
  (isearch-moccur)
  (let ((buffer (get-buffer "*Moccur*")))
    (if buffer
	(with-current-buffer buffer
	  (linum-mode 1)
	  (moccur-my-keys)))))

;;;###autoload
(defun moccur-disp-cur-line ()
  "moccur显示当前行"
  (interactive)
  (moccur-next 1)
  (moccur-prev 1))

;;;###autoload
(defun moccur-settings ()
  "Settings for `moccur'."
)

;;;###autoload
(defun moccur-face-settings ()
  "Face settings for `color-moccur'."
  (set-face-foreground 'moccur-current-line-face "red")
  (set-face-background 'moccur-current-line-face "blue")
  (custom-set-faces '(moccur-face
                      ((((type tty)) :bold t :foreground "red")
                       (t :bold nil :foreground "red"))))
  (set-face-background 'moccur-face "white"))

(provide 'xy-rc-color-moccur)
