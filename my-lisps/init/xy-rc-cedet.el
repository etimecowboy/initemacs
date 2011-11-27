;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-cedet.el'
;; Time-stamp:<2011-11-27 Sun 20:00 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `cedet' programming settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun xy/cedet-start ()
  "Start CEDET programming environment"

  (interactive)
  (require 'cedet)
  (revert-buffer))

;;;###autoload
(defun cedet-settings ()
  "Settings for `cedet'."

  ;; semantic
  ;; (semantic-load-enable-minimum-features)
  (semantic-load-enable-code-helpers)
  ;; (semantic-load-enable-gaudy-code-helpers)
  ;; (semantic-load-enable-excessive-code-helpers)
  (global-semantic-decoration-mode 1)

  (require 'semantic-decorate-include nil 'noerror)

  (semantic-toggle-decoration-style "semantic-tag-boundary" -1)

  (if window-system
      (semantic-load-enable-semantic-debugging-helpers)
    (progn (global-semantic-show-unmatched-syntax-mode 1)
           (global-semantic-show-parser-state-mode 1)))
  (ignore-errors (semantic-load-enable-primary-exuberent-ctags-support))

  ;;------------------------------------------------------------

  ;; srecode
  (global-srecode-minor-mode 1)

  ;;------------------------------------------------------------

  ;; ede
  (global-ede-mode 1)

  (when (executable-find "global")
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode)
    (setq ede-locate-setup-options '(ede-locate-global ede-locate-base)))

  ;;-------------------------------------------------------------

  ;; senator
  ;; (global-senator-minor-mode -1)

  ;;-------------------------------------------------------------

  ;; More settings about semantic

  (require 'semantic-c nil 'noerror)
  ;; (setq semantic-c-obey-conditional-section-parsing-flag nil) ; ignore #if

  (when (executable-find "gcc")
    (semantic-gcc-setup))

  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        user-include-dirs)

  (dolist (file c-preprocessor-symbol-files)
    (when (file-exists-p file)
      (setq semantic-lex-c-preprocessor-symbol-file
            (append semantic-lex-c-preprocessor-symbol-file (list file)))))

  ;; (if window-system
  ;;     (define-key c-mode-base-map "\C-c " 'semantic-ia-complete-symbol-menu)
  ;;   (define-key c-mode-base-map "\C-c " 'semantic-ia-complete-symbol))
  ;; (define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)

  (defun semantic-ia-fast-jump-back ()
    (interactive)
    (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
        (error "Semantic Bookmark ring is currently empty"))
    (let* ((ring (oref semantic-mru-bookmark-ring ring))
           (alist (semantic-mrub-ring-to-assoc-list ring))
           (first (cdr (car alist))))
      ;; (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
      ;;     (setq first (cdr (car (cdr alist)))))
      (semantic-mrub-visit first)
      (ring-remove ring 0)))

  (defun semantic-ia-fast-jump-or-back (&optional back)
    (interactive "P")
    (if back
        (semantic-ia-fast-jump-back)
      (semantic-ia-fast-jump (point))))

  (when (and window-system
             (> emacs-major-version 21)
             (require 'semantic-tag-folding nil 'noerror))
    (global-semantic-tag-folding-mode 1))

  (when (require 'eassist nil 'noerror)
    (setq eassist-header-switches
          '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
            ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
            ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
            ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
            ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
            ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
            ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
            ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
            ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
            ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
            ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
            ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
            ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
            ("c" . ("h"))
            ("m" . ("h"))
            ("mm" . ("h")))))

  ;;-------------------------------------------------

  ;; speedbar
  (setq speedbar-use-images t
        speedbar-track-mouse-flag nil
        speedbar-update-flag nil
        speedbar-show-unknown-files t
        speedbar-directory-unshown-regexp
        "^\\(CVS\\|RCS\\|SCCS\\|_darcs\\|\\.\\(git\\|hg\\|svn\\)\\)\\'")

  (eval-after-load 'speedbar
    '(progn
       ;; some dired-like bindings
       (define-key speedbar-key-map (kbd ";") 'speedbar-up-directory)
       (define-key speedbar-key-map (kbd "f") 'speedbar-edit-line)))

  ;;---------------------------------------------------

  ;; zjl-hl, use semantic to highlight functions
  ;; (require 'zjl-hl)
  ;; (zjl-hl-enable-global-all-modes)

  ;;---------------------------------------------------

 )

(provide 'xy-rc-cedet)

;; if want to use offical cedet
;; (let ((cedet-possible-dirs
;;        '((concat my-local-lisp-path "/cedet-1.0pre6")
;;          (concat my-local-lisp-path "/cedet-1.0pre7")
;;          (concat my-local-lisp-path "/cedet-1.0"))))
;;   (dolist (dir cedet-possible-dirs)
;;     (let ((default-directory (expand-file-name dir)))
;;       (when (file-exists-p default-directory)
;;         (add-to-list 'load-path default-directory)
;;         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;             (normal-top-level-add-subdirs-to-load-path))))))

;; (when (and (or (not (boundp 'semantic-mode))
;;                (and (boundp 'semantic-mode) (null semantic-mode)))
;;            (locate-library "semantic-ctxt") ; offical cedet
;;            (require 'cedet nil 'noerror))
