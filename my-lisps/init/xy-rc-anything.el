;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-anything.el'
;; Time-stamp:<2011-02-13 Sun 17:38 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `anything.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun anything-settings ()
  "settings for `ido'."

  (require 'anything-auto-install)
  (setq anything-c-adaptive-history-file 
        (concat my-var-path "/anything-c-adaptive-history"))
  (setq anything-sources
        (list
          ;; ;; Buffer:
          ;; anything-c-source-buffers
          ;; anything-c-source-buffer-not-found
          ;; anything-c-source-buffers+
          ;; ;; File:
          ;; anything-c-source-file-name-history
          ;; anything-c-source-files-in-current-dir
          ;; anything-c-source-files-in-current-dir+
          ;; anything-c-source-file-cache
          ;; anything-c-source-locate
          ;; anything-c-source-recentf
          ;; anything-c-source-ffap-guesser
          ;; anything-c-source-ffap-line
          ;; ;; Help:
          ;; anything-c-source-man-pages
          ;; anything-c-source-info-pages
          ;; anything-c-source-info-elisp
          ;; anything-c-source-info-cl
          ;; ;; Command:
          ;; anything-c-source-complex-command-history
          ;; anything-c-source-extended-command-history
          ;; anything-c-source-emacs-commands
          ;; ;; Function:
          ;; anything-c-source-emacs-functions
          ;; anything-c-source-emacs-functions-with-abbrevs
          ;; ;; Variable:
          ;; anything-c-source-emacs-variables
          ;; ;; Bookmark:
          ;; anything-c-source-bookmarks
          ;; anything-c-source-bookmark-set
          ;; anything-c-source-bookmarks-ssh
          ;; anything-c-source-bookmarks-su
          ;; anything-c-source-bookmarks-local
          ;; ;; Library:
          ;; anything-c-source-elisp-library-scan
          ;; ;; Programming:
          ;; anything-c-source-imenu
          ;; anything-c-source-ctags
          ;; anything-c-source-semantic
          ;; anything-c-source-simple-call-tree-functions-callers
          ;; anything-c-source-simple-call-tree-callers-functions
          ;; anything-c-source-commands-and-options-in-file
          ;; ;; Color and Face:
          ;; anything-c-source-customize-face
          ;; anything-c-source-colors
          ;; ;; Search Engine:
          ;; anything-c-source-tracker-search
          ;; anything-c-source-mac-spotlight
          ;; ;; Kill ring:
          ;; anything-c-source-kill-ring
          ;; ;; Mark ring:
          ;; anything-c-source-global-mark-ring
          ;; ;; Register:
          ;; anything-c-source-register
          ;; ;; Headline Extraction:
          ;; anything-c-source-fixme
          ;; anything-c-source-rd-headline
          ;; anything-c-source-oddmuse-headline
          ;; anything-c-source-emacs-source-defun
          ;; anything-c-source-emacs-lisp-expectations
          ;; anything-c-source-emacs-lisp-toplevels
          ;; anything-c-source-org-headline
          ;; anything-c-source-eev-anchor
          ;; ;; Misc:
          ;; anything-c-source-evaluation-result
          ;; anything-c-source-calculation-result
          ;; anything-c-source-google-suggest
          ;; anything-c-source-call-source
          ;; anything-c-source-occur
          ;; anything-c-source-create
          ;; anything-c-source-minibuffer-history
          ;; ;; System:
          ;; anything-c-source-emacs-process
		  ;; auto-install elisps
		  anything-c-source-auto-install-from-emacswiki
		  anything-c-source-auto-install-from-library))

  ;; (unless mswin
  ;;   (add-to-list 'anything-sources 'anything-c-source-surfraw t)))
  )

(provide 'xy-rc-anything)
