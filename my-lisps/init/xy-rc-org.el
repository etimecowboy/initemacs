;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-org.el'
;; Time-stamp:<2011-07-30 Sat 22:43 xin on p6t>
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

;; 为了column view能够在emacs daemon模式下正常显示
;;;###autoload
(defun wl-org-column-view-uses-fixed-width-face ()
  ;; copy from org-faces.el
  (when (fboundp 'set-face-attribute)
    ;; Make sure that a fixed-width face is used when we have a column table.
    (set-face-attribute 'org-column nil
                        :height (face-attribute 'default :height)
                        :family (face-attribute 'default :family))))

;; ;; BibTeX related
;; ;;;###autoload
;; ;; (defun org-mode-reftex-setup ()
;; ;;   (require 'reftex)
;; ;;   (require 'reftex-parse)
;; ;;   (and (buffer-file-name)
;; ;;        (file-exists-p (buffer-file-name))
;; ;;        (reftex-parse-all)))
;; (defun org-mode-reftex-setup ()
;;   (load-library "reftex")
;;   (and (buffer-file-name)
;;        (file-exists-p (buffer-file-name))
;;        (reftex-parse-all))
;;   (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
;;   (define-key org-mode-map (kbd "C-c (") 'reftex-reference))

;;;###autoload
(defun org-settings ()
  "Settings of `org'."

  (require 'org-install)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; Some basic settings and some confliction fixes
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  ;; Loaded modules
  (setq org-modules 
        '(org-bbdb org-bibtex org-crypt
		  org-ctags org-docview org-id
          org-info org-habit org-inlinetask org-mew org-gnus
          org-annotate-file org-bookmark org-checklist org-choose
          org-collector org-depend org-elisp-symbol org-eval
          org-eval-light org-expiry ;; org-exp-bibtex
          org-interactive-query org-invoice org-learn org-mairix
          org-man org-mtags org-panel org-registry org2rem
          org-screen org-secretary org-special-blocks
          orgtbl-sqlinsert org-toc org-track))
  
  (when (and (fboundp 'daemonp) (daemonp))
    (add-hook 'org-mode-hook 
              'wl-org-column-view-uses-fixed-width-face))

  ;; Locate some files
  (setq org-directory "~/emacs/org")
  (setq org-default-notes-file
        (concat my-emacs-path "/org/gtd/Notes.org"))
  (setq org-combined-agenda-icalendar-file
        (concat my-emacs-path "/org/org.ics")) 
  (setq org-id-locations-file
        (concat my-emacs-path "/org/org-id-locations"))
  
  ;; NOTE: Has been soved from org 7.6
  ;; ;; org-crypt security issue about auto-save
  ;; (add-hook 'org-mode-hook
  ;; 			'(lambda ()
  ;; 			   (auto-save-mode -1)))

  ;; NOTE: Use icicles instead
  ;; (setq org-completion-use-iswitchb t)
  ;; (setq org-completion-use-ido t)

  ;; Disable ENT to follow links --- avoid annoying jumping during writing
  (setq org-return-follows-link nil)

  ;; Enable inline image display.
  ;; But may breaks access to emacs from an Android phone
  (setq org-startup-with-inline-images t)
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; GTD system settings
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; agenda files
  (setq org-agenda-files
        (list
		 "~/emacs/org/gtd/PhdWork.org"
		 "~/emacs/org/gtd/DailyLife.org"
		 "~/emacs/org/gtd/GeekInterests.org"
		 "~/emacs/org/gtd/Learn.org"
		 "~/emacs/org/gtd/Notes.org"
		 ))

  ;; Don't recursively display gtd files in session list
  (add-to-list 'session-globals-exclude 'org-mark-ring)
  ;; Don't display org agenda files
  (add-to-list 'session-globals-exclude 'org-agenda-files)

  ;;-------------------------------------------------------
  ;; GTD contexts & tags
  
  (setq org-tag-persistent-alist ;; contexts
        '((:startgroup)
		  ("@campus" . ?C) ("@BRL" . ?B) ("@library" . ?L)
		  ("@home" . ?H) ("@street" . ?S)
		  (:endgroup) 

		  ("online" . ?O) ("post" . ?M) ("email" . ?E)
		  ("phone" . ?F) ("people" . ?Z)
		  
		  ("appt" . ?A) ("proj" . ?P)
		  ("repeat" . ?R)		  
          ("delegated" . ?D)))
  
  ;; Inherit tags in most of cases
  (setq org-use-tag-inheritance t)
  ;; Exclusions of tag inheritance
  (setq org-tags-exclude-from-inheritance '("proj"))
  
  ;;-------------------------------------------------------
  ;; Properties
  
  (setq org-use-property-inheritance
		nil)  ;; Don't inheritant property for sub-items, 
              ;; since it slows down property searchings.

  ;; NOTE: a task should not takes more than 4 hours, otherwise it
  ;; MUST be a project and can be broken into smaller tasks. 
  (setq org-global-properties   ;; Additional properties
		'(("Effort_ALL" . 
		   "0:10 0:20 0:30 1:00 1:30 2:00 2:30 3:00 4:00")
		  ("Importance_ALL" . 
		   "A B C")
		  ("Score_ALL" .
		   "0 1 2 3 4 5 6 7 8 9 10")
		  ))

  ;;--------------------------------------------------------
  ;; Priority

  (setq org-enable-priority-commands t)
  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?C)
  (setq org-default-priority ?B)
  (setq org-priority-start-cycle-with-default t)

  ;;--------------------------------------------------------
  ;; Column view

  ; Set default column view headings: Task Effort Clock_Summary
  (setq org-columns-default-format
		"%CATEGORY(Cat.) %PRIORITY(Pri.) %Importance(Imp.) %6TODO(State) %35ITEM(Details) %ALLTAGS(Tags) %5Effort(Plan){:} %6CLOCKSUM(Clock){Total} %Score(Score)")


  ;;--------------------------------------------------------
  ;; TODO item keywords

  (setq org-use-fast-todo-selection t) ;; C-c C-t key
  (setq org-todo-keywords
  		'((sequence "TODO(t!)" "NEXT(n)" "STARTED(s!)" "|"
                    "DONE(d!)") 
  		  (sequence "SOMEDAY(x!)" "WAITING(w@/!)" "|"
                    "CANCELLED(c@/!)")))
  
  ;; (setq org-todo-keyword-faces 
  ;; 		(quote (("TODO" :foreground "red" :weight bold)
  ;; 				("NEXT" :foreground "blue" :weight bold)
  ;; 				("STARTED" :foreground "blue" :weight bold)
  ;; 				("DONE" :foreground "forest green" :weight bold)
  ;; 				("WAITING" :foreground "orange" :weight bold)
  ;; 				("SOMEDAY" :foreground "magenta" :weight bold)
  ;; 				("CANCELLED" :foreground "forest green" :weight bold)
  ;; 				("OPEN" :foreground "blue" :weight bold)
  ;; 				("CLOSED" :foreground "forest green" :weight bold)
  ;; 				("PHONE" :foreground "forest green" :weight bold))))

  ;; Tag change triggers
  ;; (setq org-todo-state-tags-triggers
  ;; 		'(("TODO"      ("new"))
  ;; 		  ("NEXT"      ("new"))
  ;; 		  ("STARTED"   ("new"))
  ;; 		  ("DONE"      ("new") ("old" . t))
  ;; 		  ("WAITING"   ("new"))
  ;; 		  ("SOMEDAY"   ("new"))
  ;; 		  ("CANCELLED" ("new") ("important") ("old" . t))))

  ;; Treat adding item as state change
  (setq org-treat-insert-todo-heading-as-state-change t)
  
  (setq org-enforce-todo-checkbox-dependencies
		t) ;; Block checkbox entries from CHECKED while they have
           ;; children that are not CHECKED  

  (setq org-enforce-todo-dependencies
		t)   ;; Block TODO items from changing state to DONE while
             ;; they have children that are not DONE

  (setq org-stuck-projects ;; Define stuck projects
        '("+proj/!-TODO-SOMEDAY"
		  ("\\<NEXT\\>" "\\<STARTED\\>")))

  ;; TODO entry automatically changes to DONE 
  ;; when all children are done
  ;; (defun org-summary-todo (n-done n-not-done)
  ;;   "Switch entry to DONE when all subentries are done, to TODO
  ;; otherwise." 
  ;;   (let (org-log-done org-log-states)   ; turn off logging
  ;;     (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  ;; (add-hook ('org-after-todo-statistics-hook 'org-summary-todo)
  
  ;;--------------------------------------------------------------------------
  ;; Log settings
  
  (setq org-log-done        'time)
  (setq org-log-done-with-time t)
  (setq org-log-into-drawer 'time)
  (setq org-log-redeadline  'note)
  (setq org-log-reschedule  'time)
  (setq org-log-refile      'time)
  (setq org-log-state-notes-insert-after-drawers t)
  (setq org-agenda-log-mode-items '(closed state))

  ;;--------------------------------------------------------------------------
  ;; Clock settings

  (setq org-clock-history-length 10)
  (setq org-clock-idle-time 15)
  (setq org-clock-in-resume t)
  (setq org-clock-in-switch-to-state "STARTED")
  (setq org-clock-out-switch-to-state "WAITING")
  ;; (setq org-drawers '("LOGBOOK" "PROPERTIES")) ;; Separate drawers for clocking and logs
  (setq org-clock-into-drawer t)
  (setq org-clock-out-remove-zero-time-clocks t)
  (setq org-clock-out-when-done t)
  (setq org-clock-persist 'history)
  (setq org-clock-persist-file
        (concat my-emacs-path "/org/org-clock-save"))
  (setq org-clock-auto-clock-resolution 'when-no-clock-is-running)
  (setq org-clock-report-include-clocking-task t)
  (setq org-clock-persist-query-save t)
  (setq org-clock-sound t)
  (org-clock-persistence-insinuate)

  ;;---------------------------------------------------------------------------
  ;; Alarm  using appt
  
  (require 'appt)
  (setq org-agenda-include-diary t)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt)
  
  (defadvice  org-agenda-redo (after org-agenda-redo-add-appts)
    "Pressing `r' on the agenda will also add appointments."
    (progn 
      (setq appt-time-msg-list nil)
      (org-agenda-to-appt)))

  (ad-activate 'org-agenda-redo)
  
  ;; (progn
  ;;   (appt-activate 1)
  ;;   (setq appt-display-format 'window)
  ;;   (setq appt-disp-window-function (function my-appt-disp-window))
  ;;   (defun my-appt-disp-window (min-to-app new-time msg)
  ;;     (call-process "~/script/popup.py" nil 0 nil min-to-app msg
  ;;   new-time)))
  
  ;;--------------------------------------------------------------------------
  ;; Custom ageda views

  ;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)

  ;; Display two windows in the current frame
  (setq org-agenda-window-setup ;; 'other-frame)
		'reorganize-frame)

  ;; Agenda window frame fractions
  (setq org-agenda-window-frame-fractions (quote (0.20 . 0.80)))

  ;; Restore window setup after quite
  (setq org-agenda-restore-windows-after-quit t)

  ;; Set the default number of days displayed in the agenda (C-c a a)
  (setq org-agenda-span 'week)

  ;; Include/exclude some special items globally
  (setq org-agenda-todo-ignore-scheduled t)
  (setq org-agenda-todo-ignore-deadlines nil)
  (setq org-agenda-todo-ignore-timestamp nil)
  (setq org-agenda-todo-ignore-with-date nil)

  ;; Show all items when do a tag-todo search (C-c a M) 
  ;; (org-agenda-tags-todo-honor-ignore-options nil)

  ;; Do not display sublevels
  (setq org-agenda-todo-list-sublevels nil)

  ;; Display items within their dealine periods 
  (setq org-agenda-include-deadlines t)

  ;; Use grid style timeline
  (setq org-agenda-use-time-grid t)
  (setq org-agenda-time-grid 
        '((daily today require-timed) "----------------" 
          (800 1000 1200 1400 1600 1800 2000 22:00)))
  
  ;; Agenda view presentation and sorting
  ;; org-agenda-tags-column
  ;; org-agenda-prefix-format
  (setq org-agenda-sorting-strategy 
        '((agenda time-up category-keep priority-down todo-state-up) 
          (todo time-up category-keep priority-down todo-state-up)
          (tags time-up category-keep priority-down todo-state-up) 
          (search time-up category-keep priority-down todo-state-up)))
  
  ;; custom agenda commands
  ;; Custom agenda command definitions
  (setq org-agenda-custom-commands
  		'((" " "Day Planner"
		   ((tags-todo "TODO<>\"TODO\"+TODO<>\"SOMEDAY\"+SCHEDULED<\"<today>\""
					   ((org-agenda-overriding-header
						 "Un-finished Tasks of Yesterday or Earlier (Re-Schedule them first!)") 
						(org-tags-match-list-sublevels t)))

			(agenda ""
					((org-agenda-ndays 1)
					 (org-agenda-deadline-warning-days 30)
					 (org-agenda-use-time-grid t)
					 (org-agenda-skip-scheduled-if-done t)
					 (org-agenda-skip-deadline-if-done t)
					 (org-agenda-skip-timestamp-if-done t)
					 (org-agenda-skip-archived-trees t)
					 (org-agenda-skip-comment-trees t)
					 (org-agenda-todo-list-sublevel t)
					 (org-agenda-timeline-show-empty-dates nil)))

		    (tags-todo "TODO<>\"TODO\"+TODO<>\"SOMEDAY\"+Importance=\"A\"+PRIORITY=\"A\"+SCHEDULED<\"<tomorrow>\"+SCHEDULED>=\"<today>\""
				       ((org-agenda-overriding-header
					     "1. Urgent & Important Tasks Scheduled for Today") 
						(org-tags-match-list-sublevels t)))
			
			(tags-todo "TODO<>\"TODO\"+TODO<>\"SOMEDAY\"+Importance<>\"A\"+PRIORITY=\"A\"+SCHEDULED<\"<tomorrow>\"+SCHEDULED>=\"<today>\""
					   ((org-agenda-overriding-header
						 "2. Urgent & NOT Important Tasks Scheduled for Today")
						(org-tags-match-list-sublevels t)))

			(tags-todo "TODO<>\"TODO\"+TODO<>\"SOMEDAY\"+Importance=\"A\"+PRIORITY<>\"A\"+SCHEDULED<\"<tomorrow>\"+SCHEDULED>=\"<today>\""
					   ((org-agenda-overriding-header
						 "3. NOT Urgent & Important Tasks Scheduled for Today")
						(org-tags-match-list-sublevels t)))

			(tags-todo "TODO<>\"TODO\"+TODO<>\"SOMEDAY\"+Importance<>\"A\"+PRIORITY<>\"A\"+SCHEDULED<\"<tomorrow>\"+SCHEDULED>=\"<today>\"" 
					   ((org-agenda-overriding-header
						 "4. NOT Urgent & NOT Important Tasks Scheduled for Today")
						(org-tags-match-list-sublevels t)))

			(tags-todo "TODO=\"TODO\"+TIMESTAMP_IA<\"<tomorrow>\"+TIMESTAMP_IA>=\"<today>\""
				       ((org-agenda-overriding-header
						 "New Task Today (Un-Processed, Make Sure it is Empty at the end of today)") 
						(org-tags-match-list-sublevels t)))
 
			(tags      "CLOSED<\"<tomorrow>\"+CLOSED>=\"<today>\""
					   ((org-agenda-overriding-header
						 "Finished Tasks Today (Refile them at End of this Week)") 
						(org-tags-match-list-sublevels nil)
						(org-agenda-skip-scheduled-if-done nil)
						(org-agenda-skip-deadline-if-done nil)
						(org-agenda-skip-timestamp-if-done nil)
						(org-agenda-skip-archived-trees nil)))

			(tags-todo "TODO=\"NEXT\"+SCHEDULED>=\"<tomorrow>\"+SCHEDULED<=\"<+3d>\""
				       ((org-agenda-overriding-header
						 "Scheduled Tasks for the Next 3 days") 
						(org-tags-match-list-sublevels nil)))

			(tags-todo "TODO=\"TODO\"+TIMESTAMP_IA<\"<today>\""
					   ((org-agenda-overriding-header
						 "Old Un-Processed Tasks (Process Them ASAP)") 
						(org-tags-match-list-sublevels t)))

			(tags-todo "TODO=\"SOMEDAY\""
					   ((org-agenda-overriding-header
						 "Un-Scheduled Tasks (Schedule Them if Possible)")
						(org-tags-match-list-sublevels nil)))
			))
	  
		  ("n" "Recent Notes NOT Refiled" tags
		     "+note+TIMESTAMP_IA<\"<tomorrow>\"+TIMESTAMP_IA>=\"<-10d>\"" 
		   ((org-agenda-overriding-header
			 "Recent Notes (Refile Them ASAP)")
			(org-tags-match-list-sublevels nil)))
			
		  ("i" "Recent Ideas NOT Refiled" tags
		   "+idea+TIMESTAMP_IA<\"<tomorrow>\"+TIMESTAMP_IA>=\"<-10d>\""
		   ((org-agenda-overriding-header "Recent Ideas (Refile Them ASAP)")
			(org-tags-match-list-sublevels nil)))

		  ("w" "Weekly Review"
		   ((tags-todo "TODO=\"TODO\""
					   ((org-agenda-overriding-header
						 "Un-Processed New Tasks (Empty before Weekly Review)") 
						(org-tags-match-list-sublevels t)))

			(agenda ""
					 ((org-agenda-span 'week)
					 (org-agenda-ndays 7)
					 (org-agenda-deadline-warning-days 60)
					 (org-agenda-use-time-grid nil)
					 (org-agenda-skip-scheduled-if-done nil)
					 (org-agenda-skip-deadline-if-done nil)
					 (org-agenda-skip-timestamp-if-done nil)
					 (org-agenda-skip-archived-trees nil)
					 (org-agenda-skip-comment-trees t)
					 (org-agenda-todo-list-sublevel nil)
					 (org-agenda-timeline-show-empty-dates t)))

			(tags	 "CLOSED<\"<tomorrow>\"+CLOSED>=\"<-1w>\""
			         ((org-agenda-overriding-header
					   "Finished Tasks in This Week (Archive now)") 
					  (org-tags-match-list-sublevels t)
					  (org-agenda-skip-scheduled-if-done nil)
					  (org-agenda-skip-deadline-if-done nil)
					  (org-agenda-skip-timestamp-if-done nil)
					  (org-agenda-skip-archived-trees nil)))

		   (tags-todo "TODO<>\"TODO\"+SCHEDULED<\"<tomorrow>\"+SCHEDULED>=\"<-1w>\""
					   ((org-agenda-overriding-header
						 "Un-Finished Tasks in This Week (Re-Schedule now)")
						(org-tags-match-list-sublevels t)))

		   (tags      "proj/!-TODO-SOMEDAY"
					  ((org-agenda-overriding-header
						"Projects Review (Make Sure NOT Stuck)")
					   (org-tags-match-list-sublevels t)))))
		  ))

  ;;------------------------------------------------------------------------------------
  ;; MobileOrg settings

  ;; I use Dropbox serveice
  (setq org-mobile-directory "~/emacs/org/gtd/mobile")
  (setq org-mobile-encryption-tempfile "~/emacs/org/orgtmpcrypt")
  (setq org-mobile-files org-agenda-files)
  (setq org-mobile-inbox-for-pull "~/emacs/org/gtd/from-mobile.org")

  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; Capture, refile & archive settings
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; NOTE: Swithed from 'remember' to 'org-capture' 
  ;; (setq org-remember-default-headline "Tasks")
  ;; (org-remember-insinuate)
  ;; (define-key global-map "\C-cr" 'org-remember)
  ;; New capture system org-capture since version 7.01g
  ;; (define-key global-map "\C-cc" 'org-capture)
  
  ;; cpature templates
  (setq org-capture-templates 
  		'(("p" "Add a PhD Task----->Day Planner"
  		   entry (file+headline "~/emacs/org/gtd/PhdWork.org" "Task pool")
  		   "** TODO [#A] %? %^g\n   :LOGBOOK:\n   - State \"TODO\" from \"%i\" in \"%a\"    %U\n   :END:\n   :PROPERTIES:\n   :Importance:       A\n   :Effort:       2:00\n   :Score:       0\n   :END:"
  		   :empty-lines 1 :prepend t :clock-keep t)
  		  ("l" "Add a Life Task---->Day Planner"
  		   entry (file+headline "~/emacs/org/gtd/DailyLife.org" "Task pool")
  		   "** TODO [#B] %? %^g\n   :LOGBOOK:\n   - State \"TODO\" from \"%i\" in \"%a\"    %U\n   :END:\n   :PROPERTIES:\n   :Importance:       B\n   :Effort:       0:30\n   :Score:       0\n   :END:"
  		   :empty-lines 1 :prepend t :clock-keep t)
  		  ("g" "Add a Geek Task---->Day Planner"
  		   entry (file+headline "~/emacs/org/gtd/GeekInterests.org" "Task pool")
  		   "** TODO [#C] %? %^g\n   :LOGBOOK:\n   - State \"TODO\" from \"%i\" in \"%a\"    %U\n   :END:\n   :PROPERTIES:\n   :Importance:       B\n   :Effort:       2:00\n   :Score:       0\n   :END:"
  		   :empty-lines 1 :prepend t :clock-keep t)
  		  ("s" "Add a Learn Task--->Day Planner"
  		   entry (file+headline "~/emacs/org/gtd/Learn.org" "Task pool")
  		   "** TODO [#C] %? %^g\n   :LOGBOOK:\n   - State \"TODO\"  from \"%i\" in \"%a\"   %U\n   :END:\n   :PROPERTIES:\n   :Importance:       A\n   :Effort:       2:00\n   :Score:       0\n   :END:"
  		   :empty-lines 1 :prepend t :clock-keep t)
		  ("m" "Add a Misc Task---->Day Planner"
  		   entry (file+headline "~/emacs/org/gtd/Notes.org" "Unclassified tasks")
  		   "** TODO [#B] %? %^g\n   :LOGBOOK:\n   - State \"TODO\"  from \"%i\" in \"%a\"   %U\n   :END:\n   :PROPERTIES:\n   :Importance:       C\n   :Effort:       1:00\n   :Score:       0\n   :END:"
  		   :empty-lines 1 :prepend t :clock-keep t)
  		  ("n" "Write a Notes"
  		   entry (file+headline "~/emacs/org/gtd/Notes.org" "Notes")
  		   "** %? %^G\n   :LOGBOOK:\n   - Entered from \"%i\" in \"%a\"   %U\n   - Last updated on   %U\n   :END:\n   :PROPERTIES:\n   :Importance:       A\n   :END:"
  		   :empty-lines 1 :prepend t :clock-keep t)
  		  ("i" "Record an Idea"
  		   entry (file+headline "~/emacs/org/gtd/Notes.org" "Ideas")
  		   "** %? %^G\n   :LOGBOOK:\n   - Entered from \"%i\" in \"%a\"   %U\n   - Last updated on   %U\n   :END:\n   :PROPERTIES:\n   :Importance:       A\n   :END:"
  		   :empty-lines 1 :prepend t :clock-keep t)
  		   ))

  ; Targets include this file and any file contributing to the agenda
  ; - up to 3 levels deep 
  (setq org-refile-targets '((nil :maxlevel . 3)
							 (org-agenda-files :maxlevel . 3)))

  ;; Put the newest item on the top
  (setq org-reverse-note-order t)

  ; Stop using paths for refile targets - we file directly with Icicles
  (setq org-refile-use-outline-path t)

  ; Targets complete directly with Icicles
  (setq org-outline-path-complete-in-steps t)

  ; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  ;; Infomation saved in archives
  (setq org-archive-save-context-info 
		'(time file category todo priority itags olpath ltags))

  ;; makes it possible to archive tasks that are not marked DONE
  (setq org-archive-mark-done nil)
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; Babel settings
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; babel evaluation languages
  (setq org-babel-load-languages 
        '((emacs-lisp . t) 
          (ditaa      . t) 
          (dot        . t)
          ;; (octave     . t) 
          (matlab     . t)
          (latex      . t)
          (sh         . t)
          ;; (c          . t)
          ;; (c++        . t)
          ))

  (require 'ob-emacs-lisp)
  (require 'ob-ditaa)
  (require 'ob-dot)
  (require 'ob-matlab)
  (require 'ob-latex)
  (require 'ob-sh)

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
			   ;; BUG: org-mobile
			   ;; (org-mode-reftex-setup)
			   (turn-on-org-cdlatex)
			   (auto-fill-mode -1)
			   (yas-start)
			   (linkd-start)
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
  (setq org-src-fontify-natively t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Publishing settings
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
			 ))))

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

