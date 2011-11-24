;;; xy-edit-tools.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Maintainer: Xin Yang
;; Created: 28 Jan 2011
;; Timestamp:
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Collected various functions to assist edting. 

;;; Code:

(require 'cl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* 收集的一些有用的辅助编辑函数
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; NOTE: 换用`buffer-move'
;;* 交换两个 Window 里的内容
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

;;;###autoload
(defun get-mode-name ()
  "显示`major-mode'及`mode-name'"
  (interactive)
  (message "major-mode is %s, mode-name is %s" major-mode mode-name))

;; (global-set-key (kbd "C-x M") 'get-mode-name) 

;;----------------------------------------------------------------------

;; REF: [[http://xahlee.org/emacs/emacs_lookup_ref.html]]
;; use emacs as a dictionary application, that allows you to lookup 
;; the definitions of a word under cursor, or any general reference 
;; such as Wikipedia, Google, or lookup documentation of computer 
;; language's keywords.

;; press F6 will launch your browser and lookup definition 
;; of the word under cursor.

;; You can change the url to a different online dictionary reference website.

;; Here are some other online dictionary sites and their url 
;; search syntax, using sample word “curlicue”. 
;; AHD means American Heritage Dictionary.

;; http://education.yahoo.com/reference/dictionary/entry/curlicue (AHD)
;; http://www.answers.com/main/ntquery?s=curlicue (AHD)
;; http://en.wiktionary.org/wiki/curlicue (wiktionary)
;; http://m-w.com/dictionary/curlicue (Merriam Webster)
;; http://www.askoxford.com/concise_oed/curlicue (Compact Oxford Eng Dict )
;; http://www.yourdictionary.com/curlicue
;; http://dictionary.reference.com/browse/curlicue (AHD, Random House, WordNet, ...)
;; http://www.dict.org/bin/Dict?Form=Dict2&Database=*&Query=curlicue (OpenSource Dicts)

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

;; (global-set-key [S-f8] 'lookup-word-definition)

;;-----------------------------------------------------------------

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
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))

    (setq myword (replace-regexp-in-string " " "_" myword))
    (setq myurl (concat "http://en.wikipedia.org/wiki/" myword))
    (browse-url myurl)
    ))

;; (global-set-key [C-f8] 'lookup-wikipedia)

;;-------------------------------------------------------------

;; REF: [[http://blog.tuxicity.se/?p=32]]
;; by Johan Andersson
;; Two of my most frequently used tools when programming are Emacs and Firefox. 
;; And much of the time in Firefox I spend on Google. 
;; That’s why I created this (simple) function that googles a region. 
;; Just select the region you want to google and then do 
;; M-x google-region (or preferably bind a key to it).

;;;###autoload
(defun google-region (beg end) 
  "Google the selected region." 
  (interactive "r") 
  (browse-url (concat 
               "http://www.google.co.uk/search?ie=utf-8&oe=utf-8&q=" 
               (buffer-substring beg end))))

;; (global-set-key [M-f8] 'google-region)

;;-------------------------------------------------------------------------------

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

;;--------------------------------------------------------------------------------

;; 添加删除注释

;; 写程序的，要经常和注释打交道，注释和反注释一段代码是家常便饭。
;; 可惜，Emacs 虽然有这个功能，默认的配置却并不好用：
;;     * 注释/反注释这两个功能默认没有绑定快捷键
;;     * 需要先选中一段区域才能调用注释功能，哪怕只想注释/反注释当前行
;;     * 好在有一个 Alt-; 的快捷键，默认绑定了 
;;       comment-dwim，能注释/反注释当前激活的区域。
;;       如果没有激活区域，就在当前行末加注释
;; 其实 Alt-; 默认绑定的 comment-dwim 已经很理想了，可是，还是不够 dwim 
;; (Do What I Mean)。
;; 如果没有激活的区域，就注释/反注释当前行，仅当在行尾的时候才在行尾加注释
;; REF: http://emacser.com/torture-emacs.htm

;;;###autoload
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))


;;------------------------------------------------------------------------------

;; 把 Alt-k 设成复制光标所在处到行尾。与 kill-line 的 Ctrl-k
;; 对应。这样一来，如果是要拷贝一整行的话，只要将光标移动到该行任意位置，按下 Alt-w；
;; 如果是复制某个位置到行尾的文字的话，就把光标移到起始位置处，按 Alt-k 。
;; REF: http://emacser.com/torture-emacs.htm

;; Smart copy, if no region active, it simply copy the current whole line

;;;###autoload
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))

;;;###autoload
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))

;;;###autoload
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; Copy line from point to the end, exclude the line break

;;;###autoload
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;;------------------------------------------------------------------------------

