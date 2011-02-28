;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-org.el'
;; Time-stamp:<2011-02-28 Mon 03:27 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  Org mode settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; 为了column view能够在daemon模式下正常显示
;;;###autoload
(defun wl-org-column-view-uses-fixed-width-face ()
  ;; copy from org-faces.el
  (when (fboundp 'set-face-attribute)
    ;; Make sure that a fixed-width face is used when we have a column table.
    (set-face-attribute 'org-column nil
                        :height (face-attribute 'default :height)
                        :family (face-attribute 'default :family))))

;; BibTeX related
;;;###autoload
(defun org-mode-reftex-setup ()
  (require 'reftex)
  (require 'reftex-parse)
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all)))

;;;###autoload
(defun org-settings ()
  "Settings of `org'."

  (require 'org-install)
  ;; Loaded modules
  (setq org-modules 
        '(org-bbdb org-bibtex org-crypt org-ctags org-docview org-id
          org-info org-habit org-inlinetask org-mew org-gnus
          org-annotate-file org-bookmark org-checklist org-choose
          org-collector org-depend org-elisp-symbol org-eval
          org-eval-light org-expiry org-exp-bibtex
          org-interactive-query org-invoice org-learn org-mairix
          org-man org-mtags org-panel org-registry org2rem
          org-screen org-secretary org-special-blocks
          orgtbl-sqlinsert org-toc org-track))
  
  (when (and (fboundp 'daemonp) (daemonp))
    (add-hook 'org-mode-hook 
              'wl-org-column-view-uses-fixed-width-face))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; org GTD settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; agenda files
  (setq org-agenda-files 
        (list "~/emacs/org/gtd/PhdWork.org"
              "~/emacs/org/gtd/DailyLife.org"
              "~/emacs/org/gtd/GeekInterests.org"
              "~/emacs/org/gtd/Notes.org"
              "~/emacs/org/gtd/DSP.org"
              "~/emacs/org/gtd/CProgramming.org"
              "~/emacs/org/gtd/Electronics.org"))
  ;; Don't recursively display gtd files in session list
  (add-to-list 'session-globals-exclude 'org-mark-ring)
  ;; Don't display org agenda files
  (add-to-list 'session-globals-exclude 'org-agenda-files)
  (setq org-tag-persistent-alist 
        '((:startgroup) ("@uwe" . 85) ("@home" . 72) ("@shop" . 83) (:endgroup) 
          (:startgroup) ("appt" . 84) ("proj" . 80) (:endgroup) 
          (:startgroup) ("sched" . 67) ("asap" . 65) ("dlgd" . 68) (:endgroup)))
  (setq org-todo-keywords 
        '((sequence "TODO(t!)" "STARTED(s!)" "WAITING(w@)" "SOMEDAY(m!)" "|"
                    "DONE(d!)" "CANCELED(c@)")))
  (setq org-stuck-projects 
        '(("+proj" ("TODO" "DONE" "CANCELED") nil "")))
  (setq org-agenda-time-grid 
        '((daily today require-timed) "----------------" 
          (800 1000 1200 1400 1600 1800 2000 2200)))
  (setq org-default-notes-file
        (concat my-emacs-path "/org/source/gtd/Notes.org"))
  (setq org-combined-agenda-icalendar-file
        (concat my-emacs-path "/org/org.ics"))
  (setq org-mobile-encryption-tempfile "~/emacs/org/orgtmpcrypt")
  ;; custom commands
  (setq org-agenda-custom-commands 
        '(("x" "Agenda today" 
           ((agenda "") (org-agenda-ndays 1) (org-agenda-deadline-warning-days 30) 
            (org-agenda-sorting-strategy 
              '(time-up category-keep todo-state-up effort-down))))))
  ;; global propoerties
  (setq org-global-properties 
    '(("Effort_ALL" . 
         "0:10 0:20 0:30 1:00 1:30 2:00 2:30 3:00 4:00 6:00 8:00 12:00 16:00 24:00")))
  (setq org-id-locations-file
        (concat my-emacs-path "/org/org-id-locations"))
  (setq org-agenda-include-deadlines t)
  (setq org-agenda-restore-windows-after-quit t)
  (setq org-agenda-sorting-strategy 
        '((agenda habit-down time-up category-keep priority-down todo-state-up) 
          (todo category-keep priority-down todo-state-up)
          (tags category-keep priority-down) 
          (search category-keep)))
  (setq org-agenda-todo-ignore-scheduled t)
  (setq org-archive-save-context-info 
            '(time file category todo priority itags olpath ltags))
  ;; (setq org-completion-use-iswitchb t)
  (setq org-enforce-todo-checkbox-dependencies t)
  (setq org-enforce-todo-dependencies t)
  (setq org-refile-targets 
        '((org-agenda-files :maxlevel . 3)))
  (setq org-return-follows-link t)
  (setq org-reverse-note-order t)
  (setq org-treat-insert-todo-heading-as-state-change t)

  (defadvice  org-agenda-redo (after org-agenda-redo-add-appts)
    "Pressing `r' on the agenda will also add appointments."
    (progn 
      (setq appt-time-msg-list nil)
      (org-agenda-to-appt)))

  ;; org clock settings
  (setq org-clock-idle-time 15)
  (setq org-clock-in-resume t)
  (setq org-clock-in-switch-to-state "STARTED")
  (setq org-clock-out-switch-to-state "WAITING")
  (setq org-clock-persist t)
  (setq org-clock-persist-file
        (concat my-emacs-path "/org/org-clock-save"))
  (setq org-clock-persist-query-save t)
  (setq org-clock-sound t)
  (setq org-log-done (quote note))
  ;; (setq org-log-done t)
  (setq org-log-into-drawer t)
  (setq org-log-redeadline (quote note))
  (setq org-log-reschedule (quote note))
  (setq org-log-state-notes-insert-after-drawers t)
  (org-clock-persistence-insinuate)
  ;; (progn
  ;;   (appt-activate 1)
  ;;   (setq appt-display-format 'window)
  ;;   (setq appt-disp-window-function (function my-appt-disp-window))
  ;;   (defun my-appt-disp-window (min-to-app new-time msg)
  ;;     (call-process "~/script/popup.py" nil 0 nil min-to-app msg new-time)))

  ;; TODO entry to automatically change to DONE 
  ;; when all children are done
  ;; (defun org-summary-todo (n-done n-not-done)
  ;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
  ;;   (let (org-log-done org-log-states)   ; turn off logging
  ;;     (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  ;; (add-hook ('org-after-todo-statistics-hook 'org-summary-todo)

  ;; automatic reminder
  (require 'appt)
  (setq org-agenda-include-diary t)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt)
  (ad-activate 'org-agenda-redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; org note taking settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; cpature templates
  (setq org-capture-templates 
    '(("p" "PhdTask" 
       entry (file+headline "~/emacs/org/gtd/PhdWork.org" "Task pool") 
       "** TODO %?\n - Add time: %U\n - Source: \" %i \" in %a") 
      ("l" "LifeTask" 
       entry (file+headline "~/emacs/org/gtd/DailyLife.org" "Task pool")  
       "** SOMEDAY %?\n - Add time: %U\n - Source: \" %i \" in %a") 
      ("g" "GeekTask" 
       entry (file+headline "~/emacs/org/gtd/GeekInterests.org" "Task pool") 
       "** SOMEDAY %?\n - Add time: %U\n - Source: \" %i \" in %a") 
      ("m" "MiscTask" 
       entry (file+headline "~/emacs/org/gtd/Notes.org" "Tasks") 
       "** SOMEDAY %?\n - Add time: %U\n - Source: \" %i \" in %a") 
      ("n" "Notes" 
       entry (file+headline "~/emacs/org/gtd/Notes.org" "Notes") 
       "** %U %?") 
      ("i" "Ideas" 
       entry (file+headline "~/emacs/org/gtd/Notes.org" "Ideas") 
       "** %^{Title}\n - Details: %?\n - Add time: %U\n - Source: \" %i \" in %a")))
  (setq org-remember-default-headline "Tasks")
  ;; (org-remember-insinuate)
  ;; (define-key global-map "\C-cr" 'org-remember)
  ;; New capture system org-capture since version 7.01g
  ;; (define-key global-map "\C-cc" 'org-capture)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; org babel settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; babel evaluation languages
  (setq org-babel-load-languages 
        '((emacs-lisp . t) 
          (ditaa      . t) 
          (dot        . t)
          (octave     . t) 
          (matlab     . t)
          (latex      . t)
          (sh         . t)
          ;; (c          . t)
          ;; (c++        . t)
          ))
  ;; default latex package list
  (setq org-export-latex-default-packages-alist 
        '(("AUTO" "inputenc" t) ("T1" "fontenc" t) ("" "fixltx2e" nil) 
          ("UTF8,noindent,hyperref" "ctex" nil) 
          ("" "graphicx" t) ("" "longtable" nil) ("" "float" nil) 
          ("" "wrapfig" nil) ("" "soul" t) ("" "t1enc" t) ("" "textcomp" t) 
          ("" "marvosym" t) ("" "wasysym" t) ("" "latexsym" t) 
          ("" "amssymb" t) ("" "hyperref" nil) "\\tolerance=1000"))
  ;; latex to pdf command list
  ;; (setq org-latex-to-pdf-process 
  ;;   '(("pdflatex -interaction nonstopmode %b" 
  ;;      "bibtex %b" 
  ;;      "pdflatex -interaction nonstopmode %b" 
  ;;      "pdflatex -interaction nonstopmode %b")
  ;;    )
  ;; )

  (require 'org-exp-bibtex)
  (add-hook 'org-mode-hook
			'(lambda ()
			   (org-mode-reftex-setup)
			   (turn-on-org-cdlatex)
			   (auto-fill-mode -1)
			   ;; (yas-start)
			   ;; (linkd-start)
			   ;; (xy/set-font-write)
			   ))
 
  ;; contrib modules
  ;; (add-to-list 'load-path  
  ;;       "~/.emacs.d/site-lisp/org/contrib/babel/lisp") 
  ;;       "~/.emacs.d/site-lisp/org/contrib/lisp"))
  ;;    "/usr/local/share/emacs/site-lisp/org/contrib/babel/lisp")

  ;; (add-to-list 'load-path  
  ;;       "~/.emacs.d/site-lisp/org/contrib/lisp")
  ;;    "/usr/local/share/emacs/site-lisp/org/contrib/lisp")              

  ;; Use ditaa/graphviz to generate png pictures.
  ;;  *  Use artist mode to draw ascii picutre,
  ;;  *  then convert to png pictures using ditaa.
  ;; Now ditta is included in org, but I use the 
  ;; official release instead.
  ;;
  ;; Tips:
  ;;  *  C-x b to switch buffers. Originally, 
  ;;     it is bound for `switch-to-buffer'. 
  ;;     Instead, binding `iswitchb-buffer' 
  ;;     to C-x b is much easier to use.
  ;;  *  C-x n n to narrow the region, `narrow-to-region'. 
  ;;     It is very useful to prevent the unwanted change 
  ;;     on other portion of the buffer, and makes the user 
  ;;     concentrating on what he or she want to do. 
  ;;     The narrowing is reverted by the command, C-x n w `widen'.
  ;;  *  Create a begin_src block for the appropriate tool, 
  ;;     edit the text, and build the pictures with C-c C-c. 
  ;;     You can view the result directly in Emacs with C-c C-o 
  ;;     in the block.

  (setq org-ditaa-jar-path "~/.emacs.d/bin/ditaa0_9.jar")
  ;; (try-require 'org-babel-init)
  ;; (try-require 'org-babel-ditaa)
  ;; (try-require 'org-babel-dot)
  ;; (org-babel-load-library-of-babel)
  ;; Displays the results in a new frame and
  ;; close the new frame quickly after previewing the results
  ;; (global-set-key [f11] (lambda ()
  ;;                                  (interactive)
  ;;                                  (unless (buffer-modified-p)
  ;;                                    (kill-buffer (current-buffer)))
  ;;                                  (delete-frame)))

  ;; load graphviz-dot-mode lisp
  (load-file "~/.emacs.d/lisps/graphviz-dot-mode.el")

  (defvar org-babel-octave-wrapper-method
    "%s
save -ascii %s ans")

  ;; matlab integration
  ;; (require 'ob-matlab)
  ;; (require 'matlab)

  ;; org v7.3 new features
  ;; Fontify code in code blocks
  (setq org-src-fontify-natively t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; org publish project settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (setq org-publish-timestamp-directory "~/emacs/org/timestamps/")
  (setq org-publish-use-timestamps-flag t)
;; List of projects
;; http://192.168.1.100/  (local website)
;; local-org are the org-files that generate the content
;; local-extra are images and css files that need to be included
;; local is the top-level project that gets published
  (setq org-publish-project-alist
      (quote(
             ("local-org"
              :base-directory "~/emacs/org/source/"
              ;;            :preparation-funtion
              ;;            :completion-function
              :base-extension "org"
              ;;            :exclude
              ;;            :include
              :publishing-function org-publish-org-to-html
              :plain-source nil
              :htmlized-source nil
              ;;            :link-up
              ;;            :link-home
              :language utf-8
              ;;            :customtime
              ;;            :headline-levels
              ;;            :section-numbers
              ;;            :section-number-format
              :table-of-contents t
              ;;            :preserve-breaks
              :archived-trees nil
              :emphasize t
              :sub-superscript t
              ;;            :special-strings
              :footnotes t
              :drawers nil
              :tags t
              :todo-keywords t
              :priority t
              :TeX-macros t
              :LaTeX-fragments t
              :latex-listings nil 
              :skip-before-1st-heading nil
              :fixed-width t
              :timestamps t
              :author-info t
              :email-info nil
              :creator-info nil
              :tables t
              :table-auto-headline t
              :style-include-default t
              :style "<link rel=\"stylesheet\" href=\"http://192.168.1.100/org/stylesheets/org.css\" type=\"text/css\">"
              ;;            :style-extra "<link rel=\"stylesheet\" href=\"http://192.168.1.100/stylesheets/org.css\" type=\"text/css\" />"
              :convert-org-links t
              :inline-images t
              ;;            :html-extension
              ;;            :xml-declaration
              ;;            :html-table-tag
              :expand-quoted-html t
              :timestamp t
              :publishing-directory "/ftp:nobody@192.168.1.100:/org/"
              ;;            :preamble
              ;;            :postamble           
              ;;            :auto-preamble       
              ;;            :auto-postamble      
              :author "Xin Yang"
              :email "Xin2.Yang@gmail.com"
              ;;            :select-tags         
              ;;            :exclude-tags        
              ;;            :latex-image-options
              :auto-sitemap t
              :sitemap-filename "SiteMap.org"
              :sitemap-title "Sitemap of local website"
              :sitemap-function org-publish-org-sitemap
              :sitemap-sort-folders last
              :sitemap-alphabetically t
              :sitemap-ignore-case t
              :makeindex nil
              :recursive t
              )
             ("local-extra" 
              :base-directory "~/emacs/org/source/"
              :base-extension "css\\|pdf\\|png\\|jpg\\|gif\\|CSS\\|PDF\\|PNG\\|JPG\\|GIF\\|c\\|C\\|m\\|M\\|vhd\\|VHD\\|v\\|V\\|cpp\\|CPP"
              :publishing-directory "/ftp:nobody@192.168.1.100:/org/"
              :publishing-function org-publish-attachment
              :recursive t
              :author nil
              )
             ("local-addon" 
              :base-directory "~/emacs/org/addon/"
              :base-extension "css\\|pdf\\|png\\|jpg\\|gif\\|CSS\\|PDF\\|PNG\\|JPG\\|GIF"
              :publishing-directory "/ftp:nobody@192.168.1.100:/org/"
              :publishing-function org-publish-attachment
              :recursive t
              :author nil
              )
             ("local"
              :components ("local-org" "local-extra" "local-addon")
              )

             ;; PhD documents export to LaTeX draft
             ("phd-org"
              :base-directory "~/emacs/org/source/phd"
              ;;            :preparation-funtion
              ;;            :completion-function
              :base-extension "org"
              ;;            :exclude
              ;;            :include
              :publishing-function org-publish-org-to-latex
              :plain-source nil
              :htmlized-source nil
              :link-up t
              :link-home t
              :language utf-8
              ;;            :customtime
              ;;            :headline-levels
              ;;            :section-numbers
              ;;            :section-number-format
              :table-of-contents t
              ;;            :preserve-breaks
              :archived-trees nil
              :emphasize t
              :sub-superscript t
              ;;            :special-strings
              :footnotes t
              :drawers nil
              :tags nil
              :todo-keywords nil
              :priority nil
              :TeX-macros t
              :LaTeX-fragments t
              :latex-listings t 
              :skip-before-1st-heading nil
              :fixed-width t
              :timestamps t
              :author-info t
              :email-info t
              :creator-info nil
              :tables t
              :table-auto-headline t
              ;;            :style-include-default t
              ;;            :style "<link rel=\"stylesheet\" href=\"http://192.168.1.100/org/stylesheets/org.css\" type=\"text/css\">"
              ;;            :style-extra "<link rel=\"stylesheet\" href=\"http://192.168.1.100/stylesheets/org.css\" type=\"text/css\" />"
              :convert-org-links t
              :inline-images t
              ;;            :html-extension
              ;;            :xml-declaration
              ;;            :html-table-tag
              ;;            :expand-quoted-html t
              ;;            :timestamp t
              :publishing-directory "~/emacs/org/latex/phd"
              ;;            :preamble
              ;;            :postamble           
              ;;            :auto-preamble       
              ;;            :auto-postamble      
              :author "Xin Yang"
              :email "Xin2.Yang@gmail.com"
              ;;            :select-tags         
              ;;            :exclude-tags        
              ;;-----------------------------------------------------------
              ;;            :latex-image-options
              ;;------------------------------------------------------------
              :auto-sitemap nil
              ;; :sitemap-filename "SiteMap.org"
              ;; :sitemap-title "Index of my PhD documents"
              ;; :sitemap-function org-publish-org-sitemap
              ;; :sitemap-sort-folders last
              ;; :sitemap-alphabetically t
              ;; :sitemap-ignore-case t
              :makeindex nil
              :recursive t
              )
             ("phd-img" 
              :base-directory "~/emacs/org/source/phd/img"
              :base-extension "pdf\\|ps\\|png\\|jpg\\|bmp\\|eps\\|svg\\|PDF\\|PS\\|PNG\\|JPG\\|BMP\\|EPS\\|SVG"
              :publishing-directory "~/emacs/org/latex/phd/img"
              :publishing-function org-publish-attachment
              :recursive t
              )
             ("phd-src" 
              :base-directory "~/emacs/org/source/phd/src"
              :base-extension "v\\|vhd\\|c\\|hcc\\|cpp\\|m\\|V\\|VHD\\|C\\|HCC\\|CPP\\|M"
              :publishing-directory "~/emacs/org/latex/phd/src"
              :publishing-function org-publish-attachment
              :recursive t
              ) 
             ("phd-bib" 
              :base-directory "~/emacs/org/source/phd/bib"
              :base-extension "bib\\|bst\\|BIB\\|BST"
              :publishing-directory "~/emacs/org/latex/phd/bib"
              :publishing-function org-publish-attachment
              :recursive t
              )         
             ("phd-all"
              :components ("phd-org" "phd-img" "phd-src" "phd-bib")
              )
             ;;------------------------------------------------------------------------------  
             )))

;;------------------------------------------------------------------------------ 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ahei's settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'org-install)

;; (defun org-settings ()
;;   "Settings for `org'."

;;   (setq org-startup-folded nil
;;         org-cycle-include-plain-lists t)
;;   (setq org-log-done 'time)

;;   (defun org-hook-settings ()
;;     "Hook settings for `org'."
;;     (setq truncate-lines nil)
;;     (eval-after-load "hideshow"
;;       `(setq fold-all-fun 'org-toggle-display-content
;;              fold-fun 'org-toggle-fold-subtree))
;;     (org-literal-links))
;;   (add-hook 'org-mode-hook 'org-hook-settings)
  
;;   (defun org-kill-whole-line (&optional arg)
;;     "Kill line, to tags or end of line."
;;     (interactive "P")
;;     (cond
;;      ((or (not org-special-ctrl-k)
;;           (bolp)
;;           (not (org-on-heading-p)))
;;       (call-interactively 'kill-whole-line))
;;      ((looking-at (org-re ".*?\\S-\\([ \t]+\\(:[[:alnum:]_@:]+:\\)\\)[ \t]*$"))
;;       (kill-region (point) (match-beginning 1))
;;       (org-set-tags nil t))
;;      (t (kill-region (point) (point-at-eol)))))

;;   (defun org-literal-links ()
;;     "Show literal links."
;;     (interactive)
;; 	(org-remove-from-invisibility-spec '(org-link)) (org-restart-font-lock))

;;   (defun org-descriptive-links ()
;;     "Show descriptive links."
;;     (interactive)
;;     (org-add-to-invisibility-spec '(org-link)) (org-restart-font-lock))

;;   (defun org-display-content ()
;;     "Display content in `org-mode'."
;;     (interactive)
;;     (org-overview)
;;     (org-content))

;;   (defvar org-display-content nil "Display content or not now.")
;;   (make-variable-buffer-local 'org-display-content)

;;   (defvar org-fold-subtree nil "Fold subtree or not now.")
;;   (make-variable-buffer-local 'org-fold-subtree)
  
;;   (defun org-toggle-display-content ()
;;     "Toggle display content."
;;     (interactive)
;;     (setq org-display-content (not org-display-content))
;;     (if org-display-content
;;         (org-display-content)
;;       (show-all)))

;;   (defun org-toggle-fold-subtree ()
;;     "Toggle fold subtree."
;;     (interactive)
;;     (setq org-fold-subtree (not org-fold-subtree))
;;     (if org-fold-subtree
;;         (hide-subtree)
;;       (show-subtree)))

;;   (defun org-settings-4-emaci ()
;;     "`org-mode' settings for `emaci'."
;;     (emaci-add-key-definition "N" 'outline-next-visible-heading
;;                               '(eq major-mode 'org-mode))
;;     (emaci-add-key-definition "P" 'outline-previous-visible-heading
;;                               '(eq major-mode 'org-mode)))

;;   (eval-after-load "emaci"
;;     `(org-settings-4-emaci))

;;   (eal-define-keys
;;    'emaci-mode-map
;;    `(("N" emaci-N)
;;      ("P" emaci-P)))
  
;;   (defun org-jsinfo-settings ()
;;     "Settings for `org-jsinfo'."
;;     (setcdr (assoc 'view org-infojs-options) "showall"))

;;   (eval-after-load "org-jsinfo"
;;     `(org-jsinfo-settings)))

;; (eal-define-keys
;;  'org-mode-map
;;  `(("C-c e"   org-table-edit-field)
;;    ("C-k"     org-kill-whole-line)
;;    ("C-c M-b" org-export-as-html-and-open)
;;    ("C-c M-h" org-export-as-html)
;;    ("<tab>"   nil)
;;    ("C-j"     nil)
;;    ("C-c n"   org-forward-same-level)
;;    ("C-c p"   org-backward-same-level)
;;    ("C-c M-l" org-shiftright)
;;    ("C-c ,"   org-priority-sb)))

;; (eal-define-keys
;;  'org-agenda-mode-map
;;  `(("'" switch-to-other-buffer)
;;    ("1" delete-other-windows)
;;    ("2" split-window-vertically)
;;    ("3" split-window-horizontally)
;;    ("o" other-window)))

;; (defun org-colview-settings ()
;;   "Settings for `org-colview'."
;;   (org-defkey org-columns-map "e" 'org-columns-edit-value-sb)
;;   (org-defkey org-columns-map "h" 'backward-char)
;;   (org-defkey org-columns-map "l" 'forward-char)
;;   (org-defkey org-columns-map "j" 'next-line)
;;   (org-defkey org-columns-map "k" 'previous-line)
;;   (define-key org-columns-map "f" (key-binding (kbd "M-f")))
;;   (define-key org-columns-map "b" (key-binding (kbd "M-b"))))

;; (eval-after-load "org"
;;   `(org-settings))

;; (eval-after-load "org-colview"
;;   `(org-colview-settings))


(provide 'xy-rc-org)

