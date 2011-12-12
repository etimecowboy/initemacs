;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ispell.el'
;; Time-stamp:<2011-12-12 Mon 06:16 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ispell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ispell-settings ()
  "Settings of `ispell.el'."
  ;; (setq ispell-program-name "aspell")
  ;; (setq ispell-dictionary "british")
  ;; (ispell-change-dictionary "british" t)
  ;; (ispell-change-dictionary "english" t)
  (GNULinux
   (setq  ispell-program-name "hunspell"
          ispell-alternate-dictionary "/usr/dict/words"
          ispell-complete-word-dict "/usr/dict/words"))

  (Windows
   (setq-default ispell-program-name "hunspell.exe"))

  (setq-default ispell-dictionary "en_GB_hunspell"
                ispell-choices-win-default-height 2
                ispell-following-word t
                ispell-help-in-bufferp nil
                ispell-local-dictionary nil
                ispell-personal-dictionary "~/emacs/ispell/personal.dict"
                ispell-query-replace-choices t
                ispell-silently-savep t
                ispell-skip-html (quote use-mode-name)
                ispell-skip-tib t
                ispell-use-framepop-p nil)

  (message "* ---[ ispell configuration is complete ]---"))

(provide 'xy-rc-ispell)