;; 拷贝代码自动格式化
;; Emacs 里对代码的格式化支持的非常好，不但可以在编辑的时候自动帮你格式化，
;; 还可以选中一块代码，按 Ctrl-Alt-\ 对这块代码重新进行格式化。
;; 如果要粘贴一块代码的话，粘贴完了紧接着按 Ctrl-Alt-\ ，
;; 就可以把新加入的代码格式化好。下面的代码能实现这些机械操作。
;; 你可以加入或删除一些 mode 名称来定制上面的配置。 
;; REF: http://emacser.com/torture-emacs.htm

;;;###autoload
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(emacs-lisp-mode
                     lisp-mode
                     ;; clojure-mode
                     ;; scheme-mode
                     ;; haskell-mode
                     ;; ruby-mode
                     ;; rspec-mode
                     ;; python-mode
                     sh-mode
                     c-mode
                     c++-mode
                     ;; objc-mode
                     latex-mode
                     ;; js-mode
                     vhdl-mode
                     verilog-mode
                     ;; plain-tex-mode
                     ;; org-mode
                     ))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))

;;-------------------------------------------------------------------------------

;; 王垠的解决方案，模仿 vim 的 % 命令，如果在括号上按下 % 则跳转到匹配的
;; 括号处，否则输入一个 %
;;;###autoload
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
		((looking-at "\\s\)") (forward-char 1) (backward-list 1))
		(t (self-insert-command (or arg 1)))))
;; (global-set-key "%" 'match-paren)

;;--------------------------------------------------------------------------------

;; 存盘前查看改动了哪些地方，比较一下buffer里的内容与文件系统里老x文件
;; 的不同
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
        (orig-buf (get-buffer-create (concat "*orig " buffer-file-name "*"))))
    (set-buffer orig-buf)
    (setq buffer-read-only nil)
    (buffer-disable-undo)
    (erase-buffer)
    (insert-file file)
    (setq buffer-read-only t)
    (set-buffer-modified-p nil)
    (ediff-buffers orig-buf buf)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* ahei 的函数
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use `redo.el' instead
;; ;;;###autoload
;; (defmacro def-redo-command (fun-name redo undo)
;;   "Make redo command."
;;   `(defun ,fun-name ()
;;      (interactive)
;;      (if (equal last-command ,redo)
;;          (setq last-command 'undo)
;;        (setq last-command nil))
;;      (call-interactively ,undo)
;;      (setq this-command ,redo)))
;; (def-redo-command redo 'redo 'undo)

