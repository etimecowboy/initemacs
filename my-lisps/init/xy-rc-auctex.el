;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auctex.el'
;; Time-stamp:<2012-01-02 Mon 23:19 xin on p6t>
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
  ;; (require 'auctex)
  ;; (require 'preview-latex)
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
        TeX-show-compilation t
        TeX-save-query nil
        ;; TeX-newline-function 'newline-and-indent ;;回车时自动缩进
        )
  (setq-default TeX-master nil)  ;; project support

  ;; (setq TeX-engine 'xetex) ;; set xelatex as default engine.
  ;; NOTE: AUCTeX-11.86: Preview does not work with xelatex

  ;; load reftex
  (require 'reftex)
  ;; load cd-latex
  (require 'cdlatex)

  (add-hook 'LaTeX-mode-hook
            '(lambda ()
               (turn-on-auto-fill)
               (flyspell-mode 1)
               ;; (outline-minor-mode 1)
               (turn-on-reftex)
               (turn-on-cdlatex)
               (autopair-mode -1)
               (setq tex-source-specials-mode t)
               (setq LaTeX-math-mode t)
               (setq TeX-fold-mode t)
               (setq TeX-PDF-mode  nil)
               ))
  ;; (add-hook 'latex-mode-hook
  ;;           '(lambda ()
  ;;              (turn-on-auto-fill)
  ;;              (when (featurep 'flyspell) (flyspell-mode 1))
  ;;              (when (featurep 'outline) (outline-minor-mode 1))
  ;;              (when (try-require 'cdlatex) (cdlatex-mode 1))
  ;;              (when (try-require 'reftex) (reftex-mode 1))
  ;;              ;; (turn-on-reftex)
  ;;              ;; (turn-on-cdlatex)
  ;;              (when (featurep 'autopair) (autopair-mode -1))
  ;;              ;; (xy/yas-start)
  ;;              ;; (xy/linkd-start)
  ;;              ;; (xy/set-font-write)
  ;;              ))

  ;; (require 'tex-mik)
  ;; (setq TeX-auto-global "~/.emacs.d/site-lisp/auctex")

  ;;-------------------------------------------------------------------
  ;; 为AUCTeX添加自定义命令，注意命令中用了很多引号，这是为了适应文件名中含有空格的情况
  ;;-------------------------------------------------------------------
  ;; (setq my-tex-commands-extra (list
  ;;                  ;; (list "texify" "texify --tex-opt=--src %s.tex" 'TeX-run-command nil t)
  ;;                  ;; (list "pdf texify" "texify --pdf %s.tex" 'TeX-run-command nil t)
  ;;                  (list "pdflatex" "pdflatex \"%s.tex\"" 'TeX-run-LaTeX nil t)
  ;;                  (list "dvipdfmx" "dvipdfmx \"%s.dvi\"" 'TeX-run-command nil t)
  ;;                  (list "dvips" "dvips %s.dvi" 'TeX-run-command nil t)
  ;;                  (list "ps2pdf" "ps2pdf %s.ps" 'TeX-run-command nil t)
  ;;                  (list "gbk2uni" "gbk2uni \"%s.out\"" 'TeX-run-command nil t)
  ;;                  ;; (list "Yap" "yap -1 \"%dS\" \"%d\"" 'TeX-run-discard nil t)
  ;;                  (list "Gsview" "start .\\\"%s.ps\"" 'TeX-run-LaTeX nil t)
  ;;                  (list "Acrobat" "acroread \"%s.pdf\"" 'TeX-run-command nil t))
  ;;                  (list "Clean" "rm -f *.log *.aux %s.out %s.exa %s.ilg %s.idx %s.ind %s.lof %s.lot %s.toc %s.bbl %s.blg ctextemp_*.*" 'TeX-run-command nil t))
  ;; )
  ;; ;; 添加上面定义的命令
  ;; (require 'tex)
  ;; (setq TeX-command-list (append TeX-command-list my-tex-commands-extra))

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

  ;; set bib path
  ;; (defvar BIBINPUTS
  ;;   '("\\.bib$" "$BSTINPUTS" "$BIBINPUTS")) ; bibtex files.
  ;; (setenv "BIBINPUTS" "jabref")
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
