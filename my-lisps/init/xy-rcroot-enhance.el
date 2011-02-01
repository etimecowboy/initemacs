;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-enhance.el'
;; Time-stamp:<2011-01-31 Mon 12:13 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Basic enhancements
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; Emacs找不到合适的模式时，缺省使用text-mode
(setq default-major-mode 'text-mode)

;; emacs lock
(autoload 'toggle-emacs-lock "emacs-lock" "Emacs lock" t)

;; Enable some hidden functions
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; Do not make backup files 
(setq make-backup-files nil)

;; Winner mode for window splits
(winner-mode 1)

;; Add menu item for emacs-lisp mode
(setq emacs-lisp-mode-hook 'imenu-add-menubar-index)

;; uniquify, 可以为重名的 buffer 在前面加上其父目录的名字来让名字区分开来，
;; 而不是单纯的加一个没有太多意义的序号
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;; (setq uniquify-buffer-name-style 'uniquify))

;;-----------------------------------------------------------------

;; ffap, finding Files and URLs at Point
;; REF: 
;;   http://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html#index-ffap-3860

;; C-x C-f filename <RET>
;; Find filename, guessing a default from text around point (find-file-at-point). 
;; C-x C-r
;; ffap-read-only, analogous to find-file-read-only. 
;; C-x C-v
;; ffap-alternate-file, analogous to find-alternate-file. 
;; C-x d directory <RET>
;; Start Dired on directory, defaulting to the directory name at point (dired-at-point). 
;; C-x C-d
;; ffap-list-directory, analogous to list-directory. 
;; C-x 4 f
;; ffap-other-window, analogous to find-file-other-window. 
;; C-x 4 r
;; ffap-read-only-other-window, analogous to find-file-read-only-other-window. 
;; C-x 4 d
;; ffap-dired-other-window, analogous to dired-other-window. 
;; C-x 5 f
;; ffap-other-frame, analogous to find-file-other-frame. 
;; C-x 5 r
;; ffap-read-only-other-frame, analogous to find-file-read-only-other-frame. 
;; C-x 5 d
;; ffap-dired-other-frame, analogous to dired-other-frame. 
;; M-x ffap-next
;; Search buffer for next file name or URL, then find that file or URL. 
;; S-Mouse-3
;; ffap-at-mouse finds the file guessed from text around the position of a mouse click. 
;; C-S-Mouse-3
;; Display a menu of files and URLs mentioned in current buffer, then find the one you select (ffap-menu).

(ffap-bindings)

;; ;;;###autoload
;; (defun ffap-settings ()
;;   "Settings for `ffap'."
;;   (setq ffap-c-path 
;; 	(append ffap-c-path 
;; 		system-head-file-dir 
;; 		user-head-file-dir)))

;; (eval-after-load "ffap" `(ffap-settings))

;;--------------------------------------------------------------------

;; 打开压缩文件时自动解压缩
;; 必须放在 session 前面
(auto-compression-mode 1)

;;-------------------------------------------------------------------

;; 查看Emacs内进程
;; (autoload 'list-processes+ "list-processes+" 
;;   "Enhanced `list-processes'" t)

;;-------------------------------------------------------------------

;; Kill ring

;; Do not save same cut
(setq kill-do-not-save-duplicates t)

;; Set a large kill ring
(setq kill-ring-max 200)

;; Save paster before kill emacs
(setq save-interprogram-paste-before-kill t)

;; browse-kill-ring，查看循环剪贴板的内容
;; (autoload 'browse-kill-ring "browse-kill-ring" 
;;   "Check contents in the kill ring" t)
(eval-after-load "browse-kill-ring"
  `(progn
     (browse-kill-ring-default-keybindings)
     (browse-kill-ring-settings)
     (browse-kill-ring-face-settings)))

(global-set-key (kbd "C-=") 'browse-kill-ring)

(eal-define-keys
 'browse-kill-ring-mode-map
 `(("RET" browse-kill-ring-insert-and-quit)
   ("<"   beginning-of-buffer)
   (">"   end-of-buffer)
   ("j"   next-line)
   ("k"   previous-line)
   ("h"   backward-char)
   ("l"   forward-char)
   ("n"   browse-kill-ring-forward-without-linum-mode)
   ("p"   browse-kill-ring-previous-without-linum-mode)
   ("SPC" scroll-up)
   ("U"   scroll-down)
   ("u"   View-scroll-half-page-backward)
   ("o"   other-window)))

;;-------------------------------------------------------------------

;; linum-mode settings

(unless is-after-emacs-23
  (require 'linum "linum-for-22"))

(global-set-key [f7] 'linum-mode)

;; (am-add-hooks
;;  `(find-file-hook
;;    help-mode-hook Man-mode-hook log-view-mode-hook chart-mode-hook
;;    compilation-mode-hook gdb-mode-hook lisp-interaction-mode-hook
;;    browse-kill-ring-mode-hook completion-list-mode-hook hs-hide-hook
;;    inferior-ruby-mode-hook custom-mode-hook Info-mode-hook svn-log-edit-mode-hook
;;    package-menu-mode-hook dired-mode-hook apropos-mode-hook svn-log-view-mode-hook
;;    diff-mode-hook emacs-lisp-mode-hook ibuffer-mode-hook html-mode-hook
;;    w3m-mode-hook data-debug-hook debugger-mode-hook text-mode-hook color-theme-mode-hook
;;    semantic-symref-results-mode-hook sh-mode-hook groovy-mode-hook)
;;  (lambda()
;;    (unless (eq major-mode 'image-mode)
;;      (linum-mode 1))))

(eval-after-load 'linum
  `(progn 
     (linum-face-settings)
     (linum-settings)))

;;-----------------------------------------------------------------------

;; Start emacs server
;; Emacs可以做为一个server, 然后用emacsclient连接这个server,
;; 无需再打开两个Emacs

(setq server-auth-dir (concat my-var-path "/server"))

;; Emacs-21 以前的版本要用 gnuserv
(if is-before-emacs-21
    (progn
      ;; gnuserv
      (require 'gnuserv-compat)
      (gnuserv-start)
      ;; 在当前frame打开
      (setq gnuserv-frame (selected-frame))
      ;; 打开后让emacs跳到前面来
      (setenv "GNUSERV_SHOW_EMACS" "1"))
  (if is-after-emacs-23
      (server-force-delete))
  (server-start))

;;-----------------------------------------------------------------------

;; Move deleted files to system trash
;; It seems that this cause error when quiting emacs-23.1
;; in Linux systems --- Org-babel temporary directories cannot
;; be deleted. emacs-23.2 seems OK with this problem, but it works
;; not as expected (move deleted files to system trash).
;; Comment out for comparability. 
;; (setq delete-by-moving-to-trash t)

;;----------------------------------------------------------------------

;; Add time stamp to file

;; maintain last change time stamps (`Time-stamp: <>' occurring within the
;; first 8 lines) in files edited by Emacs

(add-hook 'write-file-hooks 'time-stamp)

(eval-after-load "time-stamp"
  '(progn
     (time-stamp-settings)))

;;----------------------------------------------------------------------

;; Add copyright statment

;; (GNUEmacs
;;  ;; update the copyright notice in current buffer
;;  (when (try-require 'copyright)
;; 	       ; XXX Check no other copyright.el gets in the way
;;    (add-hook 'write-file-hooks 'copyright-update)))


;;----------------------------------------------------------------------

;; Spelling: Use ASpell & flyspell

(setq text-mode-hook 'flyspell-mode)

(eval-after-load 'flyspell
  `(progn
     (flyspell-settings)))

;;----------------------------------------------------------------------

;;; ### Hanconvert ###
;;; --- 自动在简体中文和繁体中文间转换.
;; (autoload 'hanconvert-region "hanconvert"
;;   "Convert a region from simple chinese to tradition chinese or
;; from tradition chinese to simple chinese" t)

;;---------------------------------------------------------------------

;; todochiku:  notification tool,
;; It started life interfacing with Growl (OS X, http://growl.info/), 
;; Snarl (Win 32, http://www.fullphat.net/) and libnotify (linux/unix). 
;; It can also do standard messages (in the minibuffer) and pop up a tooltip.

;; (when (try-require 'todochiku)

;; (setq todochiku-command
;;       (case system-type 
;;         (windows-nt "snarl_command.exe")
;;         (darwin "/usr/local/bin/growlnotify")
;;         (t "/usr/bin/notify-send")))

;; (let ((non-exist (not (file-exists-p todochiku-command))))
;;   (setq todochiku-tooltip-too (and non-exist window-system))
;;   (setq todochiku-message-too (and (or non-exist (not window-system)) (not todochiku-tooltip-too))))

;; (setq todochiku-icons-directory (concat my-local-image-path "/todochiku"))

;; (setq todochiku-timeout 10)

;; (defun todochiku-get-arguments (title message icon)
;;   "Gets todochiku arguments.
;; This would be better done through a customization probably."
;;   (case system-type
;;     ('windows-nt (list "/M" title message icon "/T" (int-to-string todochiku-timeout)))
;;     ('darwin (list title "-m" message "--image" icon ))
;;     (t (list "-i" icon "-t" (int-to-string (* 1000 todochiku-timeout)) title message))))
;;
;; )
;;---------------------------------------------------------------------------------

;; Use grep in Emacs

;; (unless is-before-emacs-21
;;   (eal-define-keys-commonly
;;    global-map
;;    `(("C-x F"   find-grep-in-current-dir)
;;      ("C-x f"   find-grep-in-dir)
;;      ("C-x M-f" find-grep-current-word-in-current-dir)
;;      ("C-x M-F" find-grep-current-word)))
  
;;   (eal-define-keys
;;    'grep-mode-map
;;    `(("q"     bury-buffer)
;;      ("Q"     kill-this-buffer)
;;      ("1"     delete-other-windows)
;;      ("<"     beginning-of-buffer)
;;      (">"     end-of-buffer)
;;      ("'"     switch-to-other-buffer)
;;      ("u"     scroll-down)
;;      ("S-SPC" View-scroll-half-page-backward)
;;      ("SPC"   View-scroll-half-page-forward)
;;      ("/"     describe-symbol-at-point)
;;      ("t"     sb-toggle-keep-buffer)
;;      ("N"     select-buffer-forward)
;;      ("P"     select-buffer-backward)
;;      ("L"     count-brf-lines))))

;; (eval-after-load "grep" `(grep-settings))

;;---------------------------------------------------------------------------------

;; full-ack, grep 纯 perl 代替

;; (require 'full-ack)

;; (eal-define-keys
;;  'ack-mode-map
;;  `(("j"   next-line)
;;    ("k"   previous-line)
;;    ("h"   backward-char)
;;    ("l"   forward-char)
;;    ("u"   View-scroll-half-page-backward)
;;    ("SPC" View-scroll-page-forward)
;;    ("o"   other-window)
;;    ("g"   beginning-of-buffer)
;;    ("G"   end-of-buffer)
;;    (">"   end-of-buffer)
;;    ("<"   beginning-of-buffer)
;;    ("1"   delete-other-windows)
;;    ("'"   switch-to-other-buffer)
;;    ("Q"   kill-this-buffer)))

;; (eval-after-load "full-ack" `(full-ack-settings))

;;---------------------------------------------------------------------------------

;; color-moccur,
;; With color-moccur, you can search a regexp in all buffers. And you
;; can search files like grep(-find) without grep (and find) command.

(require 'color-moccur)

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

;; (eal-define-keys-commonly
;;  'global-map
;;  `(("C-x C-u" occur-by-moccur-displn)
;;    ("C-x M-U" occur-by-moccur-at-point-displn)))
  
(eal-define-keys
 'isearch-mode-map
 `(("M-o" isearch-moccur-displn)))

(eval-after-load "color-moccur"
  `(progn 
     (moccur-face-settings)
     (moccur-settings)))

;;-------------------------------------------------------------------

;; ioccur, incremental occur, more convenient and faster than OccurMode,
;; which lists all lines of the current buffer that match a regexp.

;; (require 'ioccur)

;;---------------------------------------------------------------------------------

;; Calendar

;;----------------------------------------------------------------------------------

;; inkd: 在各种 text 文档间提供链接

(require 'linkd)

(am-add-hooks
 `(test-mode-hook org-mode-hook
   emacs-lisp-mode-hook lisp-interaction-mode-hook
   c-mode-hook c++-mode-hook sh-mode-hook
   vhdl-mode-hook verilog-mode-hook)
 (lambda ()
   (linkd-mode 1)
   (linkd-enable)
   ))

(eval-after-load "linkd"
  `(progn
     (linkd-settings)
     (linkd-face-settings)))

(eal-define-keys
 'linkd-overlay-map
 `(("n"        linkd-next-link)
   ("p"        linkd-previous-link)
   ("<return>" linkd-follow-at-point)))

(eal-define-keys
 'linkd-map
 `(("<mouse-4>" nil)
   ("C-c ," nil)))

;;---------------------------------------------------------------------

;; term mode 
;; (eval-after-load "term" 
;;   `(progn
;;      (term-settings)))

;;--------------------------------------------------------------------

;; multi-term: a mode based on term.el, 
;; for managing multiple terminal buffers in Emacs.
;; (require 'multi-term)
;; (define-key global-map (kbd "C-x e") 'multi-term)
;; ;; (eal-define-keys-commonly
;; ;;  'global-map
;; ;;  `(("C-x n" multi-term-next)
;; ;;    ("C-x p" multi-term-prev)))
;; (eal-define-keys
;;  'text-mode-map
;;  `(("M-J"   switch-term-and-text)
;;    ("M-L"   enter-term-mode)))
;; (eval-after-load "multi-term" 
;;   `(progn
;;      (multi-term-settings)))

;;----------------------------------------------------------------------------

;; My old settings

;; Shell/eshell mode

;;(define-key shell-mode-map "\M-m" 'shell-add-to-history)

;; Backgrounding a process in shell mode
;; You might find it difficult to background 
;; a process that’s started, once you’re in shell mode.
;; If you hit ‘C-z’, you end up backgrounding Emacs!
;; To solve this, just execute
;;  M-x local-set-key RET C-z self-insert-command 
;; And if you want to background Emacs, just go to a different buffer.
;; ‘C-q C-z’ doesn’t work? - No, but C-c C-z should.

;; Pop up a window for shell
(autoload 'shell-pop "shell-pop" "Pop-up a shell" t)

(eval-after-load "shell-pop"
  '(progn
     (sell-pop-settings)))

(global-set-key [f9] 'shell-pop)
(global-set-key [S-f9] 'shell)
(global-set-key [C-f9] 'eshell)

;;----------------------------------------------------------------------

(provide 'xy-rcroot-enhance)
