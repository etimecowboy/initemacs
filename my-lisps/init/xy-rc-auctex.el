;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auctex.el'
;; Time-stamp:<2011-02-19 Sat 22:35 xin on p6t>
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

;;--------------------------------------------------------------------

;;;###autoload
(defun auctex-settings ()
  "Settings of `auctex'."
  
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  ;; Set current file as the master
  (setq-default TeX-master t) 

  ;; load reftex
  (require 'reftex)
  ;;(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
  ;;(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
  (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
  (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
  ;;(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
  (setq reftex-default-bibliography 
		(list "~/emacs/org/source/phd/bib/bio" 
			  "~/emacs/org/source/phd/bib/lyon" 
			  "~/emacs/org/source/phd/bib/meddis"
			  "~/emacs/org/source/phd/bib/patterson"
			  "~/emacs/org/source/phd/bib/manuals"))
  (setq reftex-plug-into-AUCTeX t)

  ;; load cd-latex
  (require 'cdlatex)
  ;;(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
  ;;(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)
  ;;(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
  ;;(add-hook 'latex-mode-hook 'turn-on-cdlatex) ; with Emacs latex mode

  ;; (require 'tex-mik)
  ;; (setq TeX-auto-global "~/.emacs.d/site-lisp/auctex")

  (add-hook 'LaTeX-mode-hook
            '(lambda ()
			   (turn-on-auto-fill)
			   (outline-minor-mode 1)
			   (cdlatex-mode 1)
			   (reftex-mode 1)
			   (flyspell-mode 1)
			   (tex-source-specials-mode 1)
			   (LaTeX-math-mode 1)
			   (TeX-fold-mode 1)
			   (TeX-PDF-mode 1)
			   (turn-on-reftex)
			   (yas-start)
			   ;; (setq TeX-master t)
			   ))
  (add-hook 'latex-mode-hook
            '(lambda ()
			   (turn-on-auto-fill)
			   (outline-minor-mode 1)
			   (cdlatex-mode 1)
			   (reftex-mode 1)
			   (flyspell-mode 1)
			   (tex-source-specials-mode 1)
			   (LaTeX-math-mode 1)
			   (TeX-fold-mode 1)
			   (TeX-PDF-mode 1)
			   (turn-on-reftex)
			   (yas-start)
			   ;; (setq TeX-master t)
			   ))

;;-------------------------------------------------------------------
;; 为AUCTeX添加自定义命令，注意命令中用了很多引号，这是为了适应文件名中含有空格的情况
;;-------------------------------------------------------------------
;;(setq my-tex-commands-extra (list
;; 			     (list "texify" "texify --tex-opt=--src %s.tex" 'TeX-run-command nil t)
;; 			     (list "pdf texify" "texify --pdf %s.tex" 'TeX-run-command nil t)
;; 			     (list "pdflatex" "pdflatex \"%s.tex\"" 'TeX-run-LaTeX nil t)
;; 			     (list "dvipdfmx" "dvipdfmx \"%s.dvi\"" 'TeX-run-command nil t)
;; 			     (list "dvips" "dvips %s.dvi" 'TeX-run-command nil t)
;; 			     (list "ps2pdf" "ps2pdf %s.ps" 'TeX-run-command nil t)
;; 			     (list "gbk2uni" "gbk2uni \"%s.out\"" 'TeX-run-command nil t)
;;               (list "Yap" "yap -1 \"%dS\" \"%d\"" 'TeX-run-discard nil t)
;; 			     (list "Gsview" "start .\\\"%s.ps\"" 'TeX-run-LaTeX nil t)
;; 			     (list "Acrobat" "acroread \"%s.pdf\"" 'TeX-run-command nil t))
;; 			     (list "Clean" "rm -f *.log *.aux %s.out %s.exa %s.ilg %s.idx %s.ind %s.lof %s.lot %s.toc %s.bbl %s.blg ctextemp_*.*" 'TeX-run-command nil t))
;;)
;; 添加上面定义的命令
;;(require 'tex)
;;(setq TeX-command-list (append TeX-command-list my-tex-commands-extra))

;; set bib path
;; (defvar BIBINPUTS
;;   '("\\.bib$" "$BSTINPUTS" "$BIBINPUTS")) ; bibtex files.
;; (setenv "BIBINPUTS" "jabref")

  )

;;-----------------------------------------------------------------------------

;; preview-latex, preview latex output in Emacs

;;;### (autoloads (preview-report-bug LaTeX-preview-setup preview-install-styles)
;;;;;;  "preview" "preview.el" (17726 11006))
;;; Generated autoloads from preview.el

;;   (autoload (quote preview-install-styles) "preview" "\
;; Installs the TeX style files into a permanent location.
;; This must be in the TeX search path.  If FORCE-OVERWRITE is greater
;; than 1, files will get overwritten without query, if it is less
;; than 1 or nil, the operation will fail.  The default of 1 for interactive
;; use will query.

;; Similarly FORCE-SAVE can be used for saving
;; `preview-TeX-style-dir' to record the fact that the uninstalled
;; files are no longer needed in the search path.

;; \(fn DIR &optional FORCE-OVERWRITE FORCE-SAVE)" t nil)

;;   (autoload (quote LaTeX-preview-setup) "preview" "\
;; Hook function for embedding the preview package into AUCTeX.
;; This is called by `LaTeX-mode-hook' and changes AUCTeX variables
;; to add the preview functionality.

;; \(fn)" nil nil)
;;   (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

;;   (autoload (quote preview-report-bug) "preview" "\
;; Report a bug in the preview-latex package.

;; \(fn)" t nil)

;;(add-to-list 'load-path (expand-file-name "../auctex" (file-name-directory load-file-name)))
;;(defvar preview-datadir (expand-file-name "../auctex" (file-name-directory load-file-name)))
;;(defvar preview-TeX-style-dir (expand-file-name "../auctex/latex" (file-name-directory load-file-name)))

;;(defvar preview-gs-command "evince")

(provide 'xy-rc-auctex)
