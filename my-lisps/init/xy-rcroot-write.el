;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-write.el'
;; Time-stamp:<2011-11-26 Sat 15:29 xin on P6T-WIN7>
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

;;* muse
;; Emacs publishing tool
;; (eval-after-load "muse-mode"
;;   `(muse-settings))

;;--------------------------------------------------------------------------

;;* org
;; Emacs note taking and GTD system
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
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

;;* auctex
;; TeX writing IDE
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

;;** reftex
;; reference
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" t)
(autoload 'reftex-citation "reftex-cite" "Make citation" t)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(eval-after-load "reftex"
  `(reftex-settings))
;; (eval-after-load "reftex-mode"
;;   `(reftex-settings))

;;** cdlatex, tex writing tools
;;(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
;;(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)
;; (eval-after-load "cdlatex"
;;   `(cdlatex-settings))

;;------------------------------------------------------------------------

;;* txt2tags
;; convert plain text files to various formats
;; (require 't2t-mode)
(setq auto-mode-alist
      (append (list '("\\.t2t$" . t2t-mode))
              (if (boundp 'auto-mode-alist) auto-mode-alist)))
(autoload  't2t-mode "txt2tags-mode" "Txt2tags Mode" t)
(provide 'xy-rcroot-write)

;;------------------------------------------------------------------------

;;* pdftools
;; Save current buffer as a pdf file
;; Should be used with `ps2pdf', which usually comes with a tex
;; distribution
(autoload 'pdf-save-buffer "pdftools.el"
  "Save buffer as a pdf file." t)
(autoload 'pdf-save-buffer-with-faces "pdftools.el"
  "Save buffer as a pdf file with faces." t)
(autoload 'pdf-save-region "pdftools.el"
  "Save region as a pdf file." t)
(autoload 'pdf-save-region-with-faces "pdftools.el"
  "Save region as a pdf file with faces." t)

;;-----------------------------------------------------------------------
