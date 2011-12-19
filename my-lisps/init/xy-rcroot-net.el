;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-net.el'
;; Time-stamp:<2011-12-19 Mon 07:40 xin on P6T-WIN7>
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

;;====================================================================
;;* url
(eval-after-load "url" '(url-settings))

;; Abbrev quickurl
;; (setq quickurl-url-file (concat my-emacs-path "/quickurls"))

;;====================================================================
;; Use external program as the default web browser in X-window
(if window-system
    (progn
      (Windows
       (setq browse-url-browser-function
             'browse-url-default-windows-browser))
      (GNULinux
       (setq browse-url-browser-function
             'browse-url-default-browser)))
  (setq browse-url-browser-function 'w3m-browse-url))

;;====================================================================
;;* w3m
(eval-after-load "w3m"
  '(progn
     (w3m-settings)
     (eal-define-keys
      'w3m-mode-map
      `(("C-x W f"      w3m-external-view-current-url)
        ("C-x W F"      w3m-external-view-this-url)
        ("C-x W o"      org-w3m-copy-for-org-mode) ;; copy region as org format
        ("S-<mouse-1>"  w3m-mouse-view-this-url-new-session)
        ("<mouse-3>"    w3m-mouse-major-mode-menu)
        ("C-x W s"      w3m-save-current-buffer)
        ("C-x W w"      w3m-weather)
        ("C-x W l"      w3m-copy-current-url)))))

(eal-define-keys-commonly
 global-map
 `(("C-x W n"     w3m-goto-url-new-session)
   ("C-x W b"     view-w3m-bookmark)
   ("C-x W w"     switch-to-w3m)
   ("<f8>"        browse-url)
   ("S-<f8>"      lookup-word-definition)
   ("C-<f8>"      lookup-wikipedia)
   ("M-<f8>"      google-region)))

(setq browse-url-generic-program "w3m") ;; It won't affect emacs
                                        ;; default browser
(global-set-key (kbd "<f6> w") 'w3m)

;;====================================================================
;;* erc
;; (eval-after-load "erc" '(erc-settings))

;;====================================================================
;;* weblogger
;; (eval-after-load "weblogger" '(weblogger-settings))

;;====================================================================
;;* org2blog
;; use publish org to HTML then use xml-rpc to blog
(eval-after-load "org2blog" '(org2blog-settings))

;;====================================================================
;;* babel
;; 网络翻译接口
(autoload 'babel "babel"
   "Use a web translation service to translate the message MSG." t)
(autoload 'babel-region "babel"
  "Use a web translation service to translate the current region." t)
(autoload 'babel-as-string "babel"
  "Use a web translation service to translate MSG, returning a string." t)
(autoload 'babel-buffer "babel"
  "Use a web translation service to translate the current buffer." t)
(eval-after-load "babel" '(babel-settings))
;; (global-set-key [f12] 'babel)
(global-set-key (kbd "S-<f12>") 'babel-region)
;; (global-set-key (kbd "S-<f12>") 'babel-buffer)

;;====================================================================
;;* dictionary
;; Web dictionary via dictd
;; (require 'dictionary-autoloads)
;; (global-set-key "\C-cS" 'dictionary-search)
;; (global-set-key "\C-cM" 'dictionary-match-words)
(global-set-key (kbd "<f12>") 'dictionary-search)
(global-set-key (kbd "C-<f12>") 'dictionary-match-words)

;;====================================================================
;;* eagle
;; twitter client

;;====================================================================
;;* google-maps-el
;; REF: (@url :file-name "http://emacser.com/emacs-google-map.htm" :display "emacswiki")
;; (eval-after-load "google-maps"
;;   '(progn
;;     (google-maps-settings)))
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
;; (require 'google-maps)

;;====================================================================
;;* cn-weather
;; (require 'cn-weather)
;; (defalias 'weather 'cn-weather-today)
;; (defalias 'weather-tomorrow 'cn-weather-forecast)

;;====================================================================
;;* emms
;; Emacs 音乐播放器
(eval-after-load "emms-playlist-mode"
  '(progn
     (emms-settings)
     (eal-define-keys
     'emms-playlist-mode-map
      `(("<space>" emms-pause)
        ("<double-mouse-1>" emms-pause)))))

(eal-define-keys-commonly
 dired-mode-map
 `(("C-x a"    emms-add-dired)
   ("C-x p"    emms-play-dired)))

(eal-define-keys-commonly
 global-map
 `(("<f6> e"  xy/emms-start)
   ("C-x E b" emms-browser)
   ("C-x E f" emms-play-file)
   ("C-x E l" emms-play-playlist)
   ("C-x E s" emms-playlist-save)
   ("C-x E d" emms-play-directory)
   ("C-x E m" emms-playlist-mode-go)
   ("C-x E p" emms-playlist-mode-go-popup)
   ("C-x E a" emms-add-directory)
   ("C-x E t" emms-add-directory-tree)
   ("C-x E <up>"      emms-start)
   ("C-x E <down>"    emms-pause)
   ("C-x E <left>"    emms-previous)
   ("C-x E <right>"   emms-next)
   ;; ("C-x E <right>"   emms-seek-forward)
   ;; ("C-x E <left>"    emms-seek-backward)
   ;; BUG: Only works in Linux with `amixer' installed
   ("C-x E +"  emms-volume-raise)
   ("C-x E -"  emms-volume-lower)))

;;====================================================================
;;* gnus
;; 新闻组阅读
(eval-after-load "gnus"
  '(progn
     (gnus-settings)
     (define-key gnus-summary-mode-map (kbd "<f6>")
       'my-archive-article)))
(global-set-key (kbd "<f6> g") 'gnus)

;;====================================================================
;;* mew
;; email client
(eval-after-load "mew" '(mew-settings))
(setq mail-user-agent 'mew-user-agent) ;; set mew as emacs email agent
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(autoload 'mew-user-agent-compose "mew" nil t)
(global-set-key (kbd "<f6> m") 'mew)

(provide 'xy-rcroot-net)
