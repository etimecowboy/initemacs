;;; xy-edit-tools.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Created: 28 Jan 2011
;; Time-stamp:<2011-11-27 Sun 03:26 xin on P6T-WIN7>
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Collected various functions to assist edting.

;;; Code:

(require 'cl)

;;====================================================================
;;* 收集的一些有用的辅助编辑函数
;;====================================================================

;;** 交换两个 Window 里的内容
;; NOTE: 换用`buffer-move'
;; ;;;###autoload
;; (defun his-transpose-windows (arg)
;;   "Transpose the buffers shown in two windows."
;;   (interactive "p")
;;   (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
;;     (while (/= arg 0)
;;       (let ((this-win (window-buffer))
;;             (next-win (window-buffer (funcall selector))))
;;         (set-window-buffer (selected-window) next-win)
;;         (set-window-buffer (funcall selector) this-win)
;;         (select-window (funcall selector)))
;;       (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

;;---------------------------------------------------------------------

;;** 切换 major mode，可以记住上次的选择
;;;###autoload
(defun major-mode-heuristic (symbol)
  (and (fboundp symbol)
       (string-match ".*-mode$" (symbol-name symbol))))
;;;###autoload
(defun switch-major-mode (mode)
  "切换 major mode，可以记住上次的选择."
  (defvar switch-major-mode-last-mode nil)
  (make-variable-buffer-local 'switch-major-mode-last-mode)
  (interactive
   (let ((fn switch-major-mode-last-mode) val)
     (setq val
           (completing-read
            (if fn
                (format "Switch major mode to (default %s): " fn)
              "Switch major mode to: ")
            obarray 'major-mode-heuristic t nil nil (symbol-name fn)))
     (list (intern val))))
  (let ((last-mode major-mode))
    (funcall mode)
    (setq switch-major-mode-last-mode last-mode)))

;;---------------------------------------------------------------------

;;** 切换 major mode，可以记住上次的选择
;;;###autoload
(defun get-mode-name ()
  "显示`major-mode'及`mode-name'"
  (interactive)
  (message "major-mode is %s, mode-name is %s" major-mode mode-name))

;;----------------------------------------------------------------------

;;** 查找各种信息
;; REF: http://xahlee.org/emacs/emacs_lookup_ref.html
;; use emacs as a dictionary application, that allows you to lookup
;; the definitions of a word under cursor, or any general reference
;; such as Wikipedia, Google, or lookup documentation of computer
;; language's keywords.

;; press F6 will launch your browser and lookup definition
;; of the word under cursor.

;; You can change the url to a different online dictionary reference
;; website.

;; Here are some other online dictionary sites and their url
;; search syntax, using sample word “curlicue”.
;; AHD means American Heritage Dictionary.
;; http://education.yahoo.com/reference/dictionary/entry/curlicue
;; (AHD, American Heritage Dictionary)
;; http://www.answers.com/main/ntquery?s=curlicue (AHD)
;; http://en.wiktionary.org/wiki/curlicue (wiktionary)
;; http://m-w.com/dictionary/curlicue (Merriam Webster)
;; http://www.askoxford.com/concise_oed/curlicue
;; (Compact Oxford Eng Dict)
;; http://www.yourdictionary.com/curlicue
;; http://dictionary.reference.com/browse/curlicue
;; (AHD, Random House, WordNet, ...)
;; http://www.dict.org/bin/Dict?Form=Dict2&Database=*&Query=curlicue
;; (OpenSource Dicts)
;;;###autoload
(defun lookup-word-definition ()
  "Look up the current word's definition in a browser.
If a region is active (a phrase), lookup that phrase."
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat
                 "http://www.askoxford.com/concise_oed/" myword))
    (browse-url myurl)
    ;; (w3m-browse-url myurl) ;; if you want to browse using w3m
    ))

