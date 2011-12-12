;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ibuffer.el'
;; Time-stamp:<2011-12-12 Mon 04:48 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ibuffer.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ibuffer-settings ()
  "Settings of `ibuffer'."
  ;; ibuffer, advanced replacement for the `buffer-menu
  ;; (if is-before-emacs-21 (require 'ibuffer-for-21))

  ;; select-buffer,
  ;; 像linux系统下alt-tab那样选择buffer, 但是更直观, 更方便
  ;; (require 'select-buffer)

  (setq ibuffer-default-sorting-mode '(major-mode))

  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/IbufferMode" :display "emacswiki")
  ;; Use human readable Size column instead of original one
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (cond
     ((> (buffer-size) 1000) (format "%7.3fk" (/ (buffer-size) 1000.0)))
     ((> (buffer-size) 1000000) (format "%7.3fM" (/ (buffer-size) 1000000.0)))
     (t (format "%8d" (buffer-size)))))
  ;; Modify the default ibuffer-formats
  (setq ibuffer-formats
        '((mark modified read-only " "
                (name 35 35 :left :elide)
                " | "
                (size-h 9 -1 :right)
                " | "
                (mode 16 16 :left :elide)
                " | "
                (filename-and-process 30 30 :left :elide))))

  ;; (setq ibuffer-formats
  ;;     '((mark modified read-only " " (name 25 25 :left :elide) " "
  ;;             (size 9 -1 :right) " " (mode 16 16 :left :elide) " "
  ;;             filename-and-process)
  ;;       (mark " " (name 16 -1) " " filename)))

  (setq ibuffer-saved-filter-groups
        '(("default"
           ("c"   (or
                   (mode . c-mode)
                   (mode . cc-mode)))
           ("hdl" (or
                   (mode . vhdl-mode)
                   (mode . verilog-mode)))
           ("org" (or
                   (mode . org-mode)
                   (name . "^\\*Org Agenda\\*$")
                   (name . "^\\*Org Select\\*$")
                   (name . "^\\*Capture\\*$")
                   (name . "^\\*Calendar\\*$")
                   (name . "^diary$")
                   ))
           ("tex" (or
                   (mode . latex-mode)
                   (mode . LaTeX-mode)
                   (mode . tex-mode)
                   (mode . TeX-mode)))
           ("lisp" (or
                    (mode . emacs-lisp-mode)
                    (mode . lisp-interaction-mode)))
           ;; ("vc"  (or
           ;;            (mode . egg-status)
           ;;            (mode . egg-log-msg-mode)
           ;;            (name .  "^\\*Egg:Select Action\\*$")))
           ("dired" (mode . dired-mode))
           ("emacs" (or
                     (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$")
                     (name . "^\\*Compile-Log\\*$")
                     (name . "^\\*Completions\\*$")
                     (name . "^\\*WoMan-Log\\*$")
                     (name . "^\\*Backtrace\\*$")
                     (mode . Custom-mode)
                     (mode . help-mode)
                     (mode . Info-mode)
                     (mode . woman-mode)
                     (mode . apropos-mode)))
           ("gnus"  (or
                     (mode . message-mode)
                     (mode . bbdb-mode)
                     (mode . mail-mode)
                     (mode . gnus-group-mode)
                     (mode . gnus-summary-mode)
                     (mode . gnus-article-mode)
                     (mode . gnus-article-edit-mode)
                     (mode . gnus-binary-mode)
                     (mode . gnus-browse-mode)
                     (mode . gnus-carpal-mode)
                     (mode . gnus-category-mode)
                     (mode . gnus-dead-summary-mode)
                     (mode . gnus-draft-mode)
                     (mode . gnus-mailing-list-mode)
                     (mode . gnus-message-citation-mode)
                     (mode . gnus-pick-mode)
                     (mode . gnus-score-mode)
                     (mode . gnus-sticky-article-mode)
                     (mode . gnus-topic-mode)
                     (mode . gnus-tree-mode)
                     (mode . gnus-undo-mode)
                     (name . "^\\.bbdb$")
                     (name . "^newsrc-dribble$")))
           ("mew" (or
                   (mode . mew-addrbook-mode)
                   (mode . mew-summary-mode)
                   (mode . mew-message-mode)
                   (mode . mew-draft-mode)
                   (mode . mew-header-mode)
                   (mode . mew-goto-msg-mode)
                   (mode . mew-visual-mode)))
           ("emms" (or
                    (mode . emms-playlist-mode)
                    (mode . emms-browser-mode)))
           )))

  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-switch-to-saved-filter-groups "default")))

  (message "* ---[ ibuffer configuration is complete ]---")
  )

(provide 'xy-rc-ibuffer)
