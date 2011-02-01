;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auto-complete.el'
;; Time-stamp:<2011-02-01 Tue 02:46 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `auto-complete.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ac-settings-4-cc ()
  "`auto-complete' settings for `cc-mode'."
  (dolist (command `(c-electric-backspace
                     c-electric-backspace-kill))
    (add-to-list 'ac-trigger-commands-on-completing command)))

;;;###autoload
(defun ac-settings-4-c ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-dictionary
          ac-source-semantic
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

;;;###autoload
(defun ac-settings-4-cpp ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-dictionary
          ac-source-semantic
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

;;;###autoload
(defun ac-settings-4-autopair ()
  "`auto-complete' settings for `autopair'."
  (defun ac-trigger-command-p (command)
    "Return non-nil if `this-command' is a trigger command."
    (or
     (and
      (symbolp command)
      (or (memq command ac-trigger-commands)
          (string-match "self-insert-command" (symbol-name command))
          (string-match "electric" (symbol-name command))
          (let* ((autopair-emulation-alist nil)
                 (key (this-single-command-keys))
                 (beyond-autopair 
                  (or (key-binding key)
                      (key-binding 
                       (lookup-key local-function-key-map key)))))
            (or
             (memq beyond-autopair ac-trigger-commands)
             (and ac-completing
                  (memq beyond-autopair 
                        ac-trigger-commands-on-completing)))))))))

;;;###autoload
(defun ac-settings-4-lisp ()
  "Auto complete settings for lisp mode."

  (require 'auto-complete+)
  (setq ac-omni-completion-sources 
        '(("\\<featurep\s+'" ac+-source-elisp-features)
          ("\\<require\s+'"  ac+-source-elisp-features)
          ("\\<load\s+\""    ac-source-emacs-lisp-features)))
  ;; (ac+-apply-source-elisp-faces)
  (setq ac-sources
        '(ac-source-features
          ac-source-functions
          ac-source-yasnippet
          ac-source-variables
          ac-source-symbols
          ac-source-dictionary
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-files-in-current-dir
          ac-source-filename
          ac-source-words-in-same-mode-buffers)))

;;;###autoload
(defun ac-settings-4-java ()
  (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
                                         (cons "->" '(ac-source-semantic))))
  (setq ac-sources
        '(ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

;;;###autoload
(defun ac-settings-4-text ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-imenu)))

;;;###autoload
(defun ac-settings-4-org ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-imenu)))

;;;###autoload
(defun ac-settings-4-eshell ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename
          ac-source-symbols
          ac-source-imenu)))

;; ;;;###autoload
;; (defun ac-settings-4-ruby ()
;;   (require 'rcodetools-settings)
;;   (setq ac-omni-completion-sources
;;         (list (cons "\\." '(ac-source-rcodetools))
;;               (cons "::" '(ac-source-rcodetools)))))

;; ;;;###autoload
;; (defun ac-settings-4-html ()
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-same-mode-buffers
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))

;; ;;;###autoload
;; (defun ac-settings-4-tcl ()
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-same-mode-buffers
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))

;; ;;;###autoload
;; (defun ac-settings-4-awk ()
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-same-mode-buffers
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))

;;;###autoload
(defun ac-start-use-sources (sources)
  (interactive)
  (let ((ac-sources sources))
    (call-interactively 'ac-start)))

;;;###autoload
(defun auto-complete-settings ()
  "Settings for `auto-complete'."
  
  (require 'auto-complete+)

  (setq help-xref-following nil) 
  
  (add-to-list 'ac-dictionary-directories 
               (concat my-emacs-path "/auto-complete/ac-dict"))

  (setq ac-comphist-file 
        (concat my-emacs-path "/auto-complete/ac-comphist"))

  (setq ac-auto-show-menu t
        ac-auto-start t
        ac-dwim t
        ac-candidate-limit ac-menu-height
        ac-quick-help-delay .5
        ac-disable-faces nil)

  (set-default 'ac-sources
               '(ac-source-semantic-raw
                 ac-source-yasnippet
                 ac-source-dictionary
                 ac-source-abbrev
                 ac-source-words-in-buffer
                 ac-source-words-in-same-mode-buffers
                 ac-source-imenu
                 ac-source-files-in-current-dir
                 ac-source-filename))
  ;; (setq ac-modes ac+-modes)
)


(provide 'xy-rc-auto-complete)
