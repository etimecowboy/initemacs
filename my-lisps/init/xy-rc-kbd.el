;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-kbd.el'
;; Time-stamp:<2011-12-08 Thu 10:58 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My key bindings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;====================================================================
;;* F-keys


;;* Pint moving related, faster = better
(eal-define-keys-commonly
 global-map
 `(;; `windmove.el'
   ;; ("M-c j" windmove-left)
   ;; ("M-c l" windmove-right)
   ;; ("M-c i" windmove-up)
   ;; ("M-c k" windmove-down)
   ;; `fit-frame'
   ;; (global-set-key (kbd "S-<f5>") 'xy/fit-frame)
   ;; (global-set-key (kbd "C-c <f5>") 'revert-buffer)
   ))


;; 参照 ahei 的设置
;; (apply-args-list-to-fun
;;  'def-action-on-area-command
;;  `((copy-function        'copy-region   'mark-function     "Copy function.")
;;    (kill-function        'kill-region   'mark-function     "Kill function.")
;;    (indent-function      'indent-region 'mark-function     "Indent function.")
;;    (indent-paragraph     'indent-region 'mark-paragraph    "Indent paragraph.")
;;    (copy-whole-buffer    'copy-region   'mark-whole-buffer "Copy whole buffer.")
;;    (kill-whole-buffer    'kill-region   'mark-whole-buffer "Kill whole buffer.")
;;    (indent-whole-buffer  'indent-region 'mark-whole-buffer "Indent whole buffer.")))

;; (eal-define-keys
;;  (append
;;   makefile-mode-map-list
;;   `(c-mode-base-map emacs-lisp-mode-map lisp-interaction-mode-map
;;     conf-javaprop-mode-map html-mode-map tcl-mode-map
;;     autoconf-mode-map perl-mode-map nxml-mode-map python-mode-map))
;;  `(("C-c C-c" comment)))

(eal-define-keys-commonly
 global-map
 `(
   ;;    ("M-k" kill-whole-paragraph)
   ;;    ("M-C-k" kill-paragraph)
   ;;    ("M-C" copy-whole-paragraph)
   ;;    ("C-x c" copy-whole-buffer)
   ;;    ("C-x C" kill-whole-buffer)
   ;;    ("M-W" which-copy)
   ;;    ("M-w" smart-copy)
   ;;    ("C-x M-w" insert-cur-line)
   ;;    ("C-x M-W" insert-cur-sexp)
   ("C-M-w"               copy-sentence)
   ;;    ;; 删除整行
   ;;    ("M-K" kill-line)
   ;;    ("C-k" smart-kill)
   ;;    ("C-\\" delete-indentation)
   ;; ("C-x M-m"             mark-invisible-region)
   ("M-U"                 del-to-begin)
   ("C-^"                 case-trans)
   ;;    ("C-6" case-trans)
   ("C-w"                 backward-kill-word-or-kill-region)
   ;;    ("C-x S" mark-whole-sexp)
   ;;    ("C-x W" kill-whole-sexp)
   ;;    ("C-x w" copy-sexp)
   ("M-d"                 my-kill-word)
   ;;    ("C-x TAB" indent-whole-buffer)
   ;;    ("C-h" c-electric-backspace-kill)
   ;;    ("M-m" beginning-of-line-text)
   ("C-M-\\"              smart-indent)
   ("M-q"                 fill-paragraph)
   ("<escape> SPC"        just-one-space)
   ("C-a"                 smart-home)
   ("C-M-a"               mark-whole-buffer)
   ("C-k"                 kill-and-join-forward)
   ("C-M-6"               jlh-join-lines)
   ("C-]"                 goto-paren)
   ("C-M-]"               ywb-indent-accoding-to-paren)
   ("C-c F f"             iy-go-to-char)
   ("C-c F b"             iy-go-to-char-backward)
   ("M-,"                 recent-jump-small-backward)
   ("M-."                 recent-jump-small-forward)
   ("C-x M-s"             isearch-forward-cur-word)
   ("C-'"                 wcy-mark-some-thing-at-point)
   ("C-x \\"              rm-mark-command)
   ;; ("M-w"                 copy-region)
   ("M-|"                 ywb-hippie-expand-filename)
   ("C-x M-M"             switch-major-mode)
   ("M-;"                 qiang-comment-dwim-line)
   ("M-k"                 qiang-copy-line)
   ;; Meteor Liu's functions
   ("C-S-n"               move-line-down)
   ("C-S-p"               move-line-up)
   ("C-c C-x f"           format-region)
   ("C-c C-x F"           format-cxx-file)
   ;; ("M-S-<f7>"         moccur-word-all-buffers)
   ("C-x M-l"             mark-current-line)
   ))

;;====================================================================
;;* Global keybindings for visiting some files/directory

(eal-define-keys-commonly
 global-map
 `(("C-x G r" load-dot-emacs-file)
   ("C-x G i" open-init-dot-el-file)))

(eal-define-keys-commonly
 global-map
 `(("C-x G l" goto-my-local-lisp-dir)
   ("C-x G m" goto-my-own-lisp-dir)
   ("C-x G e" goto-my-emacs-dir)
   ("C-x G h" goto-my-home-dir)
   ("C-x G o" goto-my-org-source-dir)
   ("C-x G t" goto-my-org-latex-dir)))




(provide 'xy-rc-kbd)
