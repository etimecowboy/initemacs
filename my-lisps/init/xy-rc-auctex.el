;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auctex.el'
;; Time-stamp:<2011-03-21 Mon 15:55 xin on P6T>
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

;; ;;;###autoload
;; (defun auctex-start ()
;;   "Start auctex tex writing IDE"

;;   (interactive)
;;   (load "auctex.el" nil t t)
;;   (load "preview-latex.el" nil t t)
;;   ;; (require 'auctex)
;;   ;; (require 'preview-latex))
;; )

;;;###autoload
(defun auctex-settings ()
  "Settings of `auctex'."

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil) ;; project support
  (setq tex-source-specials-mode t)
  (setq-default LaTeX-math-mode t)
  (setq-default TeX-fold-mode t)
  (setq-default TeX-PDF-mode t)
  
  ;; load reftex
  ;; (require 'reftex)

  ;; load cd-latex
  ;; (require 'cdlatex)

  (add-hook 'LaTeX-mode-hook
			'(lambda ()
			   (turn-on-auto-fill)
			   (outline-minor-mode 1)
			   (cdlatex-mode 1)
			   (reftex-mode 1)
			   (flyspell-mode 1)
			   (turn-on-reftex)
			   (turn-on-cdlatex)
			   ;; (yas-start)
			   ;; (linkd-start)
			   ;; (xy/set-font-write)
			   ))
  (add-hook 'latex-mode-hook
  		  '(lambda ()
			 (turn-on-auto-fill)
			 (outline-minor-mode 1)
			 (cdlatex-mode 1)
			 (reftex-mode 1)
			 (flyspell-mode 1)
			 (turn-on-reftex)
			 (turn-on-cdlatex)
			 ;; (yas-start)
			 ;; (linkd-start)
			 ;; (xy/set-font-write)
			 ))
  
  ;; (require 'tex-mik)
  ;; (setq TeX-auto-global "~/.emacs.d/site-lisp/auctex")

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

  ;; preview-latex, preview latex output in Emacs
  (LaTeX-preview-setup))

  ;; (yas-start)
  ;; (linkd-start))

(provide 'xy-rc-auctex)
