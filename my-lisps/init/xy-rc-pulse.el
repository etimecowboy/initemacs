;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-pulse.el'
;; Time-stamp:<2011-11-26 Sat 03:01 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `pulse.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun pulse-settings ()
  "Settings for `pulse'."

  (defadvice exchange-point-and-mark-nomark (after pulse-advice activate)
    "Cause the line that is `goto'd to pulse when the cursor gets there."
    (when (and pulse-command-advice-flag (interactive-p)
               (> (abs (- (point) (mark))) 400))
      (pulse-momentary-highlight-one-line (point))))

  (defadvice switch-to-buffer (after pulse-advice activate)
    "Cause the current line of new buffer to pulse when the cursor gets there."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

  ;; (defadvice ido-switch-buffer (after pulse-advice activate)
  ;;   "Cause the current line of new buffer to pulse when the cursor gets there."
  ;;   (when (and pulse-command-advice-flag (interactive-p))
  ;;     (pulse-momentary-highlight-one-line (point))))

  ;; (defadvice visit-.emacs (after pulse-advice activate)
  ;;   "Cause the current line of .emacs buffer to pulse when the cursor gets there."
  ;;   (when (and pulse-command-advice-flag (interactive-p))
  ;;     (pulse-momentary-highlight-one-line (point))))

  (defadvice beginning-of-buffer (after pulse-advice activate)
    "Cause the current line of buffer to pulse when the cursor gets there."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))

  (pulse-toggle-integration-advice t))

;;;###autoload
(defun pulse-face-settings ()
  "Face settings for `pulse'."

  (custom-set-faces
   '(pulse-highlight-start-face
     ((((class color) (min-colors 88) (background dark)) :background "#AAAA33")
      (((class color) (min-colors 88) (background light)) :background "#FFFFAA")
      (((class color) (min-colors 8)) :background "blue" :foreground "red")))))

(provide 'xy-rc-pulse)
