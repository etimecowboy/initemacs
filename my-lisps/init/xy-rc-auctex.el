;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auctex.el'
;; Time-stamp:<2012-06-04 Mon 21:14 xin on p5q>
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
  (require 'reftex)
  (require 'cdlatex)
  ;; (require 'wysiwyg-tex) ;; BUG: not working properly

  ;; (Windows ;; Use texlive instead of miktex in Windows now.
  ;;  (require 'tex-mik))

  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-electric-escape t
        TeX-auto-untabify t
        TeX-show-compilation nil
        TeX-save-query nil
        TeX-clean-confirm nil
        TeX-newline-function 'newline-and-indent
        TeX-electric-escape nil
        TeX-DVI-via-PDFTeX t
        TeX-electric-sub-and-superscript t
        TeX-quote-after-quote t
        LaTeX-math-abbrev-prefix "#"
        font-latex-fontify-script t
        reftex-plug-into-AUCTeX t)

  (setq-default TeX-master nil) ;; project support

  (setq TeX-fold-env-spec-list
        (quote (("[comment]" ("comment"))
                ("[figure]" ("figure"))
                ("[table]" ("table"))
                ("[itemize]"("itemize"))
                ("[enumerate]"("enumerate"))
                ("[description]"("description"))
                ("[overpic]"("overpic"))
                ("[tabularx]"("tabularx"))
                ("[code]"("code"))
                ("[shell]"("shell")))))

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

  (setq TeX-source-correlate-method 'synctex
        TeX-source-correlate-start-server t)

  (setq TeX-view-program-list
        '(("SumatraPDF" "SumatraPDF.exe %o")
          ("Gsview" "gsview32.exe %o")
          ("Okular" "okular --unique %o#src:%n%b")
          ("Evince" "evince %o")
          ("Firefox" "firefox %o")))

  (add-hook 'LaTeX-mode-hook
            '(lambda ()
               (turn-on-auto-fill)
               (flyspell-mode 1)
               (autopair-mode -1)
               (outline-minor-mode 1)
               (LaTeX-math-mode 1)
               (TeX-global-PDF-mode 1)
               (TeX-PDF-mode 1)
               (setq TeX-engine 'xetex) ;; set xelatex as default
               ;; engine. NOTE: Preview does not work with xelatex
               (GNULinux
                (setq TeX-view-program-selection
                      '((output-pdf "Okular")
                        ;; ((output-dvi style-pstricks) "dvips and gv")
                        (output-dvi "Okular")
                        (output-html "xdg-open"))))
               ;; (Windows
               ;;  (setq TeX-view-program-selection
               ;;        '((output-pdf "SumatraPDF")
               ;;          (output-dvi "Yap"))))
               (TeX-source-correlate-mode 1)
               (setq TeX-fold-mode 1)
               (setq Tex-source-specials-mode 1)
               (turn-on-cdlatex)
               (turn-on-reftex)
               ;; (imenu-add-menubar-index)
               (local-set-key "\C-c\C-t" ; Displays a page around cursor.
                              'wysiwyg-tex-show-preview)
               ;; (local-set-key "\C-c\C-T" ; Displays the whole page.
                              ;; 'wysiwyg-tex-show-whole-preview)
               ;; (define-key LaTeX-mode-map
               ;;   (kbd "C-c r") 'reftex-parse-all)
               ))

  (setq LaTeX-section-hook
        '(LaTeX-section-heading
          LaTeX-section-title
          ;;LaTeX-section-toc
          LaTeX-section-section
          LaTeX-section-label))

  (message "* ---[ auctex configuration is complete ]---"))

;;;###autoload
(defun preview-latex-settings ()
  "Settings of `preview-latex'."
  (require 'preview)
  ;; preview-latex, preview latex output in Emacs
  (LaTeX-preview-setup)
  (setq preview-image-type 'dvipng
        preview-scale-function 1.5
        preview-prefer-TeX-bb t
        preview-transparent-color "white")

  (message "* ---[ preview-latex configuration is complete ]---"))

(provide 'xy-rc-auctex)
