;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-c.el'
;; Time-stamp:<2011-11-22 Tue 00:32 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `c' programming settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun cc-mode-settings ()
  "Settings for `cc-mode'."

  ;; (xy/set-font-default)
  (defalias 'cpp-mode 'c++-mode)
  
  (defun c-mode-common-hook-settings ()
    "Settings for `c-mode-common-hook'."

    (c-set-style "awk")
    ;; 饥饿的删除键
    (c-toggle-hungry-state)
    ;; 对subword进行操作，而不是整个word
    (subword-mode 1))
  
  (add-hook 'c-mode-hook
			'(lambda ()
			   (c-mode-common-hook-settings)
			   (turn-on-auto-fill)
			   ;; (require 'c-eldoc)
			   (c-turn-on-eldoc-mode)
			   ;; (xy/yas-start)
			   ;; (xy/linkd-start)
			   ))
  ;; (add-hook 'c-mode-common-hook 'c-mode-common-hook-settings)
  (add-to-list 'auto-mode-alist '("\\.hch" . c-mode))
  (add-to-list 'auto-mode-alist '("\\.hcc" . c-mode))
  (add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

  ;; (require 'kde-emacs-settings)

  ;; 高亮显示C/C++中的可能的错误(CWarn mode)
  (global-cwarn-mode 1)

  ;; 快速include一个系统/用户头文件
  ;; (mapc
  ;;  (lambda (mode)
  ;;    (define-abbrev-table mode '(("incy" "" skeleton-include 1)))
  ;;    (define-abbrev-table mode '(("incz" "" skeleton-include-user 1))))
  ;;  '(c-mode-abbrev-table c++-mode-abbrev-table))

  ;; 输入incy,可以自动提示输入文件名称,可以自动补全.
  ;; (define-skeleton skeleton-include
  ;;   "产生#include<>" "" > "#include <"
  ;;   (completing-read "包含系统头文件: "
  ;;                    (mapcar #'(lambda (f) (list f ))
  ;;                            (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
  ;;                                                   system-head-file-dir)))) ">\n")
  ;; (define-skeleton skeleton-include-user
  ;;   "产生#include\"\"" "" > "#include \""
  ;;   (completing-read "包含用户头文件: "
  ;;                    (mapcar #'(lambda (f) (list f ))
  ;;                            (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
  ;;                                                   user-head-file-dir)))) "\"\n")

  (mapc
   (lambda (mode)
   (define-abbrev-table mode '(("incd" "" skeleton-include 1))))
   '(c-mode-abbrev-table c++-mode-abbrev-table))
  
  (define-skeleton skeleton-include
    "产生#include\"\"" "" > "#include \""
    (completing-read "包含用户头文件: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    user-includ-dirs)))) "\"\n")

  (defvar c/c++-hightligh-included-files-key-map nil)
  (unless c/c++-hightligh-included-files-key-map
    (setq c/c++-hightligh-included-files-key-map (make-sparse-keymap))
    (define-key-list
      c/c++-hightligh-included-files-key-map
      `(("<RET>"    find-file-at-point)
        ("<return>" find-file-at-point))))

  (defun c/c++-hightligh-included-files ()
    (interactive)
    (when (or (eq major-mode 'c-mode)
              (eq major-mode 'c++-mode))
      (save-excursion
        (goto-char (point-min))
        ;; remove all overlay first
        (mapc (lambda (ov) (if (overlay-get ov 'c/c++-hightligh-included-files)
                               (delete-overlay ov)))
              (overlays-in (point-min) (point-max)))
        (while (re-search-forward "^[ \t]*#include[ \t]+[\"<]\\(.*\\)[\">]" nil t nil)
          (let* ((begin  (match-beginning 1))
                 (end (match-end 1))
                 (ov (make-overlay begin end)))
            (overlay-put ov 'c/c++-hightligh-included-files t)
            (overlay-put ov 'keymap c/c++-hightligh-included-files-key-map)
            (overlay-put ov 'face 'underline))))))
  ;; 这不是一个好办法，也可以把它加载到c-mode-hook or c++-mode-hook中
  (setq c/c++-hightligh-included-files-timer (run-with-idle-timer 0.5 t 'c/c++-hightligh-included-files))

  ;; c中隐藏ifdef
  (require 'hideif)

  ;; 为不同层次的ifdef着色
  (require 'ifdef)

  ;; 快速include
  (require 'c-includes)

  ;; 在 C 源代码中快速跳转，查找变量，函数
  (require 'xcscope))

(provide 'xy-rc-c)
