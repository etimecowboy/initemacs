;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-font-lock.el'
;; Time-stamp:<2011-08-09 Tue 08:19 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `font-lock.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun font-lock-settings ()
  "Settings for `font-lock'."
  (progn
    ;; 增加自定义关键字
    (dolist (mode '(c-mode c++-mode java-mode lisp-mode emacs-lisp-mode
                           lisp-interaction-mode sh-mode sgml-mode
                           sh-mode vhdl-mode verilog-mode latex-mode
						   LaTeX-mode tex-mode TeX-mode c-mode cc-mode))
      (font-lock-add-keywords
       mode
       '(("\\<\\(BUG\\|TODO\\|HACK\\|NOTE\\|REF\\|DEBUG\\):"
          1 font-lock-warning-face prepend)
		 ;; BUG: 这里引起语法高亮失效
         ;; ("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)
         ;; ("(\\|)" . beautiful-blue-face)
         ;; ("\\[\\|]" . yellow-face)
         ;; ("<\\|>" . cyan-face)
         ;; ("{\\|}" . green-face)
         )))))

;;;###autoload
(defun font-lock-face-settings ()
  "Face settings for `font-lock'."
  ;; 语法着色
  ;; (if use-black-background
  ;; (progn
  (set-background-color "black")
  (set-foreground-color "white")
  (set-face-background 'default "black")
  (set-face-foreground 'default "white")
  (set-face-background 'region "lightgreen")
  (set-face-foreground 'region "darkred")
 
  ;; (set-cursor-color "red")
  
  (set-face-foreground 
   'font-lock-comment-face "darkred")
  (set-face-foreground 
   'font-lock-string-face "magenta")
  (custom-set-faces 
   '(font-lock-function-name-face
     ((((type tty)) :bold t :background "yellow" :foreground "blue")
      (t :background "#45D463DD4FF8" :foreground "yellow"))))
  (custom-set-faces 
   '(font-lock-constant-face
     ((((type tty)) :bold t :background "white" :foreground "blue")
      (t :background "darkslateblue" :foreground "chartreuse"))))
  (set-face-foreground 
   'font-lock-variable-name-face "#C892FFFF9957")
  (set-face-foreground 
   'font-lock-keyword-face "cyan")
  (custom-set-faces 
   '(font-lock-comment-delimiter-face
     ((((type tty)) :bold t :foreground "red")
      (t :foreground "chocolate1"))))
  (custom-set-faces 
   '(font-lock-warning-face 
     ((t (:background "red" :foreground "white")))))
  (custom-set-faces 
   '(font-lock-doc-face
     ((((type tty)) :foreground "green")
      (t (:foreground "maroon1")))))
  (custom-set-faces 
   '(font-lock-type-face
     ((((type tty)) :bold t :foreground "green")
      (t (:foreground "green")))))
  (custom-set-faces 
   '(font-lock-regexp-grouping-backslash
     ((((type tty)) :foreground "red")
      (t (:foreground "red")))))
  (custom-set-faces 
   '(font-lock-regexp-grouping-construct
     ((((type tty)) :foreground "yellow")
      (t (:foreground "yellow")))))
  )

(provide 'xy-rc-font-lock)