;; The following is a example of looking up Wikipedia.
;; Here are some example urls for some reference lookup sites.
;; Perl       http://perldoc.perl.org/search.html?q=‹SearchWord›
;; PHP        http://us.php.net/‹SearchWord›
;; LSL        http://wiki.secondlife.com/wiki/‹SearchWord›
;; AHK        http://www.autohotkey.com/docs/commands/‹SearchWord›.htm
;; Wikipedia  http://en.wikipedia.org/wiki/‹SearchWord›
;; Google     http://www.google.com/search?q=‹SearchWord›
;;;###autoload
(defun lookup-wikipedia ()
  "Look up the word under cursor in Wikipedia.
This command generates a url for Wikipedia.com and switches you
to browser. If a region is active (a phrase), lookup that phrase."
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties
               (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myword (replace-regexp-in-string " " "_" myword))
    (setq myurl (concat "http://en.wikipedia.org/wiki/" myword))
    (browse-url myurl)
    ))

;;--------------------------------------------------------------------

;; REF: http://blog.tuxicity.se/?p=32
;; by Johan Andersson
;; Two of my most frequently used tools when programming are Emacs and
;; Firefox. And much of the time in Firefox I spend on Google. That's
;; why I created this (simple) function that googles a region. Just
;; select the region you want to google and then do M-x google-region
;; (or preferably bind a key to it).
;;;###autoload
(defun google-region (beg end)
  "Google the selected region."
  (interactive "r")
  (browse-url (concat
               "http://www.google.co.uk/search?ie=utf-8&oe=utf-8&q="
               (buffer-substring beg end))))

;;--------------------------------------------------------------------

;;** 插入日期时间
;; insert the variations of date formats (ISO and european formats)
;; REF: http://www.emacswiki.org/emacs/InsertingTodaysDate
;;;###autoload
(defun date (arg)
  (interactive "P")
  (insert (if arg
              (format-time-string "%d.%m.%Y")
            (format-time-string "%Y-%m-%d"))))
