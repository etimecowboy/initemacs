;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-enhance.el'
;; Time-stamp:<2011-12-16 Fri 10:34 xin on P6T-WIN7>
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

(require 'cl)
(require 'xy-rc-utils)

;;====================================================================
;;* Emacs build-in functions

;;** Enable some hidden functions
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(global-subword-mode 1) ;; subword
(when is-after-emacs-23 ;; Move deleted files to system trash
  (setq delete-by-moving-to-trash t))
(auto-compression-mode 1) ;; put in front of `session.el'
(setq kill-do-not-save-duplicates t) ;; Do not save same cut
(setq kill-ring-max 500) ;; Set a large kill ring
(setq save-interprogram-paste-before-kill t) ;; Save paster

;;--------------------------------------------------------------------
;;** ffap, finding Files and URLs at point
;; REF: (@url :file-name "http://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html#index-ffap-3860" :display "emacs manual")
(eval-after-load "ffap" '(ffap-settings))
(ffap-bindings) ;; BUG: conflict with `ido.el' C-x C-f, can be fixed
                ;;      by (setq ffap-require-prefix t)
                ;;      (Has been added to `ffap-settings')

;;--------------------------------------------------------------------
;;** linum
(eval-after-load 'linum '(linum-settings))
(am-add-hooks
 `(find-file-hook
   log-view-mode-hook chart-mode-hook
   hs-hide-hook
   svn-log-edit-mode-hook package-menu-mode-hook
   apropos-mode-hook svn-log-view-mode-hook
   diff-mode-hook emacs-lisp-mode-hook html-mode-hook
   data-debug-hook debugger-mode-hook
   semantic-symref-results-mode-hook sh-mode-hook
   matlab-mode-hook matlab-shell-mode-hook)
 '(lambda()
    (unless (or (eq major-mode 'image-mode)
                (eq major-mode 'org-mode)
                (eq major-mode 'custom-mode)
                (eq major-mode 'lisp-interaction-mode)
                (eq major-mode 'fundamental-mode)
                (eq major-mode 'text-mode)
                (eq major-mode 'LaTeX-mode)
                (eq major-mode 'latex-mode)
                (eq major-mode 'TeX-mode)
                (eq major-mode 'tex-mode))
      (linum-mode 1))))

;;--------------------------------------------------------------------
;;** time-stamp
;; maintain last change time stamps
;; (`Time-stamp:<>' occurring within the first 8 lines)
;; in files edited by Emacs
(eval-after-load "time-stamp" '(time-stamp-settings))
(add-hook 'write-file-hooks 'time-stamp)

;;** ispell
;; 其他拼写检查的基础
(eval-after-load "ispell" '(ispell-settings))

;;--------------------------------------------------------------------
;;** flyspell
(eval-after-load 'flyspell '(flyspell-settings))
(am-add-hooks
 `(text-mode-hook org-mode-hook latex-mode-hook
   message-mode-hook mew-draft-mode-hook)
 '(lambda ()
    (flyspell-mode 1)))

;;--------------------------------------------------------------------
;;** Calendar
;; Emacs 中有日历，而且可以称之为一个系统，因为其中除了最常用的日历之外，
;; 还有其他的近十种历法，其中有日记、约会提醒、纪念日提示以及节假日提示等
;; 等。其中的历法包括中国的农历、希伯来历、伊斯兰历、法国革命历、中美玛雅
;; 历等等，可以根据经纬度告知你的所在的每天日出日落的时间等等。
;;
;; holiday-fixed m d    固定阳历节日， m 月 d 日
;; holiday-float m w n 浮动阳历节日， m 月的第 n 个星期 w%7
;;
;; ----------------------------------------------
;; .    跳回当前天
;; o    跳到某一个月
;; g d    跳到某年某月某日
;; g c    跳到某年某星期的星期几
;; g C    跳到阴历的某一天
;; p C    显示当前的阴历日期
;; h    显示当前节日
;; i d    加入当前这一天的日程安排
;; i w    加入每周这一天的日程安排
;; i m    加入每月这一天的日程安排
;; i y    加入每年这一天的日程安排
;; i a    加入周年纪念（anniversary），比如生日等
;; d    察看当前日期的diary
;; -----------------------------------------------
(eval-after-load "calendar" '(calendar-settings))
(eval-after-load "diary-lib" '(diary-settings))
(eval-after-load "appt" '(appt-settings))

;;--------------------------------------------------------------------
;;** tramp
;; 以另一用户编辑文件, 或者编辑远程主机文件
(eval-after-load "tramp" '(tramp-settings))
(GNULinux
 (global-set-key (kbd "C-c C-R") 'sudo-edit-current-file))

;;--------------------------------------------------------------------
;;** term-mode
(eval-after-load "term" '(term-settings))

;;--------------------------------------------------------------------
;;** Shell/eshell-mode
;;(define-key shell-mode-map "\M-m" 'shell-add-to-history)
;; Backgrounding a process in shell mode
;; You might find it difficult to background
;; a process that’s started, once you’re in shell mode.
;; If you hit ‘C-z’, you end up backgrounding Emacs!
;; To solve this, just execute
;;  M-x local-set-key RET C-z self-insert-command
;; And if you want to background Emacs, just go to a different buffer.
;; ‘C-q C-z’ doesn’t work? - No, but C-c C-z should.
(global-set-key (kbd "S-<f9>") 'shell)
(global-set-key (kbd "C-<f9>") 'eshell)

;;====================================================================
;;* undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)

;;====================================================================
;;* list-processes+
;; 查看Emacs内进程
(autoload 'list-processes+ "list-processes+"
  "Enhanced `list-processes'" t)

;;====================================================================
;;* command-frequence
;; 统计命令使用频率
;; (autoload 'command-frequence "command-frequence"
;;   "Emacs command frequence statistics" t)

;;====================================================================
;;* todochiku
;; notification tool.
;; It started life interfacing with Growl (OS X, http://growl.info/),
;; Snarl (Win 32, http://www.fullphat.net/) and libnotify (linux/unix).
;; It can also do standard messages (in the minibuffer) and pop up a
;;tooltip.
(eval-after-load "todochiku" '(todochiku-settings))

;;====================================================================
;;* browse-kill-ring
(eval-after-load "browse-kill-ring"
  '(progn
     (browse-kill-ring-settings)
     (browse-kill-ring-face-settings)
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
        ("o"   other-window)))))
(global-set-key (kbd "C-=") 'browse-kill-ring)

;;====================================================================
;;* kill-ring-search
;; Search the kill ring in the minibuffer.
;; (autoload 'kill-ring-search "kill-ring-search"
;;  "Search the kill ring in the minibuffer."
;;  (interactive))
(global-set-key (kbd "C-M-y") 'kill-ring-search)

;;====================================================================
;;* copyright
;; (GNUEmacs
;;  ;; update the copyright notice in current buffer
;;  (when (try-require 'copyright)
;;            ; XXX Check no other copyright.el gets in the way
;;    (add-hook 'write-file-hooks 'copyright-update)))

;;====================================================================
;;* Hanconvert
;; 自动在简体中文和繁体中文间转换.
(autoload 'hanconvert-region "hanconvert"
  "Convert a region from simple chinese to tradition chinese or
from tradition chinese to simple chinese" t)

;;====================================================================
;;* htmlize
;; 把文件或buffer彩色输出成html
(eval-after-load "htmlize" '(htmlize-settings))

;;====================================================================
;;* inkd
;; 在各种 text 文档间提供链接
(autoload 'linkd-mode "linkd" nil t)
(eval-after-load "linkd"
  '(progn
     (linkd-settings)
     (eal-define-keys
      'linkd-overlay-map
      `(("n"        linkd-next-link)
        ("p"        linkd-previous-link)
        ("<return>" linkd-follow-at-point)
        ("e"        linkd-edit-link-at-point)))
     (eal-define-keys
      'linkd-map
      `(("<mouse-4>" nil)
        ("C-c ," nil)))
     (eal-define-keys-commonly
      global-map
      `(("C-x L t" linkd-insert-tag)
        ("C-x L s" linkd-insert-star)
        ("C-x L l" linkd-insert-link)))))
;; NOTE: Manually start it when required
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook
   c-mode-hook c++-mode-hook cc-mode-hook
   sh-mode-hook vhdl-mode-hook
   verilog-mode-hook ;; org-mode-hook
   LaTeX-mode-hook
   matlab-mode-hook)
 '(lambda () (linkd-mode 1)))

;;====================================================================
;;* ascii
;; ascii表查询
;; (autoload 'ascii-on        "ascii"
;;   "Turn on ASCII code display."   t)
;; (autoload 'ascii-off       "ascii"
;;   "Turn off ASCII code display."  t)
;; (autoload 'ascii-display   "ascii"
;;   "Toggle ASCII code display."    t)
;; (autoload 'ascii-customize "ascii"
;;   "Customize ASCII code display." t)


;;====================================================================
;;* multi-term
;; a mode based on term.el, for managing multiple terminal buffers
(autoload 'multi-term "multi-term" nil t)
(eval-after-load "multi-term"
  '(progn
     (multi-term-settings)
     (eal-define-keys-commonly
      global-map
      `(("C-c T n" multi-term-next)
        ("C-c T p" multi-term-prev)))))
     ;; (eal-define-keys
     ;;  'text-mode-map
     ;;  `(("M-J"   switch-term-and-text)
     ;;    ("M-L"   enter-term-mode)))))
(global-set-key (kbd "C-x T") 'multi-term)

;;====================================================================
;;* shell-pop

;; pop up a window for shell
(autoload 'shell-pop "shell-pop" "Pop-up a shell" t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(eval-after-load "shell-pop" '(shell-pop-settings))
(global-set-key (kbd "<f9>") 'shell-pop)

(provide 'xy-rcroot-enhance)
;;* hanspell
(eval-after-load "rw-hunspell" '(rw-hunspell-settings))
(eval-after-load "rw-ispell" '(rw-ispell-settings))
(require 'rw-language-and-country-codes)
(require 'rw-ispell)
(Windows
 (require 'rw-hunspell))

;;====================================================================
;;* wcheck-mode
;; TODO: make wcheck-mode working
;; (eval-after-load "wcheck-mode" '(wcheck-mode-settings))
