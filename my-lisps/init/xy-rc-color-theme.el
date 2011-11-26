;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-color-theme.el'
;; Time-stamp:<2011-11-26 Sat 02:53 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `color-theme.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; REF:  http://orgmode.org/worg/org-color-themes.html

;;;###autoload
(defun xy/color-theme-start ()
  "Start color-theme."

  (interactive)
  (require 'color-theme)
  (color-theme-initialize)
)

;;;###autoload
(defun color-theme-settings ()
  "Settings of `color-theme.el'."

  ;; (color-theme-initialize)
  (setq color-theme-is-global t)
  (setq color-theme-is-cumulative t)
  ;; (setq color-theme-directory (concat my-local-lisp-path "/theme"))

  ;; Author distributed themes in `color-theme-library.el'
  ;; (autoload 'color-theme-gnome "color-theme-library" nil t)
  ;; (autoload 'color-theme-blue-gnus "color-theme-library" nil t)
  ;; (autoload 'color-theme-dark-gnus "color-theme-library" nil t)
  ;; (autoload 'color-theme-blue-eshell "color-theme-library" nil t)
  ;; (autoload 'color-theme-salmon-font-lock "color-theme-library" nil t)
  ;; (autoload 'color-theme-dark-font-lock "color-theme-library" nil t)
  ;; (autoload 'color-theme-dark-info "color-theme-library" nil t)
  ;; (autoload 'color-theme-gnome2 "color-theme-library" nil t)
  ;; (autoload 'color-theme-simple-1 "color-theme-library" nil t)
  ;; (autoload 'color-theme-jonadabian "color-theme-library" nil t)
  ;; (autoload 'color-theme-ryerson "color-theme-library" nil t)
  ;; (autoload 'color-theme-wheat "color-theme-library" nil t)
  ;; (autoload 'color-theme-standard "color-theme-library" nil t)
  ;; (autoload 'color-theme-fischmeister "color-theme-library" nil t)
  ;; (autoload 'color-theme-sitaramv-solaris "color-theme-library" nil t)
  ;; (autoload 'color-theme-sitaramv-nt "color-theme-library" nil t)
  ;; (autoload 'color-theme-billw "color-theme-library" nil t)
  ;; (autoload 'color-theme-retro-green "color-theme-library" nil t)
  ;; (autoload 'color-theme-retro-orange "color-theme-library" nil t)
  ;; (autoload 'color-theme-subtle-hacker "color-theme-library" nil t)
  ;; (autoload 'color-theme-pok-wog "color-theme-library" nil t)
  ;; (autoload 'color-theme-pok-wob "color-theme-library" nil t)
  ;; (autoload 'color-theme-blue-sea "color-theme-library" nil t)
  ;; (autoload 'color-theme-rotor "color-theme-library" nil t)
  ;; (autoload 'color-theme-pierson "color-theme-library" nil t)
  ;; (autoload 'color-theme-xemacs "color-theme-library" nil t)
  ;; (autoload 'color-theme-jsc-light "color-theme-library" nil t)
  ;; (autoload 'color-theme-jsc-dark "color-theme-library" nil t)
  ;; (autoload 'color-theme-greiner "color-theme-library" nil t)
  ;; (autoload 'color-theme-jb-simple "color-theme-library" nil t)
  ;; (autoload 'color-theme-beige-diff "color-theme-library" nil t)
  ;; (autoload 'color-theme-standard-ediff "color-theme-library" nil t)
  ;; (autoload 'color-theme-beige-eshell "color-theme-library" nil t)
  ;; (autoload 'color-theme-goldenrod "color-theme-library" nil t)
  ;; (autoload 'color-theme-ramangalahy "color-theme-library" nil t)
  ;; (autoload 'color-theme-raspopovic "color-theme-library" nil t)
  ;; (autoload 'color-theme-taylor "color-theme-library" nil t)
  ;; (autoload 'color-theme-marquardt "color-theme-library" nil t)
  ;; (autoload 'color-theme-parus "color-theme-library" nil t)
  ;; (autoload 'color-theme-high-contrast "color-theme-library" nil t)
  ;; (autoload 'color-theme-infodoc "color-theme-library" nil t)
  ;; (autoload 'color-theme-classic "color-theme-library" nil t)
  ;; (autoload 'color-theme-scintilla "color-theme-library" nil t)
  ;; (autoload 'color-theme-gtk-ide "color-theme-library" nil t)
  ;; (autoload 'color-theme-midnight "color-theme-library" nil t)
  ;; (autoload 'color-theme-jedit-grey "color-theme-library" nil t)
  ;; (autoload 'color-theme-snow "color-theme-library" nil t)
  ;; (autoload 'color-theme-montz "color-theme-library" nil t)
  ;; (autoload 'color-theme-aalto-light "color-theme-library" nil t)
  ;; (autoload 'color-theme-aalto-dark "color-theme-library" nil t)
  ;; (autoload 'color-theme-blippblopp "color-theme-library" nil t)
  ;; (autoload 'color-theme-hober "color-theme-library" nil t)
  ;; (autoload 'color-theme-bharadwaj "color-theme-library" nil t)
  ;; (autoload 'color-theme-oswald "color-theme-library" nil t)
  ;; (autoload 'color-theme-salmon-diff "color-theme-library" nil t)
  ;; (autoload 'color-theme-robin-hood "color-theme-library" nil t)
  ;; (autoload 'color-theme-snowish "color-theme-library" nil t)
  ;; (autoload 'color-theme-dark-laptop "color-theme-library" nil t)
  ;; (autoload 'color-theme-taming-mr-arneson "color-theme-library" nil t)
  ;; (autoload 'color-theme-digital-ofs1 "color-theme-library" nil t)
  ;; (autoload 'color-theme-mistyday "color-theme-library" nil t)
  ;; (autoload 'color-theme-marine "color-theme-library" nil t)
  ;; (autoload 'color-theme-blue-erc "color-theme-library" nil t)
  ;; (autoload 'color-theme-dark-erc "color-theme-library" nil t)
  ;; (autoload 'color-theme-subtle-blue "color-theme-library" nil t)
  ;; (autoload 'color-theme-dark-blue "color-theme-library" nil t)
  ;; (autoload 'color-theme-jonadabian-slate "color-theme-library" nil t)
  ;; (autoload 'color-theme-gray1 "color-theme-library" nil t)
  ;; (autoload 'color-theme-word-perfect "color-theme-library" nil t)
  ;; (autoload 'color-theme-emacs-21 "color-theme-library" nil t)
  ;; (autoload 'color-theme-jsc-light2 "color-theme-library" nil t)
  ;; (autoload 'color-theme-ld-dark "color-theme-library" nil t)
  ;; (autoload 'color-theme-deep-blue "color-theme-library" nil t)
  ;; (autoload 'color-theme-kingsajz "color-theme-library" nil t)
  ;; (autoload 'color-theme-comidia "color-theme-library" nil t)
  ;; (autoload 'color-theme-katester "color-theme-library" nil t)
  ;; (autoload 'color-theme-arjen "color-theme-library" nil t)
  ;; (autoload 'color-theme-tty-dark "color-theme-library" nil t)
  ;; (autoload 'color-theme-aliceblue "color-theme-library" nil t)
  ;; (autoload 'color-theme-black-on-gray "color-theme-library" nil t)
  ;; (autoload 'color-theme-dark-blue2 "color-theme-library" nil t)
  ;; (autoload 'color-theme-blue-mood "color-theme-library" nil t)
  ;; (autoload 'color-theme-euphoria "color-theme-library" nil t)
  ;; (autoload 'color-theme-resolve "color-theme-library" nil t)
  ;; (autoload 'color-theme-xp "color-theme-library" nil t)
  ;; (autoload 'color-theme-gray30 "color-theme-library" nil t)
  ;; (autoload 'color-theme-dark-green "color-theme-library" nil t)
  ;; (autoload 'color-theme-whateveryouwant "color-theme-library" nil t)
  ;; (autoload 'color-theme-bharadwaj-slate "color-theme-library" nil t)
  ;; (autoload 'color-theme-lethe "color-theme-library" nil t)
  ;; (autoload 'color-theme-shaman "color-theme-library" nil t)
  ;; (autoload 'color-theme-emacs-nw "color-theme-library" nil t)
  ;; (autoload 'color-theme-late-night "color-theme-library" nil t)
  ;; (autoload 'color-theme-clarity "color-theme-library" nil t)
  ;; (autoload 'color-theme-andreas "color-theme-library" nil t)
  ;; (autoload 'color-theme-charcoal-black "color-theme-library" nil t)
  ;; (autoload 'color-theme-vim-colors "color-theme-library" nil t)
  ;; (autoload 'color-theme-calm-forest "color-theme-library" nil t)
  ;; (autoload 'color-theme-lawrence "color-theme-library" nil t)
  ;; (autoload 'color-theme-matrix "color-theme-library" nil t)
  ;; (autoload 'color-theme-feng-shui "color-theme-library" nil t)
  ;; (autoload 'color-theme-renegade "color-theme-library" nil t)

  ;; Set default color-theme
  ;; (color-theme-xy-dark)
  (color-theme-solarized-dark)
  ;; (color-theme-zenburn)

  ;; create some frames with different color themes
  ;; (let ((color-theme-is-global nil))
  ;;     (select-frame (make-frame))
  ;;     (color-theme-standard)
  ;;     (select-frame (make-frame))
  ;;     (color-theme-standard))

  ;; NOTE: ahei's settings
  ;; (setq my-color-themes (list
  ;;                          'color-theme-tangotango
  ;;                          'color-theme-colorful-obsolescence
  ;;                          'color-theme-zenburn
  ;;                          'color-theme-leuven
  ;;                          'color-theme-folio
  ;;                          'color-theme-manoj
  ;;                          'color-theme-zenash
  ;;                          'color-theme-railscast
  ;;                          ))

  ;; (defun my-theme-set-default () ; Set the first row
  ;;     (interactive)
  ;;     (setq theme-current my-color-themes)
  ;;     (funcall (car theme-current)))

  ;; (defun my-describe-theme () ; Show the current theme
  ;;     (interactive)
  ;;     (message "%s" (car theme-current)))

  ;; ; Set the next theme (fixed by Chris Webber - tanks)
  ;; (defun my-theme-cycle ()
  ;;     (interactive)
  ;;     (setq theme-current (cdr theme-current))
  ;;     (if (null theme-current)
  ;;         (setq theme-current my-color-themes))
  ;;     (funcall (car theme-current))
  ;;     (message "%S" (car theme-current)))

  ;; (setq theme-current my-color-themes)
  ;; (setq color-theme-is-global nil) ; Initialization
  ;; (my-theme-set-default)
  ;; (global-set-key [f4] 'my-theme-cycle)
)

(provide 'xy-rc-color-theme)
