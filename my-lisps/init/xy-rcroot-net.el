;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-net.el'
;; Time-stamp:<2011-11-26 Sat 15:01 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My web packages' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;----------------------------------------------------------------------
;;* url
(eval-after-load "w3m"
`(progn
   (w3m-settings)))

;;* w3m
;; Emacs中的文本浏览器w3m
;; http://emacser.com/w3m.htm
;; (require 'w3m-load)
(eval-after-load "w3m"
  `(progn
     (w3m-settings)))

;; (dolist (k '([right] [left] [up] [down]))
;;     (define-key w3m-mode-map k nil))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("M-M"     w3m-goto-url-new-session)
;;    ("C-x M-B" view-w3m-bookmark)
;;    ("C-x M-m" switch-to-w3m)))
;; Middle click to open url in a new sesstion (tab)
;; (define-key w3m-mode-map [mouse-2] 'w3m-mouse-view-this-url-new-session)

;; Use w3m as default web browser, but can also use external program
;; (Windows
;;   (setq browse-url-browser-function
;;         'browse-url-default-windows-browser))
;; (GNULinux
;;   (setq browse-url-browser-function
;;         'browse-url-default-browser))

;; (setq browse-url-browser-function 'browse-url-default-browser)
(setq browse-url-browser-function 'w3m-browse-url)

;; Abbrev quickurl
;; (setq quickurl-url-file (concat my-emacs-path "/quickurls"))

(global-set-key [f8]   'browse-url)
(global-set-key [S-f8] 'lookup-word-definition)
(global-set-key [C-f8] 'lookup-wikipedia)
(global-set-key [M-f8] 'google-region)

;;--------------------------------------------------------------------

;;* erc
;; ;; Emacs中的IRC
;; ;; ERC使用简介 emacser.com/erc.htm
;; (eval-after-load "erc" `(erc-settings))

;;---------------------------------------------------------------------

;;* weblogger and xml-rpc
;; Write blog with Emacs
;; (eval-after-load "weblogger"
;;   `(weblogger-settings))

;;---------------------------------------------------------------------

;;* org2blog
;; use publish org to HTML then use xml-rpc to blog
(eval-after-load "org2blog"
  `(org2blog-settings))

;;---------------------------------------------------------------------

;;* babel
;;; 网络翻译接口
(autoload 'babel "babel"
   "Use a web translation service to translate the message MSG." t)
(autoload 'babel-region "babel"
  "Use a web translation service to translate the current region." t)
(autoload 'babel-as-string "babel"
  "Use a web translation service to translate MSG, returning a string." t)
(autoload 'babel-buffer "babel"
  "Use a web translation service to translate the current buffer." t)
(eval-after-load "babel"
  '(progn
     (babel-settings)))

;; Key binds
;; (global-set-key [f12] 'babel)
;; (global-set-key [C-f12] 'babel-region)
(global-set-key [S-f12] 'babel-buffer)

;;---------------------------------------------------------------------

;;* dictionary
;; Web dictionary via dictd
;; (require 'dictionary-autoloads)
;; (global-set-key "\C-cS" 'dictionary-search)
;; (global-set-key "\C-cM" 'dictionary-match-words)
(global-set-key [f12] 'dictionary-search)
(global-set-key [C-f12] 'dictionary-match-words)

;;----------------------------------------------------------------------

;;* eagle
;; ;; twitter client
;; (require 'eagle-settings)
;; (require 'twit-settings)

;;---------------------------------------------------------------------

;;* google-maps-el
;; Emacs中的谷歌地图
;; ;; http://emacser.com/emacs-google-map.htm

;; (require 'google-maps)

;; (eal-define-keys
;;  'google-maps-static-mode-map
;;  `(("t"   sb-toggle-keep-buffer)
;;    ("'"   switch-to-other-buffer)
;;    ("="   google-maps-static-zoom-in)
;;    ("1"   delete-other-windows)
;;    ("2"   split-window-vertically)
;;    ("3"   split-window-horizontally)
;;    ("o"   other-window)
;;    ("C-t" google-maps-static-set-maptype)))

;; (defun google-maps-settings ()
;;   "Settings for `google-maps'.")

;; (eval-after-load "google-maps"
;;   `(google-maps-settings))

;;---------------------------------------------------------------------

;;* 查询天气预报

;; (require 'cn-weather)

;; (defalias 'weather 'cn-weather-today)
;; (defalias 'weather-tomorrow 'cn-weather-forecast)

;;----------------------------------------------------------------------

;;* emms
;; Emacs 音乐播放器
;; (autoload 'emms "emms-playlist-mode" nil t)
;; (autoload 'emms-browser "emms-browser" nil t)
;; (xy/emms-startit)
(eval-after-load "emms-playlist-mode"
  '(progn
     (emms-settings)))
(eal-define-keys-commonly
 dired-mode-map
 `(("|"    emms-add-dired)
   ("`"    emms-play-dired)))
(eal-define-keys-commonly
 global-map
 `(("C-x E b" emms-browser)
   ("C-x E f" emms-play-file)
   ("C-x E l" emms-play-playlist)
   ("C-x E d" emms-play-directory)
   ("C-x E m" emms-playlist-mode-go)
   ("C-x E p" emms-playlist-mode-go-popup)
   ("C-x E a" emms-add-directory)
   ("C-x E t" emms-add-directory-tree)
   ("C-x E <up>"      emms-start)
   ("C-x E <down>"    emms-pause)
   ;; ("C-x E S-<left>"  emms-previous)
   ;; ("C-x E S-<right>" emms-next)
   ;; ("C-x E <right>"   emms-seek-forward)
   ;; ("C-x E <left>"    emms-seek-backward)
   ("C-x E +"  emms-volume-raise)
   ("C-x E -"  emms-volume-lower)))

;;------------------------------------------------------------------------

;;* Gnus
;; news reader and email reader
(eval-after-load "gnus"
  `(gnus-settings))

;;------------------------------------------------------------------------

;;* Mew
;; email client
(setq mail-user-agent 'mew-user-agent)
;; load mew
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(autoload 'mew-user-agent-compose "mew" nil t)
(eval-after-load "mew"
  `(mew-settings))

;;--------------------------------------------------------------------------

(provide 'xy-rcroot-net)
