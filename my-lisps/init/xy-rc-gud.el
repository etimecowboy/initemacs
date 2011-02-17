;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-gud.el'
;; Time-stamp:<2011-02-17 Thu 15:52 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `gud.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun gud-settings ()
  "Settings of `gud.el'."

  ;; 退出gdb的时候关闭gdb对应的buffer
  ;;(add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit)
  ;; 显示gdb的鼠标提示
  ;; (gud-tooltip-mode 1))
  ;; 显示工具栏方便调试
  ;; (add-hook 'gdb-mode-hook
  ;; 			'(lambda ()
  ;; 			   ;; 退出gdb的时候关闭gdb对应的buffer
  ;; 			   (kill-buffer-when-shell-command-exit)
  ;; 			   (when window-system
  ;; 				 ;; 显示工具栏方便调试
  ;; 				 (toolbar-mode 1))))

  ;; 退出gdb的时候关闭gdb对应的buffer
  (add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit)
  ;; 显示工具栏方便调试
  (when window-system
	(tool-bar-mode 1))
  ;; 在一个新的 Frame 中调试
  (setq gdb-same-frame -1)
  ;; 多窗口的布局
  (setq gdb-many-windows t)
  ;; 输入输出单独用一个 Window
  (setq gdb-use-separate-io-buffer t)
  ;; 监视变量的 speedbar 自动弹出
  (setq gdb-speedbar-auto-raise t)
  ;; 显示gdb的鼠标提示
  (gud-tooltip-mode 1))
    
(provide 'xy-rc-gud.el)
