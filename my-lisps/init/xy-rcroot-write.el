;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-write.el'
;; Time-stamp:<2011-12-29 Thu 05:12 xin on P6T-WIN7>
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

;;====================================================================
;;* muse
;; (eval-after-load "muse-mode" '(muse-settings))

;;====================================================================
;;* org
(add-to-list 'auto-mode-alist
             '("\\.\\(org\\|org_archive\\)$" . org-mode))
(eval-after-load "org"
  '(progn
     (org-settings)
     (eal-define-keys
      'org-mode-map
      `(("C-c C-x C-h" xy/org-html-chinese-no-extra-space)
        ("C-c o m"     org2blog/wp-mode)
        ("C-c o l"     org2blog/wp-login)))))
(eval-after-load "org-agenda" '(org-settings))
(eval-after-load "org-capture" '(org-settings))
(eal-define-keys-commonly
 global-map
 `(("C-c l"   org-store-link)
   ("C-c a"   org-agenda)
   ("C-c b"   org-ido-switchb)
   ("C-c c"   org-capture)
   ("C-c n"   org2blog/wp-new-entry)
   ("C-c M-w" tzz-copy-region-with-mode-property)))

;;====================================================================
;;* auctex
(eval-after-load "auctex"
  '(progn
     (auctex-settings)
     (eal-define-keys
      'latex-mode-map
      `(("M-c `" TeX-next-error)))
     )) ;; default C-c ` conflict with icy-mode
(eval-after-load "preview-latex" '(preview-latex-settings))
(global-set-key (kbd "<f6> t") 'xy/auctex-start)

;;--------------------------------------------------------------------
;;** reftex
;; reference
(eval-after-load "reftex" '(reftex-settings))
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" t)
(autoload 'reftex-citation "reftex-cite" "Make citation" t)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

;;--------------------------------------------------------------------
;;** cdlatex, tex writing tools
;; (eval-after-load "cdlatex" 'cdlatex-settings))
;;(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
;;(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

;;====================================================================
;;* txt2tags
;; convert plain text files to various formats
(setq auto-mode-alist
      (append (list '("\\.t2t$" . t2t-mode))
              (if (boundp 'auto-mode-alist) auto-mode-alist)))
(autoload  't2t-mode "txt2tags-mode" "Txt2tags Mode" t)

;;====================================================================
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

(provide 'xy-rcroot-write)
