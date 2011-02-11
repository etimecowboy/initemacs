;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-zjl-hl.el'
;; Time-stamp:<2011-02-11 Fri 16:56 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `zjl-hl.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun zjl-hl-settings ()
  "Settings for `zjl-hl'."
  (setq zjl-hl-c++-mode-enable-flag t)
  (zjl-hl-enable-global-all-modes))

;;;###autoload
(defun zjl-hl-face-settings ()
  "Face settings for `zjl-hl'."

  ;; (custom-set-faces
  ;;  '(zjl-hl-function-call-face
  ;;    ((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;;     (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;;     (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;;     (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;;     (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;;     (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;;     (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;;     (t (:weight bold)))))

  ;; (custom-set-faces
  ;;  '(zjl-elisp-hl-function-call-face
  ;; 	 ((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;; 	  (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;; 	  (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;; 	  (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;; 	  (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;; 	  (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;; 	  (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;; 	  (t (:weight bold)))))

  ;; (custom-set-faces
  ;;  '(zjl-elisp-hl-setq-face
  ;; 	 ((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;; 	  (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;; 	  (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;; 	  (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;; 	  (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;; 	  (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;; 	  (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;; 	  (t (:weight bold)))))

  ;; (setq zjl-hl-function-call-face
  ;;    '((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;;     (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;;     (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;;     (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;;     (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;;     (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;;     (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;;     (t (:weight bold))))

  ;; (setq zjl-elisp-hl-function-call-face
  ;; 	 '((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;; 	  (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;; 	  (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;; 	  (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;; 	  (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;; 	  (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;; 	  (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;; 	  (t (:weight bold))))

  ;; (setq zjl-elisp-hl-setq-face
  ;; 	 '((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;; 	  (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;; 	  (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;; 	  (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;; 	  (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;; 	  (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;; 	  (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;; 	  (t (:weight bold))))

  ;; (setq zjl-hl-operators-face 'font-lock-type-face
  ;;       zjl-hl-local-variable-reference-face 'font-lock-variable-name-face
  ;;       zjl-hl-parameters-reference-face 'font-lock-variable-name-face
  ;;       zjl-hl-member-reference-face 'font-lock-variable-name-face
  ;;       zjl-elisp-hl-setq-face 'font-lock-keyword-face))
  )

(provide 'xy-rc-zjl-hl.el)
