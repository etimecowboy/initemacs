;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-cedet.el'
;; Time-stamp:<2011-11-23 Wed 00:54 xin on P6T-WIN7>
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

  ;; (global-srecode-minor-mode 1)

  (global-ede-mode 1)

  (when (executable-find "global")
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode)
    (setq ede-locate-setup-options '(ede-locate-global ede-locate-base)))
  ;; (setq semantic-c-obey-conditional-section-parsing-flag nil) ; ignore #if

  (require 'semantic-c nil 'noerror)

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

  (pulse-toggle-integration-advice (if window-system 1 -1))

  (defadvice cua-exchange-point-and-mark (after pulse-advice activate)
    "Cause the line that is `goto'd to pulse when the cursor gets there."
    (when (and pulse-command-advice-flag (interactive-p)
               (> (abs (- (point) (mark))) 400))
      (pulse-momentary-highlight-one-line (point))))

  (defadvice switch-to-buffer (after pulse-advice activate)
    "After switch-to-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

  (defadvice previous-buffer (after pulse-advice activate)
    "After previous-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

  (defadvice next-buffer (after pulse-advice activate)
    "After next-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

  (defadvice ido-switch-buffer (after pulse-advice activate)
    "After ido-switch-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

  (defadvice beginning-of-buffer (after pulse-advice activate)
    "After beginning-of-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

  (defadvice viss-bookmark-next-buffer (after pulse-advice activate)
    "After viss-bookmark-next-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

  (defadvice viss-bookmark-prev-buffer (after pulse-advice activate)
    "After viss-bookmark-prev-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

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

  ;; zjl-hl, use semantic to highlight functions 
  (require 'zjl-hl)
  ;; (zjl-hl-enable-global-all-modes)
 )

(provide 'xy-rc-cedet)
