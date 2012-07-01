;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:41 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-env.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My Emacs environment settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; Turn on Common Lisp support by loading cl (common lisp) package
(require 'cl)
;; `Header' for my Emacs configuration
(require 'xy-rc-utils)

;;====================================================================
;;* User information

(setq user-full-name "Xin Yang")
(setq user-mail-address "xin2.yang@gmail.com")

;;====================================================================
;;* Debug Emacs init

;; Set a large message log file for checking
(setq message-log-max 100000)

;; Debug errors
;; M-x toggle-debug-on-quit使用这条命令后，每次卡住后，马上按C-g，就会
;; 打出当前执行函数的调用栈，是哪个函数造成的卡住，也就一目了然了。然后
;; 根据这个造成卡住的函数属于哪个扩展包，再分别想解决办法。

(setq debug-on-error t)
;; (setq debug-on-quit t) ;; 平时太烦人

;; Compilation message
;; (setq compilation-auto-jump-to-first-error t)
;; (setq compilation-scroll-output t)

(setq max-specpdl-size 80000)  ;; BUG: in nw mode, Emacs 23.3 report a
;; error in spite of how large the value is. It may related to an
;; Emacs bug. Moreover, if the size set too large, it cause a error in
;; Windows.
(setq max-lisp-eval-depth 40000)

;; try to improve slow performance on windows.
(Windows (setq w32-get-true-file-attributes nil))

;; Change default major mode of *scratch* buffer
;; (setq initial-major-mode 'text-mode)
;; Change default text in the *scratch* buffer

;; NOTE: a warnning message is nessary for emacs fans like me
(setq initial-scratch-message
      ";; Emacs is a work TOOL other than a computer toy!
;; Playing with Emacs is fun, but your work in hand is MUCH MORE important!
;; Press \"C-c a p\" now to check your tasks today.
;; GETTING THINGS DONE from now on!
")

;;====================================================================
;;* Emacs generated customization

(setq custom-file (concat my-init-lisp-path "/xy-rcroot-auto.el"))
;; (load "xy-rcroot-auto")

;;====================================================================
;;* Search pathes

;; Load pathes
;; NOTE: add all = very slow
(fni/add-to-load-path my-emacswiki-lisp-path)
(fni/add-to-load-path my-local-lisp-path 'with-subdirs 'recursive)
(fni/add-to-load-path my-own-lisp-path 'with-subdirs 'recursive)
(message "* ---[ load-path added at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))
;; Image (icon) files
(fni/add-to-image-load-path my-local-image-path
                            'with-subdirs 'recursive)
;; Exec binaries
(add-to-list 'exec-path my-local-exec-path)
(Windows
 (add-to-list 'exec-path (concat my-local-exec-path "/win32"))
 ;; (add-to-list 'exec-path (concat my-local-exec-path
 ;;                                 "/win32/aspell/bin"))
 (add-to-list 'exec-path
              (concat my-local-exec-path "/win32/hunspell"))
 (add-to-list 'exec-path
              (concat my-local-exec-path "/win32/stunnel"))
)
;; NOTE: Linux don't need it
(GNULinux
  (add-to-list 'exec-path (concat my-local-exec-path "/lin64")))

;; Info files
;; NOTE: auto-customised by setting `Info-additional-directory-list'
;;   (add-to-list 'Info-additional-directory-list "~/.emacs.d/info")
;; But seems not working
(add-to-list 'Info-default-directory-list my-local-info-path)
;; Man files
;; NOTE: additional manual(man) pathes are added in `woman-settings'

;;====================================================================
;;* Install additional lisp packages

;; NOTE: There is a (@url :file-name "https://github.com/emacsmirror" :display "Github site")
;;       which has a lot of emacs git sources. You can always check it.

;;** ELPA packages

;; Packages installed via `package.el'.

;; `package.el' is now part of GNU Emacs 24. You can get the
;; latest at http://bit.ly/pkg-el while the last version that's
;; compatible with Emacs 23 is at http://bit.ly/pkg-el23

;;--------------------------------------------------------------------
;;** Manual installed lisps

;;*** Small/single lisps installed

;; NOTE: don't load all the emacswiki lisps, they might cause
;; conflictions with other lisps
;; ;; Download from emacswiki, via `auto-install'
(xy/load-autoload my-emacswiki-lisp-path)
;; (message "* ---[ my local lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; Seperately collected/downloaded lisps.
(xy/load-autoload my-local-lisp-path)
(message "* ---[ my own lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;;--------------------------------------------------------------------
;;*** Bigger packages

;; Packages with version numbers are stable releases, while
;; packages without version numbers are development versions

;; REF: (@url :file-name "http://code.google.com/p/dea/" :display "SVN Source")
(xy/load-autoload (concat my-local-lisp-path "/dea"))
(message "* ---[ dea lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; ;; REF: (@url :file-name "https://github.com/wanderlust" :display "GIT Source")
;; ;; NOTE: apel, flim, semi, and mule-ucs are very old packages.
;; ;; NOTE: These packages are closly related. They are widely used by
;; ;;       Japanese developers that developed `mew', `wanderlust',
;; ;;       `emacs-w3m', and etc.
;; ;; NOTE: Some lisps cause errors while byte-compiled, and they are
;; ;;       put in the `bug' sub-folders.
;; ;; NOTE: Just put these packages in the load-path. Other lisps can
;; ;;       load them when required.
;; ;; NOTE: No need to have a git submodule for them. I don't upgrade
;; ;;       them very often.
;; (xy/load-autoload (concat my-local-lisp-path "/apel"))
;; (message "* ---[ apel lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))
;; ;; NOTE: flim has a lisp `mailcap.el' which shadows the emacs
;; ;;       version one.
;; (xy/load-autoload (concat my-local-lisp-path "/flim"))
;; (message "* ---[ flim lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))
;; (xy/load-autoload (concat my-local-lisp-path "/semi"))
;; (message "* ---[ semi lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))
;; ;; REF: (@url :file-name "http://mailcrypt.sourceforge.net/" :display "Source")
;; (xy/load-autoload (concat my-local-lisp-path "/mailcrypt-3.5.8"))
;; (message "* ---[ mailcrypt lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))
;; ;; REF: (@url :file-name "http://tats.haun.org/mule-ucs/" :display "Source")
;; ;; (require 'un-define) ;; NOTE: The first thing the manual says to
;;                         ;; include it in the init.el
;; (xy/install-all-lisps
;;  (concat my-local-lisp-path "/mule-ucs-20061127-1/lisp"))
;; ;;  'with-subdirs 'recursive)
;; (message "* ---[ mule-ucs lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))
;; ;; REF: (@url :file-name "https://github.com/wanderlust" :display "Source")
;; (xy/load-autoload (concat my-local-lisp-path "/wanderlust")))
;; (message "* ---[ wanderlust lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; REF: (@url :file-name "http://repo.or.cz/w/anything-config.git" :display "Git Source")
(xy/load-autoload (concat my-local-lisp-path "/anything-config"))
(xy/load-autoload (concat my-local-lisp-path "/anything-config/extensions"))
(xy/load-autoload (concat my-local-lisp-path "/anything-config/contrib"))
(message "* ---[ anything lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; NOTE: auctex are patched by myself to make it works in my system.
;; (the latex style file `url.el' of auctex conflicts with the
;; standard `url.el')
;; NOTE: I am using cvs `auctex' instead of the old ELPA one.
;; REF: (@url :file-name "http://www.gnu.org/s/auctex/" :display "Source")
;; (load "auctex.el" nil t t)           ;; auctex
;; (load "preview-latex.el" nil t t)    ;; preview-latex
;; (xy/load-autoload (concat my-local-lisp-path "/auctex-11.86-mypatched"))
;; (message "* ---[ auctex installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))
(add-to-list 'load-path "~/.emacs.d/auctex")

;; ;; REF: (@url :file-name "https://github.com/m2ym/fuzzy-el" :display "Git Source")
;; ;; NOTE: MUST before `auto-complete'
;; (xy/load-autoload (concat my-local-lisp-path "/fuzzy-el"))
;; (message "* ---[ fuzzy-el installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; ;; REF: (@url :file-name "https://github.com/m2ym/popup-el" :display "Git Source")
;; ;; NOTE: MUST before `auto-complete'
;; (xy/load-autoload (concat my-local-lisp-path "/popup-el"))
;; (message "* ---[ popup-el installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; ;; REF: (@url :file-name "http://cx4a.org/software/auto-complete/" :display "Website")
;; ;;      (@url :file-name "https://github.com/m2ym/auto-complete" :display "Git Source")
;; (xy/load-autoload (concat my-local-lisp-path "/auto-complete"))
;; (message "* ---[ auto-complete installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; REF: (@url :file-name "http://code.google.com/p/ac-math/" :display "SVN Source")
(xy/load-autoload (concat my-local-lisp-path "/ac-math"))
(message "* ---[ ac-math lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; ;; REF: (@url :file-name "https://github.com/juergenhoetzel/babel" :display "Git Source")
;; (xy/load-autoload (concat my-local-lisp-path "/babel"))
;; (message "* ---[ babel installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; REF:  (@url :file-name "http://cc-mode.sourceforge.net/" :display "Source")
(xy/load-autoload (concat my-local-lisp-path "/cc-mode-5.32.3"))
(message "* ---[ cc-mode lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; NOTE: CEDET can be installed by its `cedet-built.el' script, and
;; will be load when `M-x xy/cedet-start' which is a function write
;; by myself.
;; REF: (@url :file-name "http://cedet.sourceforge.net/" :display "Source")

;; ;; REF: (@url :file-name "https://github.com/bogolisk/egg" :display "Git Source")
;; ;; NOTE: Very old. Use `magit' instead of it.
;; (xy/load-autoload (concat my-local-lisp-path "/egg"))
;; (message "* ---[ egg lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; REF: - (@url :file-name "https://github.com/viogus/eim" :display "Website")
;;      - (@url :file-name "http://ywb-codes.googlecode.com/svn/trunk/emacs/eim" :display "Git Source")
;; NOTE: Seems no one is maitaining this package. Very old. No
;;       need to have a git submodule for it.
(xy/load-autoload (concat my-local-lisp-path "/eim-2.4"))
(message "* ---[ eim lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; REF: (@url :file-name "https://launchpad.net/ibus.el" :display "Brz Source")
(xy/load-autoload (concat my-local-lisp-path "/ibus-el-0.3.2"))
(message "* ---[ ibus-el lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; REF: (@url :file-name "http://matlab-emacs.sourceforge.net/" :display "CVS Source")
(xy/load-autoload (concat my-local-lisp-path "/matlab-emacs"))
(message "* ---[ matlab-emacs lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; REF: (@url :file-name "http://www.mew.org/en/" :display "Source")
(xy/load-autoload (concat my-local-lisp-path "/mew-6.5"))
(message "* ---[ mew lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; REF: (@url :file-name "https://github.com/punchagan/org2blog" :display "Git Source")
(xy/load-autoload (concat my-local-lisp-path "/org2blog"))
(message "* ---[ org2blog lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; REF: (@url :file-name "http://emacs-w3m.namazu.org/index-en.html" :display "CVS Source")
;; BUG: current cvs version has a bug when compiling
(xy/load-autoload (concat my-local-lisp-path "/emacs-w3m/shimbun"))
(xy/load-autoload (concat my-local-lisp-path "/emacs-w3m"))
(message "* ---[ emacs-w3m lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; REF: (@url :file-name "http://cristal.inria.fr/whizzytex/" :display "Source")
;; NOTE: NOT very useful, bad Chinese support
;; (xy/load-autoload (concat my-local-lisp-path "/whizzytex/src"))
;; (message "* ---[ whizzytex lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; ;; REF: (@url :file-name "http://julien.danjou.info/software/google-maps.el" :display "Source")
;; ;;      (@url :file-name "http://git.naquadah.org/?p=google-maps.git;a=summary" :display "Git Source")
;; (xy/load-autoload (concat my-local-lisp-path "/google-maps"))
;; (message "* ---[ google-maps lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; REF: (@url :file-name "https://github.com/austin-----/weibo.emacs" :display "Git Source")
;; NOTE: NOT work
;; (xy/load-autoload (concat my-local-lisp-path "/weibo"))
;; (message "* ---[ weibo lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; REF: (@url :file-name "https://github.com/magit/magit" :display "Git Source")
;; NOTE: use ELPA package instead.
;; (xy/load-autoload (concat my-local-lisp-path "/magit"))
;; (message "* ---[ magit lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

;; REF: (@url :file-name "https://github.com/lewang/command-log-mode" :display "Git Source")
(xy/load-autoload (concat my-local-lisp-path "/command-log-mode"))
(message "* ---[ command-log-mode lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; REF: (@url :file-name "http://www.dr-qubit.org/emacs.php#predictive" :display "Git Source")
;; NOTE: I have very slow git connection with it, then a git submodule
;; is not possible
;; NOTE: It makes emacs quite slow. I don't like it.
;; (xy/load-autoload (concat my-local-lisp-path "/predictive"))
;; (message "* ---[ predictive lisps installed at %ds ]---"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*)
;;                            (second *emacs-load-start*)))))

(add-to-list 'load-path "~/.emacs.d/themes")
(xy/load-autoload "~/.emacs.d/themes")
(message "* ---[ theme lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;;** My own lisps
;; Include init files and my own hacks, make sure they are installed
;; at last to make my hacks work.
(xy/install-all-lisps my-own-lisp-path 'with-subdirs 'recursive)
(message "* ---[ Emacswiki lisps installed at %ds ]---"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

;; NOTE: Another scheme for managing Emacs configurations
;; REF: - (@url :file-name "http://www.emacswiki.org/emacs/DotEmacsModular" :display "emacswiki")
;;      - (@url :file-name "http://www.emacswiki.org/emacs/elinstall" :display "emacswiki")
;; (autoload 'my-site-start "my-site-start" nil t)
;; (my-site-start "~/.emacs.d/site-start.d/")
;; NOTE: el-get is another apporach

;;====================================================================
;;* Emacs help system customisation

;;** Info
(eval-after-load "info"
  '(progn
     ;; (info-settings)
     (eal-define-keys
      'Info-mode-map
      `(("j"         next-line)
        ("k"         previous-line)
        ("h"         backward-char)
        ("l"         forward-char)
        ;; ("J"         emaci-roll-down)
        ;; ("K"         emaci-roll-up)
        ("f"         am-forward-word-or-to-word)
        ("/"         describe-symbol-at-point)
        ("U"         Info-up)
        ("u"         View-scroll-half-page-backward)
        ("Q"         kill-this-buffer)
        ("o"         other-window)
        ;; ("S-SPC"     View-scroll-half-page-backward)
        ;; ("SPC"       View-scroll-half-page-forward)
        ("C-h"       Info-up)
        ("N"         Info-next-reference)
        ("P"         Info-prev-reference)
        ("."         find-symbol-at-point)
        ("<mouse-4>" mwheel-scroll)
        ("<mouse-5>" mwheel-scroll)
        ("<backspace>"   Info-history-back)
        ("<S-backspace>" Info-history-forward)))))
;; (require 'info+)
;; (apply-args-list-to-fun
 ;; 'def-command-max-window `("info"))
(global-set-key (kbd "C-<f1>") 'info)

;;--------------------------------------------------------------------
;;** Man
(eval-after-load "man"
  '(progn
     (man-settings)
     (eal-define-keys
      'Man-mode-map
      `(("Q"     Man-kill)
        ("1"     delete-other-windows)
        ("2"     split-window-vertically)
        ("3"     split-window-horizontally)
        ("u"     View-scroll-half-page-backward)
        ("S-SPC" View-scroll-half-page-backward)
        ("SPC"   View-scroll-half-page-forward)
        ("w"     scroll-down)
        ("d"     scroll-up)
        ("f"     am-forward-word-or-to-word)
        ("b"     emaci-b)
        ("n"     emaci-n)
        ("p"     emaci-p)
        ("N"     Man-next-section)
        ("P"     Man-previous-section)
        ("m"     back-to-indentation)
        ("M-j"   Man-goto-section)
        ("."     set-mark-command)
        ("g"     emaci-g)
        ("'"     switch-to-other-buffer)))))
(global-set-key (kbd "S-<f1>") 'man-follow)
(eal-define-keys
 `(c-mode-base-map sh-mode-map)
 `(("C-c /" man-current-word)))

;;*** woman settings
(eval-after-load "woman" '(woman-settings))
(global-set-key (kbd "M-<f1>") 'woman)

;;--------------------------------------------------------------------
;;** help
(eval-after-load "help-mode"
  '(progn
     (help-mode-settings)
     (eal-define-keys
      'help-mode-map
      `(("B"   help-go-back)
        ("F"   help-go-forward)
        ("f"   am-forward-word-or-to-word)
        ("d"   scroll-up)
        ("w"   scroll-down)
        ("C-h" help-go-back)
        ("C-;" help-go-forward)
        ("n"   forward-button)
        ("p"   backward-button)
        ("q"   delete-current-window)
        ("'"   switch-to-other-buffer)
        ("u"   View-scroll-half-page-backward)
        ("SPC" scroll-up)
        ("."   find-symbol-at-point)
        ("/"   describe-symbol-at-point)))))
;; (global-set-key (kbd "C-x H") 'goto-help-buffer)

;;*** help+
;; (require 'help+)
;;    `C-h u'      `manual-entry'
;;    `C-h C-a'    `apropos'
;;    `C-h C-l'    `locate-library'
;;    `C-h RET'    `help-on-click/key'
;;    `C-h M-a'    `apropos-documentation'
;;    `C-h M-o'    `pop-to-help-toggle'
;;    `C-h C-M-a'  `tags-apropos'
;;    [mouse-1]    `mouse-help-on-click' (non-mode-line)
;;    [mouse-1]    `mouse-help-on-mode-line-click' (mode-line)
(global-set-key (kbd "<f1>") 'help-on-click/key)

;;*** describe-symbol
;; ahei 非常方便的查看emacs帮助的插件, 没有 `help+' 方便但是有些很好的
;; 功能
(eal-define-keys `(emacs-lisp-mode-map
           lisp-interaction-mode-map
           completion-list-mode-map
           help-mode-map
           debugger-mode-map)
 `(("C-<f3>"   describe-symbol-at-point)
   ;; ("C-c M-v" describe-variable-at-point)
   ;; ("C-c M-f" describe-function-at-point)
   ;; ("C-M-<f3>" describe-face-at-point)
   ("M-<f3>"   find-symbol-at-point)
   ;; ("C-c C-h" find-symbol-go-back)
   ;; ("C-c M-V" find-symbol-var-at-point)
   ;; ("C-c M-F" find-symbol-fun-at-point)
   ;; ("C-c M-S" find-symbol-face-at-point)
   ("C-S-<f3>" where-is-at-point)))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x C-k" describe-key-sb)
;;    ("C-x C-m" describe-mode)
;;    ("C-x / A" describe-face)
;;    ("C-x / a" apropos)
;;    ("C-x A"   apropos-command)
;;    ("C-x C-d" find-symbol-sb)
;;    ("C-x K"   find-symbol-fun-on-key-sb)
;;    (,(if window-system "C-x C-/" "C-x C-_") describe-symbol-sb)))

;;--------------------------------------------------------------------
;;** log
;;*** mwe-log-commands ;;NOTE: it is very old and I am using a fork
                       ;;      `command-log-mode.el' of it.
;; This add-on can be used to demo Emacs to an audience.  When
;; activated, keystrokes get logged into a designated buffer, along
;; with the command bound to them.
;; To enable, use e.g.:
;;   (add-hook 'LaTeX-mode-hook (function mwe:log-keyboard-commands))
;; To see the log buffer, call M-x mwe:open-command-log-buffer.
;; To start logging, call M-x mwe:log-keyboard-commands

(autoload 'command-log-mode "command-log-mode" "\
Toggle keyboard command logging of current buffer.

\(fn &optional ARG)" t nil)

(autoload 'global-command-log-mode "command-log-mode" "\
Toggle keyboard command logging of whole emacs.

\(fn &optional ARG)" t nil)

;;====================================================================
;;* Language environment

;; Use clipboard with x-window system
(setq x-select-enable-clipboard t)

;; Time string format
(setq system-time-locale "C")

;; 设置 sentence-end 可以识别中文断句。
(setq sentence-end
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")

;;--------------------------------------------------------------------
;;** System encodings
(set-language-environment 'UTF-8)
;; NOTE: `default-buffer-file-coding-system' is an obsolete variable
;; (as of Emacs 23.2); use `buffer-file-coding-system'
;; instead.
;; (setq default-buffer-file-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-sendmail-coding-system 'utf-8-unix)

;; NOTE: git would not display chinese characters properly if
;; `default-terminal-coding-system' and
;; `default-process-coding-system' are set to gbk
(Windows
 ;; (let ((code (or file-name-coding-system default-file-name-coding-system)))
 ;;   (setq default-process-coding-system (cons code code))))
  (setq default-file-name-coding-system 'gbk-dos)
  ;; (setq default-terminal-coding-system 'gbk-dos)
  (setq default-terminal-coding-system 'utf-8-unix)
  ;; (setq default-process-coding-system '(gbk-dos . gbk-dos)))
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix)))

(GNULinux
  (setq default-file-name-coding-system 'utf-8-unix)
  (setq default-terminal-coding-system 'utf-8-unix)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix)))
  ;; (setq default-terminal-coding-system 'gbk-dos)
  ;; (setq default-process-coding-system '(gbk-dos . gbk-dos)))

;;--------------------------------------------------------------------
;;** Fonts
;; Use scalable fonts
(setq scalable-fonts-allowed t)

;;*** Emacs auto font selection for different OS
;; REF: (@url :file-name "http://emacser.com/torture-emacs.htm" :display "emacser")
(xy/set-font-write-big)
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook cc-mode-hook c-mode-hook
;;    c++-mode-hook sh-mode-hook vhdl-mode-hook verilog-mode-hook
;;    matlab-mode-hook)
;;  'xy/set-font-prog)
;; (am-add-hooks
;;  `(LaTeX-mode-hook latex-mode-hook tex-mode-hook
;;    muse-mode-hook w3m-mode-hook Info-mode-hook
;;    ;; org-mode-hook ;; NOTE: not to bother me when capturing notes
;;    gnus-startup-hook mew-summary-mode-hook)
;;  'xy/set-font-write)
(global-set-key (kbd "C-x F d") 'xy/set-font-default)
(global-set-key (kbd "C-x F w") 'xy/set-font-write)
(global-set-key (kbd "C-x F m") 'xy/set-font-write-2)
(global-set-key (kbd "C-x F p") 'xy/set-font-prog)
(global-set-key (kbd "C-x F D") 'xy/set-font-default-big)
(global-set-key (kbd "C-x F W") 'xy/set-font-write-big)
;; (global-set-key (kbd "C-x F M") 'xy/set-font-write-2)
(global-set-key (kbd "C-x F P") 'xy/set-font-prog-big)
(global-set-key (kbd "C-x F A") 'xy/daemon-after)

;;*** Font scale by mouse wheel
(GNULinux
 (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
 (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease))
(Windows
 (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
 (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease))

;;--------------------------------------------------------------------
;;** Chinese input method
;; NOTE: 现在 Emacs 下没什么好的中文输入法，还是用操作系统自带的输入法。
;;       除非不在图形系统下，才用 Emacs 内置的输入法或 eim。
;;*** eim
;; another Emacs input-method
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/InputMethods" :display "emacswiki")
;;   Basic usage:
;;   - `M-x set-input-method': switch to a new input method.
;;   - `C-h C-\' or `C-h I': describe the current input method.
;;   - `C-\': toggle the input method on and off
;;   To activate the input method on a per-buffer basis.
;;   1. Put the following lines in the .emacs:
;;      (set input-activate nil)
;;      (add-hook 'find-file-hook
;;        (lambda ()(if (eq input-activate t) (toggle-input-method))))
;;   2. Then put the following line at the beginning of a file:
;;       -*- input-activate: t -*-
;;   3. The input method will be activated for this file as soon loaded.
;;   如何輸入繁體:
;;      把 py.txt, otherpy.txt,  pychr.txt 用軟件轉成了繁體，然後重新
;;   打開 emacs。這樣使用軟件自動轉換肯定是不精確的，有些地方會出現錯
;;   誤。比如"碼表"被搞成了"碼錶"。
(eval-after-load "eim"
  '(progn
     (eim-settings)
     (when (require 'eim-extra nil 'noerror)
       (global-set-key ";" 'eim-insert-ascii))))
(require 'eim)
;; (global-set-key "C-\\" 'toggle-input-method))

;;*** ibus-el
;; IBus client for GNU Emacs
;; REF:  (@url :file-name "http://www11.atwiki.jp/s-irie/pages/21.html" :display "Source")
(GNULinux
 (require 'ibus)
 ;; Turn on ibus-mode automatically after loading .emacs
 (add-hook 'after-init-hook 'ibus-mode-on)
 ;; Use C-SPC for Set Mark command
 ;; (ibus-define-common-key ?\C-\s nil)
 ;; Use C-/ for Undo command
 (ibus-define-common-key ?\C-/ nil)
 ;; Change cursor color depending on IBus status
 (setq ibus-cursor-color '("purple" "red" "blue")))

;;====================================================================
;;* Emacs lisp management中文设置无问题

;;** ELPA packages
;; BUG: Conflict with auctex's `style/url.el' and flim's `mailcap.el'
;;   "symbol's function definition is void: TeX-add-style-hook" error
;; One solution is:
;;    1. Move `style/url.el' out of load-path
;;    2. Install the package
;;    3. Move it back
;; Another solution:
;;    Change auctex's `style/url.el' to another name.
;;    (No bug found yet)
;; (autoload 'package-list-packages "package"
;;   "Display a list of packages.
;; Fetches the updated list of packages before displaying.
;; The list is displayed in a buffer named `*Packages*'." nil t)
(eval-after-load "package" '(package-settings))
(require 'package)

;;--------------------------------------------------------------------
;;** auto-install
(eval-after-load "auto-install"
  '(progn
     (auto-install-settings)
     (eal-define-keys
      'dired-mode-map
      `(("C-i"    auto-install-from-dired)))))
;; (require 'auto-install) ;; NOTE: load it when you want to use it.

;;====================================================================
;;* Emacs server
;; Emacs可以做为一个server, 然后用emacsclient连接这个server,
;; 无需再打开两个Emacs。

;; Emacs-21 以前的版本要用 gnuserv
;; (if is-before-emacs-21
;;     (progn
;;       ;; gnuserv
;;       (require 'gnuserv-compat)
;;       (gnuserv-start)
;;       ;; 在当前frame打开
;;       (setq gnuserv-frame (selected-frame))
;;       ;; 打开后让emacs跳到前面来
;;       (setenv "GNUSERV_SHOW_EMACS" "1")))

;;--------------------------------------------------------------------
;; NOTE: If you want to re-load emacs configuration during the run,
;; don't start emacs server here, instead, you can `M-x server-start'
;; or `M-x xy/server-start' in an emacs process when you need.

;; (setq-default server-auth-dir (concat my-var-path "/server"))
;; (if (not (eq t (server-running-p server-name)))
;;     (server-start))

;; ;;;###autoload
;; (defun xy/server-start ()
;;   "My version of starting emacs-server"
;;   (interactive)
;;   (server-force-delete)
;;   ;; (setq server-auth-dir (concat my-var-path "/server"))
;;   (server-start))

(setq-default server-auth-dir (concat my-var-path "/server"))

;; NOTE: With this macro, `server-start', `server-force-delete', and
;; `emacs --daemon' works properly even when there is an emacs server
;; running, when you set `delete-by-moving-to-trash' to true.
;; REF: (@url :file-name "http://superuser.com/questions/176207/emacs-daemon-not-deleting-socket" :display "Post")
(defmacro bypass-trash-in-function (fun)
  "Set FUN to always use normal deletion, and never trash.

Specifically, the value of `delete-by-moving-to-trash' will be
set to nil inside FUN, so any deletions that happen inside FUN or
any functions called by it will bypass the trash."
  `(defadvice ,fun (around no-trash activate)
     "Ignore `delete-by-moving-to-trash' inside this function.

See `bypass-trash-in-function' for more information."
     (let (delete-by-moving-to-trash)
       ad-do-it)))

;; Any server function that may delete the server file should never
;; move it to trash instead.
(mapc (lambda (fun) (eval `(bypass-trash-in-function ,fun)))
      '(server-start server-sentinel server-force-delete))

(server-start)

;;--------------------------------------------------------------------
;; Emacs 23.2 以后还提供了 `Emacs --daemon' 模式，加快启动。
;; Windows 下使用我定义的 `xy/done' 函数也能达到类似的效果，
;; 用 `C-x C-c' 隐藏 Emacs frame，但只能使用一个 frame。
;; (if is-after-emacs-23
;;   (progn
;;     (server-force-delete)
;;     (setq-default server-auth-dir (concat my-var-path "/server"))
;;     (server-start)
;;     (global-set-key (kbd "C-x C-c") 'xy/done)
;; ))
;; NOTE: emacsclient has not worked in Windows 7
(Windows
 (global-set-key (kbd "C-x C-c") 'xy/done))

(global-set-key (kbd "C-x M-c") 'save-buffers-kill-emacs)

;;====================================================================
;;* Emacs key bindings

(require 'xy-rc-kbd)

(provide 'xy-rcroot-env)
