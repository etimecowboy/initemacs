;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auctex.el'
;; Time-stamp:<2012-01-10 Tue 06:36 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `auctex' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; NOTE:
;; GNU Emacs `url.el' and auctex's `style/url.el' have the same name.
;; You MUST NOT put auctex's `style/url.el' in a load-path.

;;;###autoload
(defun xy/auctex-start ()
  "Settings of `auctex'."
  (interactive)
  (load "auctex.el" nil t t)
  (load "preview-latex.el" nil t t)
  (revert-buffer)
  (menu-bar-mode 1))

;;;###autoload
(defun auctex-settings ()
  "Settings of `auctex'."
  (require 'tex-site)
  (require 'font-latex)
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-electric-escape t
        TeX-auto-untabify t
        TeX-show-compilation nil
        TeX-save-query nil
        tex-source-specials-mode t
        LaTeX-math-mode nil
        TeX-fold-mode t
        TeX-PDF-mode  nil
        TeX-newline-function 'newline-and-indent)
  (setq-default TeX-master nil)  ;; project support

  ;; (require 'tex-mik) ;; Windows下使用 miktex
  ;; (setq TeX-engine 'xetex) ;; set xelatex as default engine.
  ;; NOTE: AUCTeX-11.86: Preview does not work with xelatex

  (setq TeX-command-list
        (quote
         (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t"
           TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode)
           :help "Run plain TeX")
          ("LaTeX" "%`%l%(mode)%' %t"
           TeX-run-TeX nil (latex-mode doctex-mode)
           :help "Run LaTeX")
          ("Makeinfo" "makeinfo %t"
           TeX-run-compile nil (texinfo-mode)
           :help "Run Makeinfo with Info output")
          ("Makeinfo HTML" "makeinfo --html %t"
           TeX-run-compile nil (texinfo-mode)
           :help "Run Makeinfo with HTML output")
          ("Makeindex Nomenclature"
           "makeindex %s.nlo -s nomencl.ist -o %s.nls"
           TeX-run-compile nil t
           :help "Make index for package `nomencl'")
          ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t"
           TeX-run-TeX nil (ams-tex-mode)
           :help "Run AMSTeX")
          ("ConTeXt" "texexec --once --texutil %(execopts)%t"
           TeX-run-TeX nil (context-mode)
           :help "Run ConTeXt once")
          ("ConTeXt Full" "texexec %(execopts)%t"
           TeX-run-TeX nil (context-mode)
           :help "Run ConTeXt until completion")
          ("BibTeX" "bibtex %s"
           TeX-run-BibTeX nil t
           :help "Run BibTeX")
          ("Dvipdfmx" "dvipdfmx %s"
           TeX-run-command nil t
           :help "Run dvipdfmx")
          ("Dvips" "dvips %s"
           TeX-run-command nil t
           :help "Run dvips")
          ("Ps2pdf" "ps2pdf %s"
           TeX-run-command nil t
           :help "Run ps2pdf")
          ("Acrobat Reader" "acroread \"%s.pdf\""
           TeX-run-command nil t
           :help "Run Acrobat Reader")
          ("View" "%V"
           TeX-run-discard-or-function t t
           :help "Run Viewer")
          ("Print" "%p"
           TeX-run-command t t
           :help "Print the file")
          ("Queue" "%q"
           TeX-run-background nil t
           :help "View the printer queue"
           :visible TeX-queue-command)
          ("File" "%(o?)dvips %d -o %f "
           TeX-run-command t t
           :help "Generate PostScript file")
          ("Index" "makeindex %s"
           TeX-run-command nil t
           :help "Create index file")
          ("Check" "lacheck %s"
           TeX-run-compile nil (latex-mode)
           :help "Check LaTeX file for correctness")
          ("Spell" "(TeX-ispell-document \"\")"
           TeX-run-function nil t
           :help "Spell-check the document")
          ("Clean" "TeX-clean"
           TeX-run-function nil t
           :help "Delete generated intermediate files")
          ("Clean All" "(TeX-clean t)"
           TeX-run-function nil t
           :help "Delete generated intermediate and output files")
          ("Other" ""
           TeX-run-command t t
           :help "Run an arbitrary command"))))

  (require 'reftex)
  (require 'cdlatex)
  (require 'wysiwyg-tex) ;; BUG: not working properly

  (add-hook 'LaTeX-mode-hook
            '(lambda ()
               (turn-on-auto-fill)
               (flyspell-mode 1)
               (outline-minor-mode 1)
               (turn-on-reftex)
               (turn-on-cdlatex)
               (autopair-mode -1)
               (local-set-key "\C-c\C-t" ; Displays a page around cursor.
                              'wysiwyg-tex-show-preview)
               ;; (local-set-key "\C-c\C-T" ; Displays the whole page.
                              ;; 'wysiwyg-tex-show-whole-preview)
               ))

  (message "* ---[ auctex configuration is complete ]---"))

;;;###autoload
(defun preview-latex-settings ()
  "Settings of `preview-latex'."
  (require 'preview)
  ;; preview-latex, preview latex output in Emacs
  (LaTeX-preview-setup)
  ;; Picture scale
  (setq preview-scale-function 1.5)
  (message "* ---[ preview-latex configuration is complete ]---"))

(provide 'xy-rc-auctex)
