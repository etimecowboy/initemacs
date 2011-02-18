;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 

;; change log

;;* Self customisations
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(semantic-c-dependency-system-include-path (quote ("/usr/include" "E:/program/MinGW/include")))
)

 

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(compilation-info ((((type tty)) :bold t :foreground "green") (t :foreground "green")))
 '(compilation-warning ((((class color)) :foreground "red" :bold nil)))
 '(diredp-date-time ((((type tty)) :foreground "yellow") (t :foreground "goldenrod1")))
 '(diredp-dir-heading ((((type tty)) :background "yellow" :foreground "blue") (t :background "Pink" :foreground "DarkOrchid1")))
 '(diredp-display-msg ((((type tty)) :foreground "blue") (t :foreground "cornflower blue")))
 '(ediff-current-diff-A ((((type tty)) :background "yellow" :foreground "blue") (t :background "DarkSeaGreen3" :foreground "blue violet")))
 '(ediff-current-diff-B ((((type tty)) :background "yellow" :foreground "black") (t :background "DodgerBlue1" :foreground "gray11")))
 '(ediff-fine-diff-A ((((type tty)) :background "blue" :foreground "white") (t :background "gold1" :foreground "red")))
 '(ediff-fine-diff-B ((((type tty)) :background "cyan" :foreground "red") (t :background "chocolate2" :foreground "dark slate blue")))
 '(eldoc-highlight-function-argument ((((type tty)) :bold t :foreground "green") (t :bold nil :foreground "green")))
 '(font-lock-comment-delimiter-face ((((type tty)) :bold t :foreground "red") (t :foreground "chocolate1")))
 '(font-lock-constant-face ((((type tty)) :bold t :background "white" :foreground "blue") (t :background "darkslateblue" :foreground "chartreuse")))
 '(font-lock-doc-face ((((type tty)) :foreground "green") (t (:foreground "maroon1"))))
 '(font-lock-function-name-face ((((type tty)) :bold t :background "yellow" :foreground "blue") (t :background "#45D463DD4FF8" :foreground "yellow")))
 '(font-lock-regexp-grouping-backslash ((((type tty)) :foreground "red") (t (:foreground "red"))))
 '(font-lock-regexp-grouping-construct ((((type tty)) :foreground "yellow") (t (:foreground "yellow"))))
 '(font-lock-type-face ((((type tty)) :bold t :foreground "green") (t (:foreground "green"))))
 '(font-lock-warning-face ((t (:background "red" :foreground "white"))))
 '(highlight-symbol-face ((((type tty)) :background "white" :foreground "black") (((class color) (background dark)) :background "gray30" :foreground "#AD0DE2FAFFFF") (((class color) (background light)) :background "gray90")))
 '(info-header-node ((((class color) (background dark)) (:foreground "red"))))
 '(info-menu-header ((((type tty pc)) :underline t :weight bold) (t :inherit nil :foreground "coral2" :bold nil)))
 '(info-quoted-name ((((type tty)) :bold t :foreground "green") (t :foreground "cornflower blue")))
 '(info-reference-item ((((type tty pc)) :background "white" :foreground "black") (t :background "white" :foreground "cornflower blue")))
 '(info-title-1 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "yellow")))
 '(info-title-2 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "lightblue")))
 '(info-title-3 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "violetred1")))
 '(info-title-4 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "green")))
 '(info-xref ((((type tty)) :inherit link) (t :foreground "#165ACBD1FFFF" :underline t)))
 '(isearch-fail ((((class color)) (:background "red"))))
 '(linum ((((background dark)) :foreground "cyan") (t :foreground "gray")))
 '(match ((((class color) (min-colors 88) (background light)) :background "yellow1") (((class color) (min-colors 88) (background dark)) :background "RoyalBlue3" :foreground "cyan") (((class color) (min-colors 8) (background light)) :background "yellow" :foreground "black") (((class color) (min-colors 8) (background dark)) :background "blue" :foreground "white") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
 '(moccur-face ((((type tty)) :bold t :foreground "red") (t :bold nil :foreground "red")))
 '(pulse-highlight-start-face ((((class color) (min-colors 88) (background dark)) :background "#AAAA33") (((class color) (min-colors 88) (background light)) :background "#FFFFAA") (((class color) (min-colors 8)) :background "blue" :foreground "red")))
 '(woman-bold ((((class color)) :foreground "red" :bold nil)))
 '(zjl-elisp-hl-function-call-face ((((class grayscale) (background light)) :foreground "LightGray" :weight bold) (((class grayscale) (background dark)) :foreground "DimGray" :weight bold) (((class color) (min-colors 88) (background light)) :foreground "Orchid") (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue") (((class color) (min-colors 16) (background light)) :foreground "Orchid") (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue") (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold))))
 '(zjl-elisp-hl-setq-face ((((class grayscale) (background light)) :foreground "LightGray" :weight bold) (((class grayscale) (background dark)) :foreground "DimGray" :weight bold) (((class color) (min-colors 88) (background light)) :foreground "Orchid") (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue") (((class color) (min-colors 16) (background light)) :foreground "Orchid") (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue") (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold))))
 '(zjl-hl-elisp-function-call-face ((((class color) (background dark)) (:foreground "cornflower blue" :height 1.15))))
 '(zjl-hl-elisp-setq-face ((((class color) (background dark)) (:foreground "cyan"))))
 '(zjl-hl-font-lock-bracket-face ((((class color) (background dark)) (:foreground "firebrick3" :weight bold :height 1.2))))
 '(zjl-hl-function-call-face ((t (:foreground "cornflower blue" :height 1.15))))
 '(zjl-hl-local-variable-reference-face ((((class color) (background dark)) nil)))
 '(zjl-hl-number-face ((((class color) (background dark)) (:foreground "red"))))
 '(zjl-hl-operators-face ((((class color) (background dark)) (:foreground "Green" :weight bold))))
 '(zjl-hl-parameters-reference-face ((((class color) (background dark)) (:foreground "Yellow" :weight bold)))))
