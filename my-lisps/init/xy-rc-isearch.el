;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-isearch.el'
;; Time-stamp:<2011-01-29 Sat 13:01 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `isearch.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; 在C-s进入incremental search的时候,按M-i,替换当前查找内容
;;;###autoload
(defun isearch-query-replace-current ()
  "Replace current searching string."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search)
	(from-string isearch-string))
    (if (string= from-string "")
	(isearch-update)
      (if (not isearch-success)
	  (progn
	    (message "Search string not found")
	    (sleep-for 0.5)
	    (isearch-update))
	(progn
	  (isearch-done)
	  (goto-char (min (point) isearch-other-end)))
	(perform-replace
	 from-string
	 (read-from-minibuffer
	  (format "Query replace %s with: " from-string)
	  "" nil nil query-replace-to-history-variable from-string t)
	 t                                ; query flag
	 isearch-regexp
	 nil)))))

;;;###autoload
(defun toggle-case-fold-search-when-search ()
    "在搜索的时候执行`toggle-case-fold-search'."
    (interactive)
    (toggle-case-fold-search)
    (let ((str isearch-string))
      (goto-char isearch-opoint)
      (isearch-done)
      (let ((isearch-command
             (if isearch-forward
                 (if isearch-regexp 'isearch-forward-regexp 'isearch-forward)
               (if isearch-regexp 'isearch-backward-regexp 'isearch-backward))))
        (call-interactively isearch-command))
      (isearch-yank-string str)))

;;;###autoload
(defun isearch-cur-word (fun)
    "ISearch current word use function FUN."
    (let ((cur-word (current-word)))
      (if (not cur-word)
          (message "No word under cursor.")
        (call-interactively fun)
        (isearch-yank-string cur-word))))

;;;###autoload
(defun isearch-forward-cur-word (&optional backward)
    "`isearch-forward' current word."
    (interactive "P")
    (let ((fun (if backward 'isearch-backward 'isearch-forward)))
      (isearch-cur-word fun)))

;;;###autoload
(defun isearch-clean ()
    "Clean string in `iserch-mode'."
    (interactive)
    (goto-char isearch-opoint)
    (let ((isearch-command
           (if isearch-forward
               (if isearch-regexp 'isearch-forward-regexp 'isearch-forward)
             (if isearch-regexp 'isearch-backward-regexp 'isearch-backward))))
      (call-interactively isearch-command)))


;;;###autoload
(defun isearch-settings ()
  "settings for `isearch'."
 
  ;; 搜索时不区分大小写
  (setq-default case-fold-search t))

;;;###autoload
(defun isearch-face-settings ()
  "Face settings for `isearch'."
  (set-face-foreground 'isearch "red")
  (set-face-background 'isearch "blue")
  (when (not is-before-emacs-21)
    (set-face-foreground 'lazy-highlight "black")
    (set-face-background 'lazy-highlight "white"))
  (custom-set-faces '(isearch-fail ((((class color)) (:background "red"))))))

(provide 'xy-rc-isearch)