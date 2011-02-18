;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-emms.el'
;; Time-stamp:<2011-02-18 Fri 21:59 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `emms.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun init-emms ()
  "Initial emms"
  (interactive)
  (when (not (featurep 'emms-setup))
    (require 'emms-setup)
    (emms-standard)
    (emms-default-players)
    (setq emms-repeat-playlist t)
    (require 'emms-mode-line)
    ;; (emms-mode-line 1)
    ;; (emms-mode-line-blank)
    (require 'emms-playing-time)
    (emms-playing-time 1)))

;;;###autoload
(defadvice emms (before init-emms activate)
  "Initial emms first."
  (init-emms))

;;;###autoload
(defun emms-dir-tree ()
  "Switch to the current emms-playlist buffer, and query for a directory tree."
  (interactive)
  (init-emms)
  (if (or (null emms-playlist-buffer)
          (not (buffer-live-p emms-playlist-buffer)))
      (call-interactively 'emms-play-directory-tree))
  (emms-playlist-mode-go))

;;;###autoload
(defun emms-settings ()
  "Settings of `emms.el'."

  (define-key emms-playlist-mode-map (kbd "SPC") 'emms-pause)
  (define-key emms-playlist-mode-map [double-mouse-1]
  'emms-playlist-mode-play-current-track)
  
  ;;; Track Show Format (for playlist buffer)
  ;; (setq emms-last-played-format-alist
  ;;       '(((emms-last-played-seconds-today) . "%a %H:%M")
  ;; 		(604800                           . "%a %H:%M") ; this week
  ;; 		((emms-last-played-seconds-month) . "%d")
  ;; 		((emms-last-played-seconds-year)  . "%m/%d")
  ;; 		(t                                . "%Y/%m/%d")))

  ;; (setq xwl-emms-playlist-last-track nil)
  ;; (setq xwl-emms-playlist-last-indent "\\")

  ;; (defun xwl-emms-track-description-function (track)
  ;; 	"Return a description of the current track."
  ;; 	(let* ((name (emms-track-name track))
  ;; 		   (type (emms-track-type track))
  ;; 		   (short-name (file-name-nondirectory name))
  ;; 		   (play-count (or (emms-track-get track 'play-count) 0))
  ;; 		   (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
  ;; 		   (empty "..."))
  ;; 	  (prog1
  ;; 		  (case (emms-track-type track)
  ;; 			((file url)
  ;; 			 (let* ((artist (or (emms-track-get track 'info-artist) empty))
  ;; 					(year (emms-track-get track 'info-year))
  ;; 					(playing-time (or (emms-track-get track 'info-playing-time) 0))
  ;; 					(min (/ playing-time 60))
  ;; 					(sec (% playing-time 60))
  ;; 					(album (or (emms-track-get track 'info-album) empty))
  ;; 					(tracknumber (emms-track-get track 'info-tracknumber))
  ;; 					(short-name (file-name-sans-extension
  ;; 								 (file-name-nondirectory name)))
  ;; 					(title (or (emms-track-get track 'info-title) short-name))
					
  ;; 					;; last track
  ;; 					(ltrack xwl-emms-playlist-last-track)
  ;; 					(lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
  ;; 								 empty))
  ;; 					(lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
  ;; 								empty))
					
  ;; 					(same-album-p (and (not (string= lalbum empty))
  ;; 									   (string= album lalbum))))
  ;; 			   (format "%10s  %3d   %-20s%-60s%-35s%-15s%s"
  ;; 					   (emms-last-played-format-date last-played)
  ;; 					   play-count
  ;; 					   artist

  ;; 					   ;; Combine indention, tracknumber, title.
  ;; 					   (concat
  ;; 						(if same-album-p ; indention by album
  ;; 							(setq xwl-emms-playlist-last-indent
  ;; 								  (concat " " xwl-emms-playlist-last-indent))
  ;; 						  (setq xwl-emms-playlist-last-indent "\\")
  ;; 						  "")
  ;; 						(if (and tracknumber ; tracknumber
  ;; 								 (not (zerop (string-to-number tracknumber))))
  ;; 							(format "%02d." (string-to-number tracknumber))
  ;; 						  "")
  ;; 						title        ; title
  ;; 						)

  ;; 					   ;; album
  ;; 					   (cond ((string= album empty) empty)
  ;; 							 ;; (same-album-p "  ")
  ;; 							 (t (concat "ã€Š" album "ã€‹")))

  ;; 					   (or year empty)
  ;; 					   (if (or (> min 0)  (> sec 0))
  ;; 						   (format "%02d:%02d" min sec)
  ;; 						 empty))))
  ;; 			((url)
  ;; 			 (concat (symbol-name type) ":" name))
  ;; 			(t
  ;; 			 (format "%-3d%s"
  ;; 					 play-count
  ;; 					 (concat (symbol-name type) ":" name))))
  ;; 		(setq xwl-emms-playlist-last-track track))))
  
  ;; (setq emms-track-description-function
  ;; 		'xwl-emms-track-description-function)
  
)

(provide 'xy-emms.el)
