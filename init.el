;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `init.el'
;; Time-stamp:<2011-02-01 Tue 20:52 xin on P6T>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My emacs init file
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; Enter debug mode on a error
;; (setq debug-on-error t)      ; now you should get a backtrace
;; Set max depth of dirctory
;; (setq max-specpdl-size 5)  ; default is 1000, reduce the backtrace level

;; Startup time
(defvar *emacs-load-start* (current-time))
;; Set a large message log file for checking
(setq message-log-max 10000)

(message "* ---[ Loading my Emacs init file ]---")

;; Add ~/.emacs.d/my-lisp to Emacs lisp load path 
(add-to-list 'load-path "~/.emacs.d/my-lisps")
(add-to-list 'load-path "~/.emacs.d/my-lisps/init")

;; Load environment settings
;; (require 'xy-rcroot-env)
;;(@file :file-name "xy-rcroot-env.el" :to "~/.emacs.d/my-lisps/init/xy-rcroot-env.el" :display "source")
(load "xy-rcroot-env")
(message "* ---[ `xy-rcroot-env.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Emacs apparence
;; (require 'xy-rcroot-app)
(load "xy-rcroot-app")
(message "* ---[ `xy-rcroot-app.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Some enhancements
;;(require 'xy-rcroot-enhance)
(load "xy-rcroot-enhance")
(message "* ---[ `xy-rcroot-enhance.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Viewing files settings
;; (require 'xy-rcroot-view)
(load "xy-rcroot-view")
(message "* ---[ `xy-rcroot-view.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Editing settings
;; (require 'xy-rcroot-edit)
(load "xy-rcroot-edit")
(message "* ---[ `xy-rcroot-edit.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Various abbrevations and auto-completions
;; (require 'xy-rcroot-complete)
(load "xy-rcroot-complete")
(message "* ---[ `xy-rcroot-complete.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Comparing files
;; (require 'xy-rcroot-diff)
(load "xy-rcroot-diff")
(message "* ---[ `xy-rcroot-diff.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Drawing settings
;; (require 'xy-rcroot-draw)
(load "xy-rcroot-draw")
(message "* ---[ `xy-rcroot-draw.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; File management
;; (require 'xy-rcroot-filemgr)
(load "xy-rcroot-filemgr")
(message "* ---[ `xy-rcroot-filemgr.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Web application packages
;; (require 'xy-rcroot-net)
(load "xy-rcroot-net")
(message "* ---[ `xy-rcroot-net.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; Document packages
;; (require 'xy-rcroot-write)
(load "xy-rcroot-write")
(message "* ---[ `xy-rcroot-write.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; 各种语言开发方面的总体设置
;; (require 'xy-rcroot-prog)
(load "xy-rcroot-prog")
(message "* ---[ `xy-rcroot-prog.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

(message "* ---[ My .emacs fully loaded in %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))
