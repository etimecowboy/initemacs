;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-rainbow-delimiters.el'
;; Time-stamp:<2011-08-20 Sat 22:09 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `rainbow-delimiters.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)
(require 'eval-after-load)

;;;###autoload
(defun rainbow-delimiters-settings ()
  "Settings for `rainbow-delimiters'."

  (setq-default frame-background-mode 'dark)
  (custom-set-faces
   '(rainbow-delimiters-depth-1-face ((((background dark)) (:foreground "grey30"))))
   '(rainbow-delimiters-depth-2-face ((((background dark)) (:foreground "grey50"))))
   '(rainbow-delimiters-depth-3-face ((((background dark)) (:foreground "grey70"))))
   '(rainbow-delimiters-depth-4-face ((((background dark)) (:foreground "white"))))
   '(rainbow-delimiters-depth-5-face ((((background dark)) (:foreground "lightgreen"))))
   '(rainbow-delimiters-depth-6-face ((((background dark)) (:foreground "forestgreen"))))
   '(rainbow-delimiters-depth-7-face ((((background dark)) (:foreground "green"))))
   '(rainbow-delimiters-depth-8-face ((((background dark)) (:foreground "darkgreen"))))
   '(rainbow-delimiters-depth-9-face ((((background dark)) (:foreground "yellow"))))
   '(rainbow-delimiters-unmatched-face ((((background dark)) (:foreground "red")))))
  )
  

(provide 'xy-rc-rainbow-delimiters)
