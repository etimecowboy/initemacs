;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-complete.el'
;; Time-stamp:<2011-01-30 Sun 17:56 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Various abbrevations and auto-completion
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; ido: interactively do things with buffers and files
;; From Emacs-22 it is a part of Emacs, so use ido instead of iswithb

;; (if is-before-emacs-21
;;     (require 'ido "ido-for-21"))

;; (ido-mode 1)

;; (global-set-key (kbd "C-x C-f") 'ido-find-file)

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
;;    ("C-v"   ido-enter-svn-status-hide)
;;    ("C-n"   ido-next-match)
;;    ("C-p"   ido-prev-match)))

;; (eval-after-load 'ido
;;   `(progn 
;;      (ido-face-settings)
;;      (ido-settings)))

;;-------------------------------------------------------------------

;; icomplete settings: minibuffer中输入部分命令就可以使用补全
;; Provides an incremental MiniBuffer Completion preview: 
;; As you type in the minibuffer, a list of matching commands 
;; is echoed there so you can see how to complete a command.

;; (define-key minibuffer-local-completion-map 
;;   (kbd "SPC") 'minibuffer-complete-word)

;; (icomplete-mode 1)

;; (eval-after-load "icomplete"
;;   `(icomplete-settings))

;; (eval-after-load 'my-icomplete+
;;   `(icomplete+-face-settings))

;; completion-list-mode settings

;; (eal-define-keys
;;  'completion-list-mode-map
;;  `(("SPC" scroll-up)
;;    ("u"   scroll-down)
;;    ("n"   next-completion)
;;    ("p"   previous-completion)
;;    ("<"   beginning-of-buffer)
;;    (">"   end-of-buffer)
;;    ("."   set-mark-command)
;;    ("'"   switch-to-other-buffer)
;;    ("L"   count-brf-lines)))

;;--------------------------------------------------------------------


;; anything: narrowing and selecting candidates then executing action 
;; for selected candidates.

;; (try-require 'anything)
;; (try-require 'anything-config)

;; (eval-after-load 'anything
;;   `(anything-settings))

;;-----------------------------------------------------------------------------

;; icicles: Better complete system than ido and icomplete etc

;; (when (try-require 'icicles)
;;   (icy-mode 1))

(require 'icicles)
(icy-mode 1)

(defun icicle-keys ()
  "icicle-mode的按键设置."
  (define-key minibuffer-local-completion-map 
    (kbd "SPC") 'minibuffer-complete-word)
  (define-key minibuffer-local-completion-map 
    (kbd "C-w") 'backward-kill-word-or-kill-region))

(add-hook 'icicle-mode-hook 'icicle-keys t)

(eval-after-load "icicles" `(icicles-settings))

;;----------------------------------------------------------------------------------

;; appropos mode (with icicles?) completion

;; (eal-define-keys
;;  'apropos-mode-map
;;  `(("u" scroll-down)
;;    ("1" delete-other-windows)
;;    ("n" forward-button)
;;    ("p" backward-button)))

;; ;;;###autoload
;; (defun apropos-face-settings ()
;;   "Face settings for `apropos'."
;;   ;; `apropos-mode'颜色设置
;;   (setq apropos-match-face 'red-face)
;;   (setq apropos-symbol-face 'magenta-face)
;;   (setq apropos-keybinding-face 'cyan-face)
;;   (setq apropos-label-face 'underline-green-face)
;;   (setq apropos-property-face 'font-yellow-face))

;; (eval-after-load "apropos" `(apropos-face-settings))

;;---------------------------------------------------------------------------------

;; DoReMi settings

;; ;;;###autoload
;; (defun doremi-settings ()
;;   "settings of `doremi'."
;;   (setq doremi-up-keys   '(?\M-p ?p ?k))
;;   (setq doremi-down-keys '(?\M-n ?n ?j ?\ ))

;;   (setq doremi-RGB-increment-factor 256))

;; (eval-after-load "icicles" `(doremi-settings))

;;---------------------------------------------------------------------------------

;; 简写模式
(setq-default abbrev-mode 1)
(setq save-abbrevs nil)

;;---------------------------------------------------------------------------------

;; hippie-expand settings

(global-set-key (kbd "M-/") 'hippie-expand)

(eval-after-load "hippie-exp"
  `(hippie-expand-settings))

;;---------------------------------------------------------------------------------

;; auto-complete settings

;; (when (try-require 'auto-complete-config)
;;   (when (try-require 'auto-complete+)

;;     ;; After do this, isearch any string, M-: (match-data) always
;;     ;; return the list whose elements is integer
;;     (global-auto-complete-mode 1)))

(require 'auto-complete-config)
(require 'auto-complete+)
(global-auto-complete-mode 1)

;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
(eal-define-keys
 'ac-complete-mode-map
 `(("<return>"   nil)
   ("RET"        nil)
   ("M-j"        ac-complete)
   ;; ("<C-return>" ac-complete)
   ("M-n"        ac-next)
   ("M-p"        ac-previous)
   ))

(eval-after-load "auto-complete"
  '(auto-complete-settings))

(eval-after-load "cc-mode"
  '(ac-settings-4-cc))

(eval-after-load "autopair"
  '(ac-settings-4-autopair))

(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
   svn-log-edit-mode-hook change-log-mode-hook)
 'ac-settings-4-lisp)

(apply-args-list-to-fun
 (lambda (hook fun)
   (am-add-hooks hook fun))
 `(('java-mode-hook   'ac-settings-4-java)
   ('c-mode-hook      'ac-settings-4-c)
   ('c++-mode-hook    'ac-settings-4-cpp)
   ('text-mode-hook   'ac-settings-4-text)
   ('org-mode-hook    'ac-settings-4-org)
   ('eshell-mode-hook 'ac-settings-4-eshell)
   ;; ('ruby-mode-hook   'ac-settings-4-ruby)
   ;; ('html-mode-hook   'ac-settings-4-html)
   ;; ('awk-mode-hook    'ac-settings-4-awk)
   ;; ('tcl-mode-hook    'ac-settings-4-tcl)
))

(eal-eval-by-modes
 ac-modes
 (lambda (mode)
   (let ((mode-name (symbol-name mode)))
     (when (and (intern-soft mode-name) 
                (intern-soft (concat mode-name "-map")))
       (define-key (symbol-value (am-intern mode-name "-map")) 
         (kbd "C-c A") 'ac-start)))))

;;-------------------------------------------------------------------

;; company settings: complete anything.
;; It is a modular in-buffer completion mechanism.

;; (require 'company)

;; (setq company-idle-delay 0.2)
;; (setq company-minimum-prefix-length 1)
;; (setq company-begin-commands '(self-insert-command))
;; (define-key company-mode-map (kbd "M-RET") 'company-expand-top)

;; (am-add-hooks
;;  `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook
;;                       java-mode-hook lisp-interaction-mode-hook sh-mode-hook
;;                       ,(if (not is-before-emacs-21) 'awk-mode-hook)
;;                       ruby-mode-hook)
;;  'company-mode)

;;--------------------------------------------------------------------

;; template settings

;; (require 'template)

;; (eal-define-keys
;;  '(emacs-lisp-mode-map c-mode-base-map makefile-mode-map makefile-automake-mode-map
;;                        sh-mode-map text-mode-map)
;;  `(("C-c T" my-template-expand-template)
;;    ("C-c C-t" template-expand-template)))

;; ;;;###autoload
;; (defun template-settings ()
;;   "settings for `template'."
;;   (setq template-default-directories (list (concat my-emacs-path "/template/templates")))

;;   (defvar last-template nil "Last used template file")

;;   (defun my-template-expand-template (template)
;;     "Expand template file"
;;     (interactive
;;      (list
;;       (read-file-name
;;        (if last-template (format "Please select template file (default is %s): " last-template) "Please select template file: ")
;;        (concat my-emacs-path "/template/templates") last-template t)))
;;     (template-expand-template template)
;;     (setq last-template template)))

;; (eval-after-load "template" `(template-settings))

;; (template-initialize)

;;-------------------------------

;; auto-insert: 用template, 自动插入一些文件模板

;; (auto-insert-mode 1)

;; ;;;###autoload
;; (defun auto-insert-settings ()
;;   "Settings for `auto-insert'."
;;   (setq auto-insert-query nil)
;;   (setq auto-insert-directory ;; my-emacs-templates-path)
;;         (list (concat my-emacs-path "/template/templates"))) 
;;           ;; (concat (my-emacs-path "/template/templates")))
;;   (define-auto-insert "build.properties" "build.properties.tpl")

;;   (defun expand-template (template)
;;     "Expand template."
;;     (template-expand-template ;; (concat my-emacs-templates-path template)))
;;             (concat (my-emacs-path "template/templates/temp"))))
;;   ;; (define-auto-insert
;;   ;;   '("\\.\\([Hh]\\|hh\\|hxx\\|hpp\\)$" . "C/C++ header")
;;   ;;   (lambda ()
;;   ;;     (expand-template "h.tpl")))
;;   ;; (define-auto-insert
;;   ;;   '("\\.c$" . "C")
;;   ;;   (lambda ()
;;   ;;     (expand-template "c.tpl")))
;;   ;; (define-auto-insert
;;   ;;   '("\\.cpp$" . "Cpp")
;;   ;;   (lambda ()
;;   ;;     (expand-template "cpp.tpl")))

;;   (defun insert-headx-snippet ()
;;     "Insert headx snippet."
;;     (insert-snippet "headx"))

;;   (defun insert-abbrev (abbrev-name)
;;     "Insert abbrev ABBREV-NAME"
;;     (interactive "s")
;;     (insert abbrev-name)
;;     (expand-abbrev))

;;   (defun insert-snippet (snippet)
;;     "Insert snippet SNIPPET."
;;     (interactive "s")
;;     (insert snippet)
;;     (yas/expand))

;;   (mapc
;;    (lambda (suffix)
;;      (define-auto-insert (concat "\\." suffix "$") 'insert-headx-snippet))
;;    '("el" "sh" "org" "pl" "py" "htm\\(l\\)?")))

;; (eval-after-load "autoinsert"
;;   `(auto-insert-settings))

;;--------------------------------------------------------------------

;; 超强的snippet

;; (when (try-require 'yasnippet)
;;   (yas/global-mode 1))

(require 'yasnippet)
(yas/global-mode 1)

;; (eal-define-keys
;;  'yas/keymap
;;  `(("M-j"     yas/next-field-or-maybe-expand)
;;    ("M-k"     yas/prev-field)))

;; (eal-define-keys
;;  'yas/minor-mode-map
;;  `(("C-c C-f" yas/find-snippets)))

(eval-after-load "yasnippet"
  `(yasnippet-settings))

;;------------------------------------------------------------------------

(provide 'xy-rcroot-complete)
