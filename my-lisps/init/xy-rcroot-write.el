;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-28 Sat 09:58 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-write.el'
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
     ;; (org-google-agenda-maps-key-bindings)
     (eal-define-keys
      'org-mode-map
      `(("C-c C-x C-h" xy/org-html-chinese-no-extra-space)
        ("C-c o m"     org2blog/wp-mode)
        ("C-c o l"     org2blog/wp-login)
        ("C-c o t"     org2blog/wp-post-subtree)
        ("C-c s"   org-export-as-html5presentation-and-open)
        ("C-c M-c" org-coordinates-google-geocode-set)
        ("C-c M-L" org-address-google-geocode-set)
        ("C-c M-A" org-address-google-geocode-set)
        ("C-c M-l" org-location-google-maps)
        ("C-c g"   org-publish-blog)))))
(eval-after-load "org-agenda" '(org-settings))
(eval-after-load "org-capture" '(org-settings))

(eal-define-keys-commonly
 global-map
 `(("C-c l"   org-store-link)
   ("C-c a"   org-agenda)
   ("C-c b"   org-ido-switchb)
   ("C-c c"   org-capture)
   ("C-c n"   org2blog/wp-new-entry)
   ("C-c u e" xy/browse-my-emacs-blog)
   ("M-W" tzz-copy-region-with-mode-property)))

;; BUG: when use this to fix org-agenda/org-mobile-push error ((error
;;      function `appt-make-list') in Emacs24 ((@url :file-name "http://www.mail-archive.com/emacs-orgmode@gnu.org/msg47051.html" :display "REF")) .
;; (add-hook 'diary-hook (function appt-make-list))

;;** org2blog
;; use publish org to HTML then use xml-rpc to blog
(eval-after-load "org2blog" '(org2blog-settings))

;;** o-blog
;; A stand-alone blog and publication tool for org-mode.
(eval-after-load "o-blog" '(o-blog-settings))

;;====================================================================
;;* auctex
(eval-after-load "auctex"
  '(progn
     (auctex-settings)
     ;; (eal-define-keys ;; BUG: not working
     ;;  'latex-mode-map
     ;;  `(("C-x `" TeX-next-error)))
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
(eval-after-load "cdlatex" '(cdlatex-settings))
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

;;--------------------------------------------------------------------
;;** whizzytex-mode
;; A minor mode for incrementally viewing LATEX documents that you are
;; editing. It works under Unix with `gv' and `xdvi' viewers, but the
;; ActiveDVI `advi' viewer will provide much better visual effects and
;; offer more functionalities.
;; NOTE: - whizztex now only support latex engine, NOT pdflatex.
;;       - Chinese is not supported.
(eval-after-load "Whizzytex-mode" '(whizzytex-settings))
(global-set-key (kbd "<f6> w") 'xy/whizzytex-start)

;;--------------------------------------------------------------------
;;** wysiwyg-tex
;; REF: (@url :file-name "https://github.com/laysakura/WYSIWYG-TeX-el" :display "Source")
;; WYSIWYG (What You See Is What You Get) tex writitng mode using
;; `doc-view.el' and `doc-view-fit-page.el'
(autoload 'wysiwyg-tex-show-preview "wysiwyg-tex" nil t)
(autoload 'wysiwyg-tex-show-whole-preview "wysiwyg-tex" nil t)
(eval-after-load "wysiwyg-tex" '(wysiwyg-tex-settings))
;; (add-hook 'tex-mode-hook
;;           ;; key-binds for tex-mode
;;           (local-set-key "\C-c\C-t" ; Displays a page around cursor.
;;                          'wysiwyg-tex-show-preview)
;;           (local-set-key "\C-c\C-T" ; Displays the whole page.
;;                          'wysiwyg-tex-show-whole-preview))

;;====================================================================
;;* txt2tags
;; convert plain text files to various formats
(setq auto-mode-alist
      (append (list '("\\.t2t$" . t2t-mode))
              (if (boundp 'auto-mode-alist) auto-mode-alist)))
(autoload 't2t-mode "txt2tags-mode" "Txt2tags Mode" t)

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

;;====================================================================
;;* markdown-mode
;; major mode for editing [Markdown][]-formatted text files
;; REF: (@url :file-name "http://jblevins.org/projects/markdown-mode/" :display "Source")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.mkd" . markdown-mode) auto-mode-alist))

(provide 'xy-rcroot-write)