;;;###autoload
(defmacro def-action-on-area-command (fun-name action mark-area doc)
  `(defun ,fun-name ()
     ,doc
     (interactive)
     (save-excursion
       (funcall ,mark-area)
       (call-interactively ,action))))

;;------------------------------------------------------------------

;;;###autoload
(defun backward-kill-word-or-kill-region ()
  "`mark-active'时, 剪切选择的区域, 平时向后删除word, 和bash下面一样."
  (interactive)
  (if (rm-mark-active)
      (call-interactively 'rm-kill-region)
    (if mark-active
        ;; (if cua--rectangle
        ;;     (progn
        ;;       (cua-cut-rectangle t)
        ;;       (cua-cancel))
          (call-interactively 'kill-region);;)
      (call-interactively 'backward-kill-word))))

;;-------------------------------------------------------------------

;; ;;;###autoload
;; (defun mark-whole-sexp (&optional not-whole)
;;   "Mark whole sexp.

;; If NOT-WHOLE is non-nil, do not mark whole sexp."
;;   (interactive "P")
;;   (if not-whole
;;       (mark-sexp)
;;     (let ((region (bounds-of-thing-at-point 'sexp)))
;;       (if (not region)
;;           (message "Can not found sexp.")
;;         (goto-char (car region))
;;         (call-interactively 'set-mark-command)
;;         (forward-sexp)))))

;;-------------------------------------------------------------------

;; ;;;###autoload
;; (defun kill-whole-sexp (&optional not-whole)
;;   "Kill whole sexp.

;; If NOT-WHOLE is non-nil, do not kill whole sexp."
;;   (interactive)
;;   (mark-whole-sexp not-whole)
;;   (backward-kill-word-or-kill-region))

;;-------------------------------------------------------------------

;; ;;;###autoload
;; (defun copy-sexp (&optional not-whole)
;;   "Copy whole sexp.

;; If NOT-WHOLE is non-nil, do not copy whole sexp."
;;   (interactive)
;;   (save-excursion
;;     (mark-whole-sexp not-whole)
;;     (if mark-active
;;         (copy-region (region-beginning) (region-end)))))

;;-------------------------------------------------------------------

;;;###autoload
(defun my-kill-word ()
  "删除一个单词, 当光标处于单词中间时也删除整个单词, 这是与`kill-word'的区别"
  (interactive)
  (wcy-mark-some-thing-at-point)
  (backward-kill-word-or-kill-region))

;;-------------------------------------------------------------------

;;;###autoload
(defun mark-function ()
  "Mark function."
  (interactive)
  (cond
   ((or (equal major-mode 'c-mode) (equal major-mode 'c++-mode))
    (c-mark-function))
   ((or (equal major-mode 'emacs-lisp-mode) (equal major-mode 'lisp-mode) (equal major-mode 'lisp-interaction-mode))
    (lisp-mark-function))))

;;-------------------------------------------------------------------

;;;###autoload
(defmacro def-action-on-function-command (fun-name action action-str)
  `(defun ,fun-name ()
     ,(concat (capitalize action-str) " function.")
     (interactive)
     (save-excursion
       (mark-function)
       (call-interactively ,action))))

;;-------------------------------------------------------------------

;;;###autoload
(defun comment-function (&optional arg)
  "Comment function."
  (interactive "P")
  (save-excursion
    (mark-function)
    (comment-region (region-beginning) (region-end) arg)))

;;-------------------------------------------------------------------

;; ;;;###autoload
;; (defun kill-whole-paragraph (&optional arg)
;;   "Kill whole paragraph."
;;   (interactive "P")
;;   (if arg
;;       (kill-paragraph nil)
;;     (call-interactively 'mark-paragraph)
;;     (call-interactively 'kill-region)))

;;--------------------------------------------------------------------

;; ;;;###autoload
;; (defun copy-whole-paragraph (&optional arg)
;;   "Copy whole paragraph."
;;   (interactive "P")
;;   (save-excursion
;;     (if arg
;;         (progn
;;           (mark-command t)
;;           (forward-paragraph))
;;       (call-interactively 'mark-paragraph))
;;     (call-interactively 'copy-region)))

;;---------------------------------------------------------------------

;; ;;;###autoload
;; (defun copy-cur-line ()
;;   "拷贝当前行"
;;   (interactive)
;;   (let ((end (min (point-max) (1+ (line-end-position)))))
;;     (copy-region-as-kill-nomark (line-beginning-position) end)))

;;---------------------------------------------------------------------

;; ;;;###autoload
;; (defun copy-lines (&optional number)
;;   "从当前行开始拷贝NUMBER行"
;;   (interactive "p")
;;   (if (null number)
;;       (copy-cur-line)
;;     (let ((lineNo))
;;       (save-excursion
;;         (if (< number 0)
;;             (next-line))
;;         (setq lineNo (line-number-at-pos nil))
;;         (move-beginning-of-line nil)
;;         (set-mark-command nil)
;;         (goto-line (+ number lineNo))
;;         (call-interactively 'copy-region-as-kill-nomark)))))

;;----------------------------------------------------------------------

;; ;;;###autoload
;; (defun copy-line-left ()
;;   "拷贝当前行光标后面的文字"
;;   (interactive)
;;   (copy-region-as-kill-nomark (point) (min (1+ (line-end-position)) (point-max))))

;;---------------------------------------------------------------------

;; ;;;###autoload
;; (defun smart-copy ()
;;   "智能拷贝, 如果`mark-active'的话, 则`copy-region', 否则`copy-lines'"
;;   (interactive)
;;   (if mark-active (call-interactively 'copy-region) (call-interactively 'copy-lines)))

;;---------------------------------------------------------------------

;; ;;;###autoload
;; (defun copy-region-and-paste ()
;;   "拷贝region并且粘贴到region后"
;;   (interactive)
;;   (call-interactively 'copy-region)
;;   (call-interactively 'yank))

;;---------------------------------------------------------------------

;; ;;;###autoload
;; (defun which-copy ()
;;   "如果`mark-active'的话, 则`copy-region-and-paste', 否则`copy-line-left'"
;;   (interactive)
;;   (if mark-active (copy-region-and-paste) (copy-line-left)))

;;---------------------------------------------------------------------

;; ;;;###autoload
;; (defun insert-cur-line ()
;;   "拷贝当前行并粘贴进当前buffer"
;;   (interactive)
;;   (copy-cur-line)
;;   (forward-line)
;;   (beginning-of-line)
;;   (call-interactively 'yank)
;;   (previous-line)
;;   (end-of-line))

;;--------------------------------------------------------------------

;; ;;;###autoload
;; (defun insert-cur-sexp ()
;;   "拷贝当前sexp并粘贴进当前buffer"
;;   (interactive)
;;   (copy-sexp)
;;   (call-interactively 'yank))

;;--------------------------------------------------------------------

;;;###autoload
(defun copy-sentence ()
  "拷贝sentence"
  (interactive)
  (save-excursion
    (call-interactively 'mark-end-of-sentence)
    (call-interactively 'copy-region-as-kill-nomark)))

;;--------------------------------------------------------------------

;; 删除当前光标到行首的字符
;;;###autoload
(defun del-to-begin (&optional arg)
  "Delete characters to line beginning."
  (interactive "P")
  (if (not arg)
      (kill-line 0)
    (copy-region-as-kill-nomark (1+ (line-beginning-position)) (point))))

;;--------------------------------------------------------------------

;;;###autoload
(defun lisp-mark-function (&optional allow-extend)
  "`mark-defun'有时候会多mark一个空白行, 这个函数就是解决这个bug的"
  (interactive "p")
  (mark-defun allow-extend)
  (let (next-is-fun)
    (save-excursion (forward-line) (setq next-is-fun (looking-at "[ \t]*(defun")))
    (if (or (looking-at "$") (and next-is-fun (not (looking-at "[ \t]*(defun"))))
        (forward-line))))

;;--------------------------------------------------------------------

;;;###autoload
(defun case-trans ()
  "大小写转换当前字符"
  (interactive)
  (let* ((ochar (char-after (point))) (char ochar))
    (if (and (>= char ?a) (<= char ?z))
        (setq char (upcase char))
      (setq char (downcase char)))
    (if (/= ochar char)
        (save-excursion
          (delete-char 1)
          (insert-char char 1)))))

;;--------------------------------------------------------------------

;; ;;;###autoload
;; (defun comment (&optional arg)
;;   "如果`mark-active'的话,就`comment-region',否则注释光标所在行"
;;   (interactive "P")
;;   (if mark-active
;;       (comment-region (region-beginning) (region-end) arg)
;;     (let (fun)
;;       (if arg (setq fun 'uncomment-region) (setq fun 'comment-region))
;;       (funcall fun (line-beginning-position) (line-end-position)))))

;;-------------------------------------------------------------------

;; ;;;###autoload
;; (defun uncomment (&optional arg)
;;   "如果`mark-active'的话,就`uncomment-region',否则取消注释光标所在行"
;;   (interactive "P")
;;   (comment (not arg)))

;;-------------------------------------------------------------------

;; ;;;###autoload
;; (defun mark-invisible-region ()
;;   "Mark invisible region."
;;   (interactive)
;;   (if (not (and last-region-beg last-region-end))
;;       (message "No previous region.")
;;     (goto-char last-region-beg)
;;     (if last-region-is-rect
;;         (if last-region-use-cua
;;             (call-interactively 'cua-set-rectangle-mark)
;;           (call-interactively 'rm-set-mark))
;;       (call-interactively 'set-mark-command))
;;     (goto-char last-region-end)
;;     (if (and last-region-is-rect last-region-use-cua)
;;         (cua--activate-rectangle))))

;;--------------------------------------------------------------------

;;;###autoload
(defun c-electric-backspace-kill ()
  "If `mark-active', run `kill-region', otherwise run `c-electric-backspace'."
  (interactive)
  (if mark-active
      (call-interactively 'kill-region)
    (call-interactively 'c-electric-backspace)))

;;---------------------------------------------------------------------

;; ;;;###autoload
;; (defun delete-blank-lines-region (beg end)
;;   "Execute `delete-blank-lines' in region."
;;   (interactive "*r")
;;   (save-excursion
;;     (goto-char beg)
;;     (let ((blank-line "^\\s-*$")
;;           (nonblank-line "^.*\\S-.*$")
;;           blank-beg blank-end)
;;       (while (and (< (point) end) (setq blank-beg (search-forward-regexp blank-line end t)))
;;         (save-excursion
;;           (setq blank-end (search-forward-regexp nonblank-line end t)))
;;         (if blank-end
;;             (setq end (- end (- blank-end blank-beg)))
;;           (setq end 0))
;;         (previous-line)
;;         (delete-blank-lines)))))

;;-----------------------------------------------------------------------

;; ;;;###autoload
;; (defun smart-delete-blank-lines (&optional no-region)
;;   "Smart `delete-blank-lines'.

;; If NO-REGION is non-nil, always execute `delete-blank-lines',
;; otherwise, if `mark-active', execute `delete-blank-lines-region',
;; and execute `delete-blank-lines' if there no mark."
;;   (interactive "P")
;;   (if (or no-region (not mark-active))
;;       (delete-blank-lines)
;;     (call-interactively 'delete-blank-lines-region)))

;;-----------------------------------------------------------------------

;;;###autoload
(defun smart-home (&optional home)
  "Goto home.

If HOME is negative, call `beginning-of-line-text',
otherwise call `move-beginning-of-line'."
  (interactive "P")
  (if (not home)
      (let ((old (point)))
        (beginning-of-line-text)
        (if (= (point) old)
            (move-beginning-of-line 1)))
    (if (< (prefix-numeric-value home) 0)
        (beginning-of-line-text)
      (move-beginning-of-line 1))))

;;----------------------------------------------------------------------- 

;; ;;;###autoload
;; (defun smart-kill ()
;;   "If `mark-active', call `kill-region', otherwise call `kill-whole-line'."
;;   (interactive)
;;   (if mark-active
;;       (call-interactively 'kill-region)
;;     (call-interactively 'kill-whole-line)))

;;----------------------------------------------------------------------

;;;###autoload
(defun smart-indent ()
  "If `mark-active', call `indent-region', otherwise indent all buffer."
  (interactive)
  (save-excursion
    (unless mark-active
      (call-interactively 'mark-whole-buffer))
    (call-interactively 'indent-region)))

;;----------------------------------------------------------------------

;;;###autoload
(defun fill-paragraph-justify (region)
  "Run `fill-paragraph' with argument justify t."
  (interactive (list t))
  (fill-paragraph 'full region))

;;----------------------------------------------------------------------

;;;###autoload
(defun count-brf-lines (&optional is-fun)
  "显示当前buffer或region或函数的行数和字符数"
  (interactive "P")
  (let (min max)
    (if is-fun
        (save-excursion
          (beginning-of-defun) (setq min (point))
          (end-of-defun) (setq max (point))
          (message "当前函数%s内共有%d行, %d个字符" (which-function) (count-lines min max) (- max min)))
      (if mark-active
          (progn
            (setq min (min (point) (mark)))
            (setq max (max (point) (mark))))
        (setq min (point-min))
        (setq max (point-max)))
      (if (or (= 1 (point-min)) mark-active)
          (if mark-active
              (message "当前region内共有%d行, %d个字符" (count-lines min max) (- max min))
            (message "当前buffer内共有%d行, %d个字符" (count-lines min max) (- max min)))
        (let ((nmin min) (nmax max))
          (save-excursion
            (save-restriction
              (widen)
              (setq min (point-min))
              (setq max (point-max))))
          (message "narrow下buffer内共有%d行, %d个字符, 非narrow下buffer内共有%d行, %d个字符"
                   (count-lines nmin nmax) (- nmax nmin) (count-lines min max) (- max min)))))))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x l" count-brf-lines)
;;    ("C-x L" (lambda () (interactive) (count-brf-lines t)))))

;;----------------------------------------------------------------------

;;;###autoload
(defun switch-to-scratch ()
  "切换到*scratch*"
  (interactive)
  (let ((buffer (get-buffer-create "*scratch*")))
    (switch-to-buffer buffer)
    (unless (equal major-mode 'lisp-interaction-mode)
      (lisp-interaction-mode))))
;; (global-set-key (kbd "C-x s") 'switch-to-scratch)

;;---------------------------------------------------------------------

;;;###autoload
(defun copy-file-name (&optional full)
  "Copy file name of current-buffer.
If FULL is t, copy full file name."
  (interactive "P")
  (let ((file (buffer-name)))
    (if full
        (setq file (expand-file-name file)))
    (kill-new file)
    (message "File `%s' copied." file)))

;; (eal-define-keys
;;  `(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map sh-mode-map
;;                        c-mode-base-map text-mode-map ruby-mode-map html-mode-map
;;                        java-mode-map conf-javaprop-mode-map conf-space-mode-map
;;                        python-mode-map)
;;  `(("C-c M-C" copy-file-name)))
;;---------------------------------------------------------------------

;; 关于mark的一些设置，使你非常方便的选择region

;;;###autoload
(defun mark-command (&optional no-record)
  "如果是CUA mode, 则执行`cua-set-mark', 否则执行`set-mark-command'.
if NO-RECORD is non-nil, do not record last-region."
  (interactive)
  (unless no-record
    (setq last-region-beg (point))
    (setq last-region-is-rect nil))
  (let ((command (if cua-mode 'cua-set-mark 'set-mark-command)))
    (if (interactive-p)
        (call-interactively command)
      (funcall command))))

;;;###autoload
(defmacro def-mark-move-command (command)
  "Make definition of command which first `mark-command' and then move."
  `(defun ,(am-intern "mark-and-" command) ()
     ,(concat "If no `mark-active', then `mark-command'. After do
that, execute `" command "'.")
     (interactive)
     (if (not mark-active) (call-interactively 'mark-command))
     (call-interactively (intern ,command))
     (setq last-region-end (point))))

(apply-args-list-to-fun
 'def-mark-move-command
 `("next-line" "previous-line" "end-of-buffer" "beginning-of-buffer"))

;;;###autoload
(defmacro def-remember-command (command)
  "Make definition of command which remember `point'."
  `(defun ,(am-intern command "-remember") ()
     ,(concat "When `" command "' remember `point'.")
     (interactive)
     (call-interactively (intern ,command))
     (if mark-active
         (setq last-region-end (point)))))

;;;###autoload
(defun wcy-mark-some-thing-at-point()
  "这个功能就是根据光标的所在位置，智能的选择一块区域，也就
是设置成为当前的point和mark。这样就可以方便的拷贝或者剪切，
或者交换他们的位置。

如果当前光标在一个单词上，那么区域就是这个单词的开始和结尾分别。
如果当前光标在一个连字符上，那么就选择包含连字符的一个标识符。
这两个的是有区别的，而且根据不同的mode的语法定义，连字符和单词
的定义也不一样。

例如C mode下，abc_def_xxx, 如果光标停在abc上，那么就会选择abc
这个单词。如果停在下划线上，那么就会选择abc_def_xxx。如果当前
光标在一个双引号,单引号，一个花括号，方括号，圆括号，小于号，
或者大于号等等，那么就会选择他们对应的另一个括号之间的区域。
引号中的escape字符也是可以自动识别的。嵌套关系也是可以识别的。
这一点可以和VIM中的%的功能类比。"

  (interactive)
  (let* ((from (point))
         (a (mouse-start-end from from 1))
         (start (car a))
         (end (cadr a))
         (goto-point (if (= from start) end start)))
    (if (eq last-command 'wcy-mark-some-thing-at-point)
        (progn
          ;; exchange mark and point
          (goto-char (mark-marker))
          (set-marker (mark-marker) from))
      (push-mark (if (= goto-point start) end start) nil t)
      (when (and (interactive-p) (null transient-mark-mode))
        (goto-char (mark-marker))
        (sit-for 0 500 nil))
      (goto-char goto-point))))

;;-------------------------------------------------------------------------

;; 矩形区域操作

;;;###autoload
(defun rm-mark-command ()
  "如果是CUA mode, 则执行`cua-set-rectangle-mark', 
否则执行`rm-set-mark'"

  (interactive)
  (setq last-region-beg (point))
  (setq last-region-is-rect t)
  (setq last-region-use-cua cua-mode)
  (if cua-mode
      (call-interactively 'cua-set-rectangle-mark)
    (try-require 'rect-mark)
    (call-interactively 'rm-set-mark)))

;;;###autoload
(defun copy-region (beg end)
  "根据`mark-active'和`rm-mark-active'来决定是执行
`copy-region-as-kill-nomark'还是`rm-kill-ring-save'"

  (interactive "r")
  (if cua-mode
      (if cua--rectangle
          (progn
            (cua-copy-rectangle t)
            (cua-cancel))
        (call-interactively 'cua-copy-region))
    (if (rm-mark-active) 
        (call-interactively 'rm-kill-ring-save) 
      (copy-region-as-kill-nomark beg end))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Rick Bielawski's function collection
;; REF: http://www.emacswiki.org/emacs/Rick_Bielawski
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;###autoload
(defun rgb-window-horizontal-to-vertical ()
  "Switches from a horizontal split to a vertical split."
  (interactive)
  (let ((one-buf (window-buffer (selected-window)))
		(buf-point (point)))
	(other-window 1)
	(delete-other-windows)
	(split-window-horizontally)
	(switch-to-buffer one-buf)
	(goto-char buf-point)))

;;--------------------------------------------------------------------

;;;###autoload
(defun rgb-window-vertical-to-horizontal ()
  "Switches from a vertical split to a horizontal split."
  (interactive)
  (let ((one-buf (window-buffer (selected-window)))
		(buf-point (point)))
	(other-window 1)
	(delete-other-windows)
	(split-window-vertically)
	(switch-to-buffer one-buf)
	(goto-char buf-point)))

;;--------------------------------------------------------------------

;;;###autoload
(defun insert-prior-line-char ()
  "Insert the same character as in the prior line. Space if none."
  (interactive)
  (let* ((cur (current-column))
		 (char (save-excursion
				 (if (or (not (eq 0 (forward-line -1)))
						 (not (eq cur (move-to-column cur)) ))
					 32
				   (char-after)))))
	(insert char)))

;;--------------------------------------------------------------------

;;;###autoload
(defun insert-sequence-symbol (key)
  "Insert the name of the function that key chord executes."
  (interactive "kInseret key description: ")
  (insert (symbol-name (key-binding key))))

;;--------------------------------------------------------------------

;;;###autoload
(defun insert-sequence-key (key)
  "Inserts a keystroke suitable for use in fcns like global-set-key"
  (interactive "kInseret key chord: ")
  (insert (format "(kbd \"%s\")" (key-description key))))

;;--------------------------------------------------------------------

;;;###autoload
(defun search-word-at-mouseclick (event)
  "Performs a nonincremental-search-forward starting from the beginning of the
   buffer or narrowed region.  The word clicked on is the word to search for.  If
   the click is in another window the search still occurs in the current window."
  (interactive "e")
  (let (searchword)
	(save-excursion
	  (set-buffer (window-buffer (posn-window (event-end event))))
	  (save-excursion
		(goto-char (posn-point (event-end event)))
		(setq searchword (current-word))))
	(if searchword
		(let ((cpt (point)))
		  (goto-char (point-min))
		  (setq menu-bar-last-search-type 'string)
		  (isearch-update-ring searchword nil)
		  (if (string= searchword (car (symbol-value minibuffer-history-variable)))
			  ()
			(set minibuffer-history-variable
				 (cons searchword (symbol-value minibuffer-history-variable))))
		  (unless (search-forward searchword nil t)
			(goto-char cpt)
			(error "Search Failed: \"%s\"" searchword)))
	  (ding))))

;; (global-set-key [mouse-2]  'search-word-at-mouseclick)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* Programming tools
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;-----------------------------------------------------------------------------

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* From meteor liu (刘欣)
;; REF: https://github.com/meteor1113/dotemacs/blob/master/init-basic.el
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;###autoload
;; (defadvice find-tag (before tags-file-name-advice activate)
;;   "Find TAGS file in ./ or ../ or ../../ dirs"
;;   (let ((list (mapcar 'expand-file-name '("./TAGS" "../TAGS" "../../TAGS"))))
;;     (while list
;;       (if (file-exists-p (car list))
;;           (progn
;;             (setq tags-file-name (car list))
;;             (setq list nil))
;;         (setq list (cdr list))))))

;;-------------------------------------------------------------------------------

;; ;;;###autoload
;; (defun find-dotemacs-file ()
;;   "Open .emacs file"
;;   (interactive)
;;   (let* ((paths '("~/.emacs" "~/.emacs.el" "~/.emacs.d/init.el" "~/_emacs"))
;;          (dotemacs-path))
;;     (dolist (path paths)
;;       (and (not dotemacs-path)
;;            (file-exists-p path)
;;            (setq dotemacs-path path)))
;;     (find-file (or dotemacs-path
;;                    (locate-file "site-start.el" load-path)
;;                    "~/.emacs"))))

;;-------------------------------------------------------------------------------


;;;###autoload
(defun move-line-up (p)
  "Move current line up, copy from crazycool@smth"
  (interactive "*p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (previous-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun move-line-down (p)
  "Move current line down, copy from crazycool@smth"
  (interactive "*p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (next-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun format-region ()
  "Format region, if no region actived, format current buffer.
Like eclipse's Ctrl+Alt+F."
  (interactive)
  (let ((start (point-min))
        (end (point-max)))
    (if (and (fboundp 'region-active-p) (region-active-p))
        (progn (setq start (region-beginning))
               (setq end (region-end)))
      (progn (when (fboundp 'whitespace-cleanup)
               (whitespace-cleanup))
             (setq end (point-max))))
    (save-excursion
      (save-restriction
        (narrow-to-region (point-min) end)
        (push-mark (point))
        (push-mark (point-max) nil t)
        (goto-char start)
        (when (fboundp 'whitespace-cleanup)
          (whitespace-cleanup))
        (untabify start (point-max))
        (indent-region start (point-max) nil)))))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun cxx-file-p (file)
  (let ((file-extension (file-name-extension file)))
    (and file-extension
         (string= file (file-name-sans-versions file))
         (find file-extension
               '("h" "hpp" "hxx" "c" "cpp" "cxx")
               :test 'string=))))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun format-cxx-file (file)
  "Format a c/c++ file."
  (interactive "F")
  (if (cxx-file-p file)
      (let ((buffer (find-file-noselect file))) ;; open buffer
        (save-excursion
          (set-buffer buffer)
          ;; (mark-whole-buffer)
          (when (fboundp 'whitespace-cleanup)
            (whitespace-cleanup))
          (untabify (point-min) (point-max))
          (indent-region (point-min) (point-max))
          (save-buffer)
          (kill-buffer)
          (message "Formated c++ file:%s" file)))
    (message "%s isn't a c++ file" file)))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun format-cxx-directory (dirname)
  "Format all c/c++ file in a directory."
  (interactive "D")
  ;; (message "directory:%s" dirname)
  (let ((files (directory-files dirname t)))
    (dolist (x files)
      (if (not (string= "." (substring (file-name-nondirectory x) 0 1)))
          (if (file-directory-p x)
              (format-cxx-directory x)
            (if (and (file-regular-p x)
                     (not (file-symlink-p x))
                     (cxx-file-p x))
                (format-cxx-file x)))))))

;;-------------------------------------------------------------------------------

;; ;;;###autoload
;; (defun grep-current-dir (&optional prompt wd)
;;   "Run `grep' to find current word in current directory."
;;   (interactive "P")
;;   (let* ((word (or wd
;;                    (and (fboundp 'region-active-p)
;;                         (region-active-p)
;;                         (buffer-substring-no-properties (region-beginning)
;;                                                         (region-end)))
;;                    (grep-tag-default)))
;;          (cmd (format grep-dir-format word)))
;;     (grep-apply-setting 'grep-use-null-device nil)
;;     (if (or prompt (= (length word) 0))
;;         (grep (read-shell-command
;;                "Run grep (like this): " cmd 'grep-history))
;;       (if (= 0 (length word))
;;           (message "Word is blank.")
;;         (grep cmd)))))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun grep-todo-current-dir ()
  "Run `grep' to find 'TODO' in current directory."
  (interactive)
  (grep-current-dir nil "TODO|BUG"))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun moccur-word-all-buffers (regexp)
  "Run `multi-occur' to find regexp in all buffers."
  (if (= 0 (length regexp))
      (message "Regexp is blank.")
    (let ((buffers (buffer-list)))
      (dolist (buffer buffers)
        (let ((pos (string-match " *\\*" (buffer-name buffer))))
          (when (and pos (= 0 pos))
            (setq buffers (remq buffer buffers)))))
      (multi-occur buffers regexp))))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun moccur-all-buffers (&optional prompt)
  "Run `multi-occur' to find current word in all buffers."
  (interactive "P")
  (let ((word (grep-tag-default)))
    (when (or prompt (= (length word) 0))
      (setq word (read-regexp "List lines matching regexp" word)))
    (moccur-word-all-buffers word)))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun moccur-todo-all-buffers ()
  "Run `multi-occur' to find 'TODO' in all buffers."
  (interactive)
  (moccur-word-all-buffers
   "\\<\\([Tt][Oo][Dd][Oo]\\|[Bb][Uu][Gg]\\)\\>"))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun switch-to-other-buffer ()
  "Switch to (other-buffer)."
  (interactive)
  (switch-to-buffer (other-buffer)))
(defadvice switch-to-other-buffer (after pulse-advice activate)
  "After switch-to-other-buffer, pulse the line the cursor lands on."
  (when (and (boundp 'pulse-command-advice-flag) pulse-command-advice-flag
             (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun mark-current-line ()
  "Put point at beginning of this line, mark at end."
  (interactive)
  (move-beginning-of-line 1)
  (set-mark (point))
  (move-end-of-line 1))

;;-------------------------------------------------------------------------------

;;;###autoload
(defun mark-current-line-mouse (ev)
  "Mark current line with a mouse click. EV is the mouse event."
  (interactive "e")
  (mouse-set-point ev)
  (mark-current-line))

;;-------------------------------------------------------------------------------

;; ;;;###autoload
;; (defun goto-match-paren (arg)
;; "Go to the matching parenthesis if on parenthesis, otherwise insert %.
;; vi style of % jumping to matching brace."
;; (interactive "p")
;; (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;; ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;; (t (self-insert-command (or arg 1)))))

;;-------------------------------------------------------------------------------

;;;###autoload
;; (defun goto-match-paren (arg)
(defun goto-paren (arg)
  "Go to the matching if on (){}[], similar to vi style of % "
  (interactive "p")
  ;; first, check for "outside of bracket" positions expected by forward-sexp, etc.
  (cond ((looking-at "[\[\(\{]") (forward-sexp))
        ((looking-back "[\]\)\}]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{]" 1) (backward-char) (forward-sexp))
        (t nil)))

;;-------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;* From pluskid (星黎殿)
;; REF: http://lifegoo.pluskid.org/wiki/index.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
                  (buffer-substring-no-properties (region-beginning) (region-end))
				(current-word nil t))))
    (setq word (read-string (format "Search the dictionary for (default %s): " word)
                            nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" "sdcv" "-n" word)))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (setq kid-sdcv-window-configuration (current-window-configuration))
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
             (local-set-key (kbd "q") (lambda ()
                                        (interactive)
                                        (bury-buffer)
                                        (unless (null (cdr (window-list))) ; only one window
                                          (delete-window)))))
           (goto-char (point-min))))))))

(provide 'xy-edit-tools)

;;; xy-edit-tools.el ends here
