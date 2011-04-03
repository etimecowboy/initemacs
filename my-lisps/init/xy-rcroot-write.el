;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-write.el'
;; Time-stamp:<2011-03-21 Mon 16:28 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My writing packages' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;-------------------------------------------------------------------------

;; Muse, Emacs publishing tool
;; (eval-after-load "muse-mode"
;;   `(muse-settings))

;;--------------------------------------------------------------------------

;; Org, Emacs note taking and GTD system
;; (require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)
;; (eal-define-key
;;  'org-mode-map 
;;  `(("C-c )" reftex-citation)))
(eval-after-load "org"
  `(org-settings))
(eval-after-load "org-agenda"
  `(org-settings))

;;------------------------------------------------------------------------

;; Auctex, TeX writing IDE
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
;; (add-hook 'LaTeX-mode-hook 'auctex-start)
;; (add-to-list 'auto-mode-alist '("\\.tex$" . latex-mode))
(eval-after-load "latex"
  '(progn
	 (auctex-settings)
	 (eal-define-keys
	  'LaTeX-mode-map
	  `(("M-c `" TeX-next-error))))) ;; C-c ` conflict with icy-mode 

;; reftex, reference
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" t)
(autoload 'reftex-citation "reftex-cite" "Make citation" t)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(eval-after-load "reftex"
  `(reftex-settings))
;; (eval-after-load "reftex-mode"
;;   `(reftex-settings))

;; cdlatex, tex writing tools
;;(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
;;(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)
;; (eval-after-load "cdlatex"
;;   `(cdlatex-settings))

;;------------------------------------------------------------------------

;; txt2tags mode 
;; convert plain text files to various formats
;; (require 't2t-mode)
(setq auto-mode-alist 
      (append (list '("\\.t2t$" . t2t-mode))
              (if (boundp 'auto-mode-alist) auto-mode-alist)))
(autoload  't2t-mode "txt2tags-mode" "Txt2tags Mode" t)
(provide 'xy-rcroot-write)
