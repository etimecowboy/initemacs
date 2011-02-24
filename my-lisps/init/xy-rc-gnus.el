;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-gnus.el'
;; Time-stamp:<2011-02-24 Thu 16:02 xin on p6t>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `gnus' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun gnus-start ()
  "Start gnus news reader."

  (interactive)
  (gnus-agentize)
  (gnus))


;;;###autoload
(defun gnus-settings ()
  "Settings of `gnus'."

  ;; Define user info in `xy-rcroot-env.el'  
  ;;(setq user-full-name "Xin Yang")
  ;;(setq user-mail-address "xin2.yang@gmail.com")

  ;; Allow Gnus to be an offline newsreader.
  (gnus-agentize)
  
  ;; Set Gnus directorys
  (setq gnus-default-directory "~/emacs/gnus"
        gnus-directory "~/emacs/gnus"
		gnus-init-file (concat my-local-lisp-path "/xy-rc-gnus.el")
		gnus-home-directory "~/emacs/gnus"
		gnus-kill-files-directory "~/emacs/gnus"
		gnus-startup-file "~/emacs/gnus/newsrc"
		gnus-cache-active-file "~/emacs/gnus/cache/active"
		gnus-cache-directory "~/emacs/gnus/cache"
		gnus-use-cache 'passive
		gnus-large-newsgroup 2000
		canlock-password "7a4a2fd70bf79c29088dbd76df1a2029301428ed"
		nntp-authinfo-file "~/emacs/gnus/authinfo"
		nnimap-authinfo-file "~/emacs/gnus/authinfo"
		mail-source-crash-box "~/emacs/gnus/.emacs-mail-crash-box"
		mail-source-directory "~/emacs/gnus/mail")

  (add-hook 'gnus-startup-hook
            '(lambda ()
               ;; (setq gnus-visible-headers
               ;;       (concat "^User-Agent:\\|^Content-Type:\\|"
               ;;               "Content-Transfer-Encoding:\\|"
               ;;               "^X-mailer:\\|^X-Newsreader:\\|^X-Sender:\\|"
               ;;               gnus-visible-headers))
			   (setq gnus-visible-headers
					 "^\\(^From:\\|^Subject:\\|^Date:\\|^Followup-To:
            \\|^X-Newsreader:\\|^User-Agent:\\|^X-Mailer:
            \\|Line:\\|Lines:\\|Content-Type:\\|NNTP-Posting-Host\\)")))
  
  ;; Window layout
  (gnus-add-configuration
   '(article (vertical 1.0 (summary .40 point) (article 1.0))))

  ;; nntp server
  (setq gnus-select-method
        '(nntp "freenews.netfront.net"
               (nntp-port-number 119)))
  ;;(setq gnus-secondary-select-methods '((nnml "")))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "freenews.netfront.net"))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.yaako.com"))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.newsfan.net"))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.CN99.com"))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp
  ;;"groups.google.com"))

  ;; REF: http://www.lirui.name/post/144.html
  ;; ;;;;;;;;;;;;;;;;;;;;
  ;; ;;   语言环境设定
  ;; ;;;;;;;;;;;;;;;;;;;;
  ;; (set-language-environment 'Chinese-GB)
  ;; (setq gnus-default-charset 'chinese-iso-8bit
  ;;       gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
  ;;       gnus-summary-show-article-charset-alist
  ;; 		'((1 . cn-gb-2312)
  ;; 		  (2 . gb18030)
  ;; 		  (3 . chinese-iso-8bit)
  ;; 		  (4 . gbk)
  ;; 		  (5 . big5)
  ;; 		  (6 . utf-8))
  ;;       gnus-newsgroup-ignored-charsets
  ;;       '(unknown-8bit x-unknown iso-8859-1))

  ;; ;;;;;;;;;;;;;;;;;;;;
  ;; ;;解决gb18030乱码
  ;; ;;;;;;;;;;;;;;;;;;;;
  ;; (setq gnus-newsgroup-ignored-charsets 
  ;; 		'(unknown-8bit x-unknown gb18030))

  ;; Gnus encoding
  ;; (setq gnus-default-charset 'cn-gb-2312)
  ;; (setq gnus-group-name-charset-group-alist '((".*" . cn-gb-2312)))
  ;; (setq gnus-summary-show-article-charset-alist
  ;;       '((1 . cn-gb-2312) (2 . big5) (3 . gbk) (4 . utf-8)))
  ;; (setq gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1 gb18030 x-gbk))

  ;; Disable auto-fill mode
  (add-hook 'message-mode-hook
            (lambda ()
               (auto-fill-mode 1)
			   (auto-image-file-mode 1)))

  ;; multimedia content reading
  (eval-after-load "mm-decode"
    '(progn
       (add-to-list 'mm-discouraged-alternatives "text/html")
       (add-to-list 'mm-discouraged-alternatives "text/richtext")
	   (setq mm-inline-large-images t)))
  
  ;; Message scoring
  (setq  gnus-score-find-score-files-function
         '(gnus-score-find-hierarchical gnus-score-find-bnews
										bbdb/gnus-score))
  (setq gnus-use-adaptive-scoring t
		gnus-save-score t)
  (add-hook 'message-sent-hook 'gnus-score-followup-article) 
  (add-hook 'message-sent-hook 'gnus-score-followup-thread) 
  (defvar gnus-default-adaptive-score-alist 
    '((gnus-kill-file-mark (from -10)) 
      (gnus-unread-mark) 
      (gnus-read-mark (from 10) (subject 30)) 
      (gnus-catchup-mark (subject -10)) 
      (gnus-killed-mark (from -1) (subject -30)) 
      (gnus-del-mark (from -2) (subject -15)) 
      (gnus-ticked-mark (from 10)) 
      (gnus-dormant-mark (from 5))))

  ;; Thread sorting
  (setq gnus-thread-sort-functions
        '((not gnus-thread-sort-by-date)
          (not gnus-thread-sort-by-number)))

  ;; Message replying
  (setq gnus-confirm-mail-reply-to-news t
        message-kill-buffer-on-exit t
        message-elide-ellipsis "[...]\n")
  ;; Message citation method
  (setq message-cite-function
		'message-cite-original-without-signature)
  ;; Email citation method
  (add-hook 'mail-citation-hook 'sc-cite-original)

  ;; Message posting
  ;; (setq gnus-posting-styles
  ;;       '((".*"
  ;;          (gnus-face-from-file "~/.emacs.d/me.jpg")
  ;;          (organization "University of Manitoba")
  ;;          (signature "http://www.cnliufeng.com/"))))
  (add-hook 'gnus-article-prepare-hook
            (lambda ()
              (gnus-article-fill-long-lines)
			  (gnus-article-date-local)))
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; Gnus Email settings
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Recieving
  
  (add-to-list 'gnus-secondary-select-methods 
               '(nnimap "gmail"
						 (nnimap-address "imap.gmail.com")
						 (nnimap-server-port 993)
						 (nnimap-stream ssl)))
				         ;; "uwe"
						 ;; (nnimap-address "ses-imap.uwe.ac.uk")
						 ;; (nnimap-server-port 993)
						 ;; (nnimap-stream ssl))) 
  ;; uwe staff
  ;; (add-to-list 'gnus-secondary-select-methods 
  ;;              '(nnimap "uwestaff"
  ;;                 (nnimap-address "ses-smtp.uwe.ac.uk")
  ;;                 (nnimap-server-port 993)
  ;;                 (nnimap-stream ssl)
  ;;                 (nnimap-authinfo-file 
  ;;                   "~/.emacs.d/var/gnus/authinfo"))
  ;; )
  ;; windows settings
  ;; (add-to-list 'gnus-secondary-select-methods 
  ;;              '(nnimap "gmail"
  ;;                 (nnimap-address "127.0.0.1")
  ;;                 (nnimap-server-port 994)
  ;;                 (nnimap-stream ssl)
  ;;                 (nnimap-authinfo-file 
  ;;                   "~/.emacs.d/var/gnus/authinfo"))
  ;; )

  ;; (setq mail-sources 
  ;; 		'((imap :server "imap.gmail.com"
  ;; 				  :user "xin2.yang"
  ;; 				  :password ""
  ;; 				  :port 993
  ;; 				  :connection ssl
  ;; 				  :leave t)
  ;; 		  (imap :server "ses-imap.uwe.ac.uk"
  ;; 				  :user "x4-yang"
  ;; 				  :password ""
  ;; 				  :port 993
  ;; 				  :connection ssl
  ;; 				  :leave t)))
  
  ;; Sending
  
  ;; REF: [[http://ejd.posterous.com/send-email-through-gmail-with-gnu-emacs]]
  ;; NOTE: In linux environment,You will need starttls which is now
  ;;       (included in emacs release), which is used to set up the 
  ;;       SSL encrypted connection to the GMail server. 
  ;;       This is contained in the "gnutls-bin" 
  ;;       package on earlier versions of debian and ubuntu. 
  ;;       With later versions (at least Ubuntu 9.10), starttls is 
  ;;       in its own package, and the "gnutls-bin" package is not 
  ;;       needed. For Redhat Enterprise Linux 5 or CentOS 5,
  ;;       "gnutls" and "gnutls-utils" packages are needed.
  ;;       If you don’t have starttls installed, you’ll get a 
  ;;       (rather generic) “smtpmail-send-it: Sending failed; 
  ;;       SMTP protocol error” error message.

  (require 'smtpmail)
  (require 'starttls)
  
  (GNULinux
   (setq
	send-mail-function 'smtpmail-send-it
	message-send-mail-function 'smtpmail-send-it
	smtpmail-auth-credentials (expand-file-name
							   "~/emacs/gnus/authinfo")
	smtpmail-debug-info t
	smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
	smtpmail-default-smtp-server "smtp.gmail.com"
	smtpmail-smtp-server "smtp.gmail.com"
	smtpmail-smtp-service 587))

  ;; REF: http://www.emacswiki.org/emacs/GnusMSMTP
  (Windows
   (setq
	message-send-mail-function 'message-send-mail-with-sendmail
	;; we substitute sendmail with msmtp
	sendmail-program (expand-file-name "~/.emacs.d/bin/msmtp.exe")
	;;need to tell msmtp which account we're using
	message-sendmail-extra-arguments '("-a" "gx2")
    ;; you might want to set the following too
	mail-host-address "gmail.com"))

  ;; ;; non-tls smtp server
  ;; (Windows
  ;; 	;; @home
  ;; 	(HomeDesktop
  ;; 	 (setq
  ;; 	  smtpmail-default-smtp-server "smtp.blueyonder.co.uk"
  ;; 	  smtpmail-smtp-server "smtp.blueyonder.co.uk"))
  ;; 	  ;; user-mail-address "etimecowboy@gmail.com")) ; make sure to change this
  ;;   ;; @brl
  ;; 	(OfficePC
  ;; 	 (setq
  ;; 	  smtpmail-default-smtp-server "staf-smtp.uwe.ac.uk"
  ;; 	  smtpmail-smtp-server "staf-smtp.uwe.ac.uk"))
  ;; 	  ;; user-mail-address "xin2.yang@uwe.ac.uk")) ; make sure to change this
  ;; 	(setq
  ;; 	 smtpmail-smtp-service 25
  ;; 	 smtpmail-debug-info t))

;; Windows 下 gnus 收发 gmail 邮件
;; [[http://hi.baidu.com/kton/blog/item/4fb26159f8ae312c2934f047.html]]
;; [[http://deebo.posterous.com/setting-up-emacs-gnus-on-windows-to-read-gmai]]
;; [[http://www.mail-archive.com/info-gnus-english@gnu.org/msg08606.html]]
)

;;----------------------------------------------------------------------

(provide 'xy-rc-gnus)
