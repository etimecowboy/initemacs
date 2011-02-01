;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-term.el'
;; Time-stamp:<2011-01-31 Mon 11:36 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `term' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun term-send-kill-whole-line ()
  "Kill whole line in term mode."
  (interactive)
  (term-send-raw-string "\C-a")
  ;; 没有`sleep-for'有时候就不行, 不知道为什么
  (sleep-for 0 1)
  (kill-line)
  (term-send-raw-string "\C-k"))

;;;###autoload
(defun term-send-kill-line ()
  "Kill line in term mode."
  (interactive)
  (call-interactively 'kill-line)
  (term-send-raw-string "\C-k"))

;;;###autoload
(defun term-send-yank ()
  "Yank in term mode."
  (interactive)
  (yank)
  (term-send-raw-string (current-kill 0)))

;;;###autoload
(defun term-send-copy-line ()
  "Copy left line in term mode."
  (interactive)
  (term-send-home)
  (sleep-for 0 1)
  (term-send-copy-line-left))

;;;###autoload
(defun term-send-copy-line-left ()
  "Copy current left line in term mode."
  (interactive)
  (term-send-kill-line)
  (term-send-raw-string "\C-_"))

;;;###autoload
(defun term-send-backward-kill-semi-word ()
  "Backward kill semiword in term mode."
  (interactive)
  (term-send-raw-string "\e\C-h"))

;;;###autoload
(defun term-send-undo ()
  "Undo in term mode."
  (interactive)
  (term-send-raw-string "\C-_"))

;;;###autoload
(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

;;;###autoload
(defun term-send-c-x ()
  "Send `C-x' to term."
  (interactive)
  (term-send-raw-string "\C-x"))

;;;###autoload
(defun term-mode-hook-settings ()
  "Settings for `term-mode-hook'"
  ;; emacs gui版本如果不把scroll-margin设为0
  ;; 当光标最屏幕底部时，有可能使得屏幕发生抖动
  (make-local-variable 'scroll-margin)
  (setq scroll-margin 0)
  (kill-buffer-when-shell-command-exit))

;;;###autoload
(defun switch-term-and-text ()
  "if current in `term-mode', switch to `text-mode', 
   else switch to `term-mode'."
  (interactive)
  (if (equal major-mode 'term-mode)
      (text-mode)
    (enter-term-mode)))

;;;###autoload
(defun enter-term-mode ()
  "Enter in `term-mode'."
  (interactive)
  (term-mode)
  (term-char-mode))

;;;###autoload
(defun enter-text-mode ()
  "Enter in `text-mode'."
  (interactive)
  (text-mode))

;;;###autoload
(defun term-settings ()
  "Settings for `term'."
  
  ;; multi-term: a mode based on term.el, 
  ;; for managing multiple terminal buffers in Emacs.
  (require 'multi-term)
  (add-hook 'term-mode-hook 'term-mode-hook-settings)
  
  (setq term-unbind-key-list '("C-x" "<ESC>" "<up>" "<down>" "C-j"))
  (setq term-bind-key-alist
      `(("C-c"   . term-send-raw)
        ("C-p"   . term-send-raw)
        ("C-n"   . term-send-raw)
        ("C-s"   . isearch-forward)
        ("C-r"   . term-send-raw)
        ("C-m"   . term-send-raw)
        ("C-k"   . term-send-kill-whole-line)
        ("C-y"   . term-send-raw)
        (,(if window-system "C-/" "C-_") . term-send-undo)
        ("C-M-h" . term-send-backward-kill-semi-word)
        ("M-H"   . enter-text-mode)
        ("M-J"   . switch-term-and-text)
        ("M-f"   . term-send-raw-meta)
        ("M-b"   . term-send-raw-meta)
        ("M-d"   . term-send-raw-meta)
        ("M-K"   . term-send-kill-line)
        ("M-p"   . previous-line)
        ("M-n"   . next-line)
        ("M-u"   . term-send-raw-meta)
        ("M-w"   . term-send-copy-line)
        ("M-W"   . term-send-copy-line-left)
        ("M-y"   . term-send-raw-meta)
        ("M-."   . term-send-raw-meta)
        ("M-/"   . term-send-raw-meta)
        ("M-0"   . term-send-raw-meta)
        ("M-1"   . term-send-raw-meta)
        ("M-2"   . term-send-raw-meta)
        ("M-3"   . term-send-raw-meta)
        ("M-4"   . term-send-raw-meta)
        ("M-5"   . term-send-raw-meta)
        ("M-6"   . term-send-raw-meta)
        ("M-7"   . term-send-raw-meta)
        ("M-8"   . term-send-raw-meta)
        ("M-9"   . term-send-raw-meta))))

(provide 'xy-rc-term)