;;;###autoload
(defun timestamp ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%H:%M:%S")))

;;--------------------------------------------------------------------

;;** 模仿vim 的 % 命令
;; 王垠的解决方案，如果在括号上按下 % 则跳转到匹配的括号处，否则输入一
;; 个 %
;;;###autoload
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;;--------------------------------------------------------------------------------

;;** 存盘前查看改动了哪些地方
;; 比较一下buffer里的内容与文件系统里老文件的不同
;; REF: http://www.bookshelf.jp/soft/meadow_44.html#SEC661
;;;###autoload
(defun diff-with-original (ediff)
  "Examin diff of current buffer with original file.
        If with prefix, do interactive merge using `ediff-with-original'. "
  (interactive "P")
  (if ediff
      (ediff-with-original)
    ;; simple diff view with diff-mode
    (require 'ediff)
    (let ((diff-buf (get-buffer-create (format "*diff %s*" (buffer-file-name))))
          (ediff-diff-options "-u") ;; is it your favourite?
          (tmpfile (ediff-make-temp-file (current-buffer))))
      (save-excursion
        (set-buffer diff-buf)
        (setq buffer-read-only nil)
        (buffer-disable-undo)
        (erase-buffer))
      (ediff-make-diff2-buffer diff-buf
                               (buffer-file-name)
                               tmpfile)
      (delete-file tmpfile)
      (set-buffer diff-buf)
      (if (< (buffer-size) 1)
          (message "No differences with original file.")
        (condition-case nil
            (progn
              (require 'diff-mode)
              (diff-mode))
          (error))
        (goto-char 1)
        (pop-to-buffer diff-buf)))))
;;;###autoload
(defun ediff-with-original ()
  (interactive)
  ;; interactive merge using ediff
  (let ((file buffer-file-name)
        (buf (current-buffer))
        (orig-buf (get-buffer-create
                   (concat "*orig " buffer-file-name "*"))))
    (set-buffer orig-buf)
    (setq buffer-read-only nil)
    (buffer-disable-undo)
    (erase-buffer)
    (insert-file file)
    (setq buffer-read-only t)
    (set-buffer-modified-p nil)
    (ediff-buffers orig-buf buf)))

;;--------------------------------------------------------------------

;; REF: http://emacsblog.org/2007/09/30/quick-tip-spaces-instead-of-tabs/
;; BUG: NOT work
;; ;;;###autoload
;; (defun my-show-tabs ()
;;   (interactive)
;;   (let ((i 0) (disptab make-display-table)))
;;   (while (&lt; i 32)
;;           (or (= i ?\n)
;;               (aset disptab i (vector ?^ (+ i 64))))
;;           (setq i (1+ i)))
;;     (aset disptab 127 (vector ?^ ??))
;;     (setq buffer-display-table disptab)))

;; ;;;###autoload
;; (defun my-hide-tabs ()
;;   (interactive)
;;   (let ((i 0) (disptab make-display-table)))
;;   (while (&lt; i 32)
;;           (or (= i ?\n) (= i ?\t)
;;               (aset disptab i (vector ?^ (+ i 64))))
;;           (setq i (1+ i)))
;;     (aset disptab 127 (vector ?^ ??))
;;     (setq buffer-display-table disptab)))

;;====================================================================
;;* Programming tools
;;====================================================================

;;;###autoload
(defun ywb-indent-accoding-to-paren ()
  "按块([]{}())来格式化代码"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char)))
        (pos (point)))
    (save-excursion
      (cond ((string-match "[[{(<]" next-char)
             (indent-region pos (progn (forward-sexp 1) (point)) nil))
            ((string-match "[\]})>]" prev-char)
             (indent-region (progn (backward-sexp 1) (point)) pos nil))))))

;; NOTE: use meteor's goto-match-paren instead
;; ;;;###autoload
;; (defun goto-paren ()
;;   "跳到匹配的括号"
;;   (interactive)
;;   (cond
;;    ((looking-at "[ \t]*[[\"({]") (forward-sexp) (backward-char))
;;    ((or (looking-at "[]\")}]") (looking-back "[]\")}][ \t]*")) (if (< (point) (point-max)) (forward-char)) (backward-sexp))
;;    (t (message "找不到匹配的括号"))))

;;;###autoload
(defun generate-tag-table ()
  "Generate tag tables under current directory(Linux)."
  (interactive)
  (let ((exp "") (dir ""))
    (setq dir (read-from-minibuffer "generate tags in: " default-directory)
          exp (read-from-minibuffer "suffix: "))
    (with-temp-buffer
      (shell-command
       (concat "find " dir " -name \"" exp "\" | xargs etags ")
       (buffer-name)))))


;;;###autoload
(defun copy-current-fun-name ()
  "Copy current function name."
  (interactive)
  (kill-new (which-function)))

;;;###autoload
(defun skeleton-c-mode-left-brace (arg)
  (interactive "P")
  (if  (c-in-literal (c-most-enclosing-brace (c-parse-state)))
      (self-insert-command 1)
    ;; auto insert complex things.
    (let* ((current-line (delete-and-extract-region (line-beginning-position) (line-end-position)))
           (lines (and arg (mark t) (delete-and-extract-region (mark t) (point))))
           (after-point (make-marker)))
       ;;; delete extra blank begin and after the LINES
      (setq lines (and lines
                       (with-temp-buffer
                         (insert lines)
                         (beginning-of-buffer)
                         (delete-blank-lines)
                         (delete-blank-lines)
                         (end-of-buffer)
                         (delete-blank-lines)
                         (delete-blank-lines)
                         (buffer-string))))
      (save-excursion
        (let* ((old-point (point)))
          (insert (if current-line current-line "")  "{\n")
          (and lines (insert lines))
          (move-marker after-point (point))
          (insert "\n}")
          (indent-region old-point (point) nil)))
      (goto-char after-point)
      (c-indent-line))))

;; (setq my-shebang-patterns
;;       (list "^#!\\s-*/usr/.*/perl\\(\\( \\)\\|\\( .+ \\)\\)-w *.*"
;;             "^#!\\s-*/usr/.*/sh"
;;             "^#!\\s-*/usr/.*/bash"
;;             "^#!\\s-*/bin/sh"
;;             "^#!\\s-*/.*/perl"
;;             "^#!\\s-*/.*/awk"
;;             "^#!\\s-*/.*/sed"
;;             "^#!\\s-*/.*/tclsh$"
;;             "^#!\\s-*/.*/expect$"
;;             "^#!\\s-*/bin/bash"))
;; (add-hook
;;  'after-save-hook
;;  (lambda ()
;;    (if (not (= (shell-command (concat "test -x " (buffer-file-name))) 0))
;;        (progn
;;          ;; This puts message in *Message* twice, but minibuffer
;;          ;; output looks better.
;;          (message (concat "Wrote " (buffer-file-name)))
;;          (save-excursion
;;            (goto-char (point-min))
;;            ;; Always checks every pattern even after
;;            ;; match.  Inefficient but easy.
;;            (dolist (my-shebang-pat my-shebang-patterns)
;;              (if (looking-at my-shebang-pat)
;;                  (if (= (shell-command
;;                          (concat "chmod u+x " (buffer-file-name)))
;;                         0)
;;                      (message (concat
;;                                "Wrote and made executable "
;;                                (buffer-file-name))))))))
;;      ;; This puts message in *Message* twice, but minibuffer output
;;      ;; looks better.
;;      (message (concat "Wrote " (buffer-file-name))))))

;;---------------------------------------------------------------------------

;; Remove any extra spaces caused by indentation when killing the
;; newline between.
;; REF: http://www.emacswiki.org/emacs/AutoIndentation
;;;###autoload
(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
     Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn
         (delete-indentation t)
         (if (looking-at " $")
             (delete-char 1)))
    (kill-line arg)))

;;--------------------------------------------------------------------

;; merge a line with the line before it.
;; REF:
;; http://blog.jdhuntington.com/2011/01/emacs-elisp-snipped-jlhjoinlin.html
;;;###autoload
(defun jlh-join-lines (arg)
  "Join this line to the line above n times
Running this command with an argument of 1 is equivalent
to running 'delete-indentation (aka 'join-line)."
  (interactive "NHow many lines to join?: ")
  (while (> arg 0)
    (join-line)
    (setq arg (- arg 1))))

;;====================================================================
;;* From pluskid (星黎殿)
;; REF: http://lifegoo.pluskid.org/wiki/index.html
;;====================================================================

;;** 在 Emacs 里面使用 Stardict
;; 调用 stardict 的命令行接口来查辞典
;; 如果选中了 region 就查询 region 的内容，
;; 否则就查询当前光标所在的词
;;;###autoload
;; (global-set-key (kbd "C-c d") 'kid-star-dict)
(defun kid-star-dict ()
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    ;; 有时候 stardict 会很慢，所以在回显区显示一点东西
    ;; 以免觉得 Emacs 在干什么其他奇怪的事情。
    (message "searching for %s ..." (buffer-substring begin end))
    (tooltip-show
     (shell-command-to-string
      (concat "sdcv -n "
              (buffer-substring begin end))))))

;; 调用 stardict 的命令行程序 sdcv 来查辞典
;; 如果选中了 region 就查询 region 的内容，否则查询当前光标所在的单词
;; 查询结果在一个叫做 *sdcv* 的 buffer 里面显示出来，在这个 buffer 里面
;; 按 q 可以把这个 buffer 放到 buffer 列表末尾，按 d 可以查询单词
;; (global-set-key (kbd "C-c d") 'kid-sdcv-to-buffer)
;;;###autoload
(defun kid-sdcv-to-buffer ()
  (interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties
                   (region-beginning) (region-end))
                (current-word nil t))))
    (setq word
          (read-string
           (format "Search the dictionary for (default %s): " word)
           nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process
           (start-process-shell-command
            "sdcv" "*sdcv*" "sdcv" "-n" word)))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (setq kid-sdcv-window-configuration
                   (current-window-configuration))
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
             (local-set-key (kbd "q")
                            (lambda ()
                              (interactive)
                              (bury-buffer)
                              (unless
                                  (null (cdr (window-list)))
                                (delete-window)))))
           (goto-char (point-min))))))))

(provide 'xy-edit-tools)

;;; xy-edit-tools.el ends here
