;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-gnus.el'
;; Time-stamp:<2011-02-19 Sat 15:19 xin on P6T>
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
  (gnus-agentize))


;;;###autoload
(defun gnus-settings ()
  "Settings of `gnus'."

  ;;(setq user-full-name "Xin Yang")
  ;;(setq user-mail-address "xin2.yang@gmail.com")
  (setq gnus-directory "~/emacs/gnus")
  (setq gnus-home-directory "~/emacs/gnus")
  (setq gnus-kill-files-directory "~/emacs/gnus")
  (setq gnus-startup-file "~/emacs/gnus/newsrc")
  (setq canlock-password "7a4a2fd70bf79c29088dbd76df1a2029301428ed")

  ;; (setq smtpmail-default-smtp-server "mail.cc.umanitoba.ca")
  ;; (setq smtpmail-smtp-server "mail.cc.umanitoba.ca")
  ;; (setq message-send-mail-function 'smtpmail-send-it)

  (setq gnus-select-method
        '(nntp "freenews.netfront.net"
               (nntp-port-number 119)))

  ;;(setq gnus-secondary-select-methods '((nnml "")))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "freenews.netfront.net"))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.yaako.com"))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.newsfan.net"))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "news.CN99.com"))
  ;;(add-to-list 'gnus-secondary-select-methods '(nntp "groups.google.com"))

  ;; (add-hook 'message-mode-hook
  ;;           (lambda ()
  ;;             (setq fill-column 72)
  ;;             (turn-on-auto-fill)))
  (setq message-cite-function 'message-cite-original-without-signature) 

  ;; (setq gnus-default-charset 'cn-gb-2312)
  ;; (setq gnus-group-name-charset-group-alist '((".*" . cn-gb-2312)))
  ;; (setq gnus-summary-show-article-charset-alist
  ;;       '((1 . cn-gb-2312) (2 . big5) (3 . gbk) (4 . utf-8)))
  ;; (setq gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1 gb18030 x-gbk))

  (gnus-add-configuration '(article
                            (vertical 1.0
                                      (summary .3 point)
                                      (article 1.0))))

  (setq gnus-use-adaptive-scoring t)
  (setq gnus-save-score t)
  (add-hook 'mail-citation-hook 'sc-cite-original)
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

  (setq  gnus-score-find-score-files-function
         '(gnus-score-find-hierarchical gnus-score-find-bnews bbdb/gnus-score) 
         gnus-use-adaptive-scoring t)

  (setq gnus-confirm-mail-reply-to-news t
        message-kill-buffer-on-exit t
        message-elide-ellipsis "[...]\n")

  (setq gnus-thread-sort-functions
        '((not gnus-thread-sort-by-date)
          (not gnus-thread-sort-by-number)))

  (add-hook 'gnus-article-prepare-hook 'gnus-article-date-local)

  (eval-after-load "mm-decode"
    '(progn
       (add-to-list 'mm-discouraged-alternatives "text/html")
       (add-to-list 'mm-discouraged-alternatives "text/richtext")))

  (setq gnus-use-cache 'passive)

  ;; (setq gnus-posting-styles
  ;;       '((".*"
  ;;          (gnus-face-from-file "~/.emacs.d/me.jpg")
  ;;          (organization "University of Manitoba")
  ;;          (signature "http://www.cnliufeng.com/"))))

  (setq gnus-large-newsgroup 2000)
  
  (add-hook 'gnus-startup-hook
            '(lambda ()
               (setq gnus-visible-headers
                     (concat "^User-Agent:\\|^Content-Type:\\|"
                             "Content-Transfer-Encoding:\\|"
                             "^X-mailer:\\|^X-Newsreader:\\|^X-Sender:\\|"
                             gnus-visible-headers))))

  (add-hook 'gnus-article-prepare-hook
            (lambda ()
              (gnus-article-fill-long-lines)))

  ;; email
  
  ;; Set up email getting
  ;; gmail
  (add-to-list 'gnus-secondary-select-methods 
               '(nnimap "gmail"
                        (nnimap-address "imap.gmail.com")
                        (nnimap-server-port 993)
                        (nnimap-stream ssl)
                        (nnimap-authinfo-file 
                         "~/emacs/gnus/authinfo")))
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
  
  ;; Setup email sending
  ;; Ref: [[http://ejd.posterous.com/send-email-through-gmail-with-gnu-emacs]]
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
   (setq send-mail-function 'smtpmail-send-it
         message-send-mail-function 'smtpmail-send-it
         smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
         smtpmail-auth-credentials 
         (expand-file-name "~/emacs/gnus/authinfo")
         smtpmail-default-smtp-server "smtp.gmail.com"
         smtpmail-smtp-server "smtp.gmail.com"
         smtpmail-smtp-service 587
         user-mail-address "xin2.yang@gmail.com" ; make sure to change this
         smtpmail-debug-info t))

  ;; non-tls smtp server
  (Windows
   (setq 
    send-mail-function 'smtpmail-send-it
    message-send-mail-function 'smtpmail-send-it
    ;;          ;; @home
    ;;          smtpmail-default-smtp-server "smtp.blueyonder.co.uk"
    ;;          smtpmail-smtp-server "smtp.blueyonder.co.uk"
    ;;          user-mail-address "etimecowbou@gmail.com" ; make sure to change this
    ;; @brl
    smtpmail-default-smtp-server "staf-smtp.uwe.ac.uk"
    smtpmail-smtp-server "staf-smtp.uwe.ac.uk"
    ;; user-mail-address "xin2.yang@uwe.ac.uk" ; make sure to change this
    smtpmail-smtp-service 25
    smtpmail-debug-info t))

;; Windows 下 gnus 收发 gmail 邮件
;; [[http://hi.baidu.com/kton/blog/item/4fb26159f8ae312c2934f047.html]]
;; [[http://deebo.posterous.com/setting-up-emacs-gnus-on-windows-to-read-gmai]]
;; [[http://www.mail-archive.com/info-gnus-english@gnu.org/msg08606.html]]

)
;;----------------------------------------------------------------------

(provide 'xy-rc-gnus)
