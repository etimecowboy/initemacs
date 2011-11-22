;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `init.el'
;; Time-stamp:<2011-11-22 Tue 00:43 xin on p6t>
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

(message "* ---[ Loading my Emacs init file ]---")

;; Startup time
(defvar *emacs-load-start* (current-time))
;; Set a large message log file for checking
(setq message-log-max 10000)

;; Debug errors
(setq debug-on-error t)
;; (setq debug-on-quit t)

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

;; Viewing/Comparing files
;; (require 'xy-rcroot-view)
(load "xy-rcroot-view")
(message "* ---[ `xy-rcroot-view.el' loaded at %ds ]---"
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

;; Various programming settings
;; (require 'xy-rcroot-prog)
(load "xy-rcroot-prog")
(message "* ---[ `xy-rcroot-prog.el' loaded at %ds ]---"
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

;; Save editor information between emacs sessions
;; Must be put at last to avoid failing
;; (require 'xy-rcroot-session)
(load "xy-rcroot-session")
(message "* ---[ `xy-rcroot-session.el' loaded at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

(message "* ---[ My .emacs fully loaded in %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; this is the place I used to be
