;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-yasnippet.el'
;; Time-stamp:<2011-11-21 Mon 14:24 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `yasnippet.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun xy/yas-start ()
  "Start yasnippet."
  (interactive)
  (require 'yasnippet)
  (yas/minor-mode-on))

;;;###autoload
(defun yasnippet-unbind-trigger-key ()
  "Unbind `yas/trigger-key'."
  (let ((key yas/trigger-key))
    (setq yas/trigger-key nil)
    (yas/trigger-key-reload key)))

;;;###autoload
(defun yasnippet-reload-after-save ()
  (let* ((bfn (expand-file-name (buffer-file-name)))
         (root (expand-file-name yas/root-directory)))
    (when (string-match (concat "^" root) bfn)
      (yas/load-snippet-buffer))))

;;;###autoload
(defun yasnippet-settings ()
  "settings for `yasnippet'."
  (setq yas/root-directory
        (concat my-emacs-path "/yasnippet/snippets"))

  ;; org mode TAB binding problem hack
  ;; (add-hook 'org-mode-hook
  ;;           #'(lambda ()
  ;;               (setq yas/fallback-behavior
  ;;                     `(apply ,(lookup-key org-mode-map [tab])))
  ;;               (local-set-key [tab] 'yas/expand)))
  ;; (setq yas/trigger-key "<tab>")
  (add-hook 'org-mode-hook
            (lambda ()
              (org-set-local 'yas/trigger-key "<tab>")
              (define-key yas/keymap "<tab>" 'yas/next-field-group)))
  ;; A workaround is to inhibit flyspell overlays 
  ;; while the snippet is active:
  (add-hook 'flyspell-incorrect-hook
            #'(lambda (dummy1 dummy2 dymmy3)
                (and yas/active-field-overlay
                     (overlay-buffer yas/active-field-overlay))))
  
  ;; (yasnippet-unbind-trigger-key)
  (add-hook 'after-save-hook 'yasnippet-reload-after-save)
  (yas/load-directory yas/root-directory))  

(provide 'xy-rc-yasnippet)
