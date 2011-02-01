;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-diff.el'
;; Time-stamp:<2011-01-30 Sun 18:11 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Compare files in Emacs
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; diff-mode

;; (eal-define-keys
;;  'diff-mode-map
;;  `(("C-k" diff-hunk-kill)
;;    ("SPC" scroll-up)
;;    ("'"   switch-to-other-buffer)
;;    ("Q"   kill-this-buffer)
;;    ("u"   View-scroll-half-page-backward)))

;; (eal-define-keys
;;  'diff-mode-shared-map
;;  `(("k" previous-line)
;;    ("K" roll-up)))

(eval-after-load "diff-mode"
  `(progn
     (diff-face-settings)
     (diff-settings)))

;;----------------------------------------------------------------------

;; ediff mode

(global-set-key (kbd "C-x D") 'ediff)

;; (defun ediff-keys ()
;;   (interactive)
;;   "`ediff-mode'的按键设置"
;;   (define-prefix-command 'ediff-R-map)
;;   (define-key-list
;;     ediff-mode-map
;;     `(("# w" ediff+-toggle-ignore-whitespace)
;;       ("u"   ediff-update-diffs)
;;       ("/"   ediff-toggle-help)
;;       ("c"   ediff-inferior-compare-regions)
;;       ("f"   ediff-jump-to-difference)
;;       ("j"   ediff+-previous-line)
;;       ("k"   ediff-scroll-vertically)
;;       ("R"   ediff-R-map)
;;       ("R a" ediff-toggle-read-only)
;;       ("R b" ediff-toggle-read-only)
;;       ("o"   other-window)
;;       ("A"   ediff+-goto-buffer-a)
;;       ("B"   ediff+-goto-buffer-b))))

;; (add-hook 'ediff-keymap-setup-hook 'ediff-keys)

(eval-after-load "ediff"
  `(progn
     (ediff-face-settings)
     (ediff-settings)))

;;----------------------------------------------------------------

(provide 'xy-rcroot-diff)
