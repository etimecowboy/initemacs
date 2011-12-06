;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-gnus.el'
;; Time-stamp:<2011-12-06 Tue 07:26 xin on P6T-WIN7>
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

;; ;;;###autoload
;; (defun gnus-start ()
;;   "Start gnus news reader."
;;   (interactive)
;;   (gnus-agentize)
;;   (gnus))

;;;###autoload
(defun gnus-settings ()
  "Settings of `gnus'."
  ;; Set Gnus directorys
  (setq gnus-init-file (concat my-local-lisp-path "/xy-rc-gnus.el") ;gnus设置文件
        gnus-default-directory "~/emacs/gnus"   ;默认目录
        gnus-home-directory "~/emacs/gnus"      ;主目录
        gnus-dribble-directory "~/emacs/gnus"   ;恢复目录
        gnus-startup-file "~/emacs/gnus/newsrc" ;初始文件
        gnus-directory "~/emacs/gnus/news"      ;新闻组的存储目录
        gnus-article-save-directory "~/emacs/gnus/news/reserved"  ;文章保存目录
        gnus-kill-files-directory "~/emacs/gnus/news/trash" ;文件删除目录
        gnus-agent-directory "~/emacs/gnus/agent"    ;代理目录
        gnus-cache-directory "~/emacs/gnus/cache"    ;缓存目录
        gnus-cache-active-file "~/emacs/gnus/cache/active" ;缓存激活文件
        message-directory "~/emacs/gnus/mail"   ;邮件的存储目录
        message-auto-save-directory "~/emacs/gnus/mail" ;自动保存的目录
        mail-source-directory "~/emacs/gnus/mail/inbox" ;邮件的源目录
        mail-source-crash-box "~/emacs/gnus/.emacs-mail-crash-box" ;邮件源崩溃目录
        nnmail-message-id-cache-file "~/emacs/gnus/nnmail-cache" ;nnmail的消息ID缓存
        nnml-newsgroups-file "~/emacs/gnus/newsgroup"      ;邮件新闻组解释文件
        nntp-marks-directory "~/emacs/gnus/marks"          ;nntp组存储目录
        mml-default-directory "~/emacs/gnus/attachement"   ;附件的存储位置
        nntp-authinfo-file "~/emacs/gnus/authinfo" ;nntp用户身分认证文件
        nnimap-authinfo-file "~/emacs/gnus/authinfo" ;imap 用户身分认证文件
    )

  ;; 关闭默认的archive 这个方法不好控制
  (setq gnus-message-archive-group nil)
  ;; 设置存档目录
  (setq gnus-outgoing-message-group
        '(nnml "archive"
               (nnml-directory   "~/emacs/gnus/mail/archive")
               (nnml-active-file "~/emacs/gnus/mail/archive/active")
               (nnml-get-new-mail nil)
               (nnml-inhibit-expiry t)))
  ;; canlock 密码
  (setq canlock-password "7a4a2fd70bf79c29088dbd76df1a2029301428ed")

  (setq gnus-agent t ;开启代理功能, 以支持离线浏览
        gnus-inhibit-startup-message t  ;关闭启动时的画面
        gnus-novice-user nil ;关闭新手设置, 不进行确认
        gnus-expert-user t   ;不询问用户
        gnus-show-threads t  ;显示邮件线索
        gnus-interactive-exit nil ;退出时不进行交互式询问
        gnus-use-dribble-file t   ;创建恢复文件
        gnus-always-read-dribble-file t ;读取恢复文件
        gnus-asynchronous t       ;异步操作
        gnus-large-newsgroup 100  ;设置大容量的新闻组默认显示的大小
        gnus-large-ephemeral-newsgroup nil  ;和上面的变量一样, 只不过对于短暂的新闻组
        gnus-summary-ignore-duplicates t    ;忽略具有相同ID的消息
        gnus-treat-fill-long-lines t        ;如果有很长的行, 不提示
        gnus-summary-display-while-building 100
        gnus-ignored-from-addresses nil     ; 在 Summary 中显示自己的名字
        message-confirm-send t              ;防止误发邮件, 发邮件前需要确认
        message-kill-buffer-on-exit t       ;设置发送邮件后删除buffer
        message-from-style 'angles          ;`From' 头的显示风格
        message-syntax-checks '((sender . disabled)) ;语法检查
        nnmail-expiry-wait 7   ;邮件自动删除的期限 (单位: 天)
        nnmairix-allowfast-default t)       ;加快进入搜索结果的组

  ;; nntp server
  ;; NOTE: a list of free news servers
  ;;       - news.cn99.com
  ;;       - freenews.netfront.net
  ;;       - news.aioe.org
  ;;       - news.motzarella.org
  (setq gnus-select-method
        '(nntp "news.aioe.org"))
  (HomeDesktop
   (setq gnus-select-method
         '(nntp "news.virginmedia.com"
                (nntp-port-number 119))))

  ;; gnus-notify+
  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/gnus-notify%2B.el" :display "emacswiki")
  ;; 邮件新闻通知
  (require 'gnus-notify+)

  ;; 语言环境设定
  ;; Gnus encoding (old settings)
  ;; (setq gnus-default-charset 'cn-gb-2312)
  ;; (setq gnus-group-name-charset-group-alist '((".*" . cn-gb-2312)))
  ;; (setq gnus-summary-show-article-charset-alist
  ;;       '((1 . cn-gb-2312) (2 . big5) (3 . gbk) (4 . utf-8)))
  ;; (setq gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1 gb18030 x-gbk))

  ;; REF: (@url :file-name "http://www.lirui.name/post/144.html" :display "Post")
  ;; (set-language-environment 'Chinese-GB)
  ;; (setq gnus-default-charset 'chinese-iso-8bit
  ;;       gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
  ;;       gnus-summary-show-article-charset-alist
  ;;         '((1 . cn-gb-2312)
  ;;           (2 . gb18030)
  ;;           (3 . chinese-iso-8bit)
  ;;           (4 . gbk)
  ;;           (5 . big5)
  ;;           (6 . utf-8)))
  ;; ;;解决gb18030乱码
  ;; (setq gnus-newsgroup-ignored-charsets
  ;;       '(unknown-8bit x-unknown iso-8859-1 gb18030 x-gbk))

  ;; (setq gnus-parameters
  ;;         (nconc
  ;;          ;; Some charsets are just examples!
  ;;          '(("\\bcn\\.bbs\\..*" ;; Chinese
  ;;             (mm-coding-system-priorities
  ;;              '(iso-8859-1 gbk utf-8))))
  ;;          gnus-parameters))

  (setq gnus-default-charset 'gbk)
  (add-to-list 'gnus-group-charset-alist
                 '("\\(^\\|:\\)cn\\>\\|\\<chinese\\>" gbk))
  (setq gnus-summary-show-article-charset-alist
          '((1 . utf-8)
            (2 . big5)
            (3 . gb18030)
            (4 . gbk)
            (5 . gb2312)
            (6 . utf-7)))

  ;; (setq gnus-group-name-charset-group-alist
  ;;         '(("\\.com\\.cn:" . gbk)
  ;;           ("news\\.newsfan\\.net" . gbk)))
  ;; (setq gnus-group-name-charset-method-alist
  ;;         '(((nntp "news.cn99.net") . gbk)))
  ;; (setq gnus-group-name-charset-method-alist
  ;;         '(((nntp "news.newsfan.net") . gbk)))

  (setq gnus-newsgroup-ignored-charsets
          '(unknown-8bit x-unknown x-gbk gb18030))

  ;; 显示编码格式
  ;; (add-hook 'gnus-startup-hook
  ;;             '(lambda ()
  ;;                (setq gnus-visible-headers
  ;;                      (concat "^User-Agent:\\|^Content-Type:\\|"
  ;;                              "Content-Transfer-Encoding:\\|"
  ;;                              "^X-mailer:\\|^X-Newsreader:\\|^X-Sender:\\|"
  ;;                              gnus-visible-headers))))

  ;;设置发送风格
  (setq gnus-posting-styles
        '(
          ;; all
          (".*"
           (name "Allen Yang")
           (address "etimecowboy@gmail.com")
           ;; (face (gnus-convert-png-to-face (concat gnus-home-directory
           ;;                                         "/cock32.png")))
           ;; (organization "your-pc-name")
;;            (signature "
;; oooOOOOoo...
;; >  Life is too short ! ...")
           (eval (setq mm-coding-system-priorities
                       '(iso-8859-1 gb2312 gbk gb18030 utf-8)))
           ;;(body "")
           )
          ;;cn.bbs.com
          ("^cn\\.bbs"
           (name "日积月累")
           (address "etimecowboy@gmail.com")
           ;; (face (gnus-convert-png-to-face (concat gnus-home-directory
           ;;                                         "/cock32.png")))
;;            (organization "your-pc-name")
            (signature "
;;
;; >  日积月累，水滴穿石")
           (eval (setq mm-coding-system-priorities
                       '(iso-8859-1 gb2312 gbk gb18030 utf-8)))
           ;;(body "")
           )
          ;;tw
          ("^tw\\.comp"
           (name "日積月累")
           (address "etimecowboy@gmail.com")
           ;; (face (gnus-convert-png-to-face (concat gnus-home-directory
           ;;                                         "/cock32.png")))
;;            (organization "your-pc-name")
            (signature "
;;
;; >  日積月累，水滴穿石")
           (eval (setq mm-coding-system-priorities
                       '(iso-8859-1 big5 utf-8)))
           ;;(body "")
           )
          ))

  ;; 显示阅读设置
  (setq mm-text-html-renderer 'w3m) ;用W3M显示HTML格式的邮件
  ;; (setq mm-text-html-renderer nil)  ;调用外部浏览器

  (defun wicked/gnus-article-show-html ()
    "Show the current message as HTML mail."
    (interactive)
    (let ((mm-automatic-display (cons "text/html"
                                      mm-automatic-display)))
      (gnus-summary-show-article)))

  (define-key gnus-article-mode-map "WH"
    'wicked/gnus-article-show-html)

  (setq mm-inline-large-images t)   ;显示内置图片
  (auto-image-file-mode t)          ;自动加载图片
  ;; Inline images?
  (setq mm-attachment-override-types '("image/.*"))

  ;; Summary 显示设置
  ;; (gnus-add-configuration            ;显示布局
  ;;  '(article (vertical 1.0 (summary .40 point) (article 1.0))))
  (setq gnus-summary-gather-subject-limit 'fuzzy) ;聚集题目用模糊算法
  (setq gnus-summary-line-format "%4P %U%R%z%O %{%5k%}
%{%14&user-date;%} %{%-20,20n%} %{%ua%} %B %(%I%-60,60s%)\n")
  (defun gnus-user-format-function-a (header) ;用户的格式函数 `%ua'
    (let ((myself (concat "<" my-mail ">"))
          (references (mail-header-references header))
          (message-id (mail-header-id header)))
      (if (or (and (stringp references)
                   (string-match myself references))
              (and (stringp message-id)
                   (string-match myself message-id)))
          "X" "│")))
  (setq gnus-user-date-format-alist ;用户的格式列表 `user-date'
        '(((gnus-seconds-today) . "TD %H:%M")   ;当天
          (604800 . "W%w %H:%M")                ;七天之内
          ((gnus-seconds-month) . "%d %H:%M")   ;当月
          ((gnus-seconds-year) . "%m-%d %H:%M") ;今年
          (t . "%y-%m-%d %H:%M")))              ;其他

  ;; 主题模式外观
  (setq gnus-summary-same-subject "Re:►")
  (setq gnus-sum-thread-tree-indent "  ")
  (setq gnus-sum-thread-tree-single-indent "☉ ")
  (setq gnus-sum-thread-tree-root "★ ")
  (setq gnus-sum-thread-tree-false-root "☆")
  (setq gnus-sum-thread-tree-vertical "┃ ")
  (setq gnus-sum-thread-tree-leaf-with-other "┣━")
  (setq gnus-sum-thread-tree-single-leaf "┗━")

  ;; 用 Supercite 显示多种多样的引文形式
  (setq sc-attrib-selection-list nil
        sc-auto-fill-region-p nil
        sc-blank-lines-after-headers 1
        sc-citation-delimiter-regexp "[>]+\\|\\(: \\)+"
        sc-cite-blank-lines-p nil
        sc-confirm-always-p nil
        sc-electric-references-p nil
        sc-fixup-whitespace-p t
        sc-nested-citation-p nil
        sc-preferred-header-style 4
        sc-use-only-preference-p nil)

  ;; 主题设置
  (setq gnus-use-trees t ;联系老的标题
        gnus-tree-minimize-window nil ;用最小窗口显示
        gnus-fetch-old-headers 'off  ;'some ;抓取老的标题以联系线程
        gnus-generate-tree-function 'gnus-generate-horizontal-tree ;生成水平树
        gnus-summary-thread-gathering-function
          'gnus-gather-threads-by-subject) ;聚集函数根据标题聚集

  ;; 时间显示
  ; 将邮件的发出时间转换为本地时间
  (add-hook 'gnus-article-prepare-hook 'gnus-article-date-local)
  ; 跟踪组的时间轴
  (add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)
  ; 新闻组分组
  (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
  ;; 排序
  (setq gnus-thread-sort-functions
        '((not gnus-thread-sort-by-date) ;时间的逆序
          (not gnus-thread-sort-by-number))) ;跟踪的数量的逆序
  ;; 自动跳到第一个没有阅读的组
  ;; (add-hook 'gnus-switch-on-after-hook 'gnus-group-first-unread-group) ; gnus切换时
  ;; (add-hook 'gnus-summary-exit-hook 'gnus-group-first-unread-group) ;退出Summary时
  ;; 自动更新新消息，功能不错，但在我的机器上会很慢...
  ;; (add-hook 'gnus-summary-exit-hook 'gnus-notify+) ;退出summary模式后
  ;; (add-hook 'gnus-group-catchup-group-hook 'gnus-notify+) ;当清理当前组后
  ;; (add-hook 'mail-notify-pre-hook 'gnus-notify+) ;更新邮件时
  ;; 斑纹化
  (setq gnus-summary-stripe-regexp        ;设置斑纹化匹配的正则表达式
        (concat "^[^"
                gnus-sum-thread-tree-vertical
                "]*"))

  ;; 其他的一些设置
  ;;不喜欢 Summary buffer 和 Article buffer 的版面，如何改变？或者三个
  ;;窗口的显示？
  ;;可以通过调用函数 gnus-add-configuration 来控制窗口的配置。语法有点
  ;;复杂，不过在手册 "Windows Layout" 中解释得很清楚，一些比较流行的例
  ;;子：
  ;;用 35% 的 Summary 比 65% 的 Article 替换原来的 25% 比 75%（其中的
  ;;1.0 意思是“占满剩余空间”）：
  ;;
  ;;(gnus-add-configuration '(article (vertical 1.0 (summary .35 point)
  ;; (article 1.0))))
  ;;
  ;;三个窗口显示。左边是 Group buffer，右上是 Summary buffer，右下是
  ;;Article buffer：

  (gnus-add-configuration
   '(article
     (horizontal 1.0
                 ;; (vertical 40
                           ;; (group 1.0))
                 (vertical 1.0
                           (summary 0.35 point)
                           (article 1.0)))))
  ;; (gnus-add-configuration
  ;;  '(summary
  ;;      (horizontal 1.0
  ;;                  (vertical 40
  ;;                            (group 1.0))
  ;;                  (vertical 1.0
  ;;                            (summary 1.0 point)))))

  ;;
  ;;不喜欢 Summary buffer 的样子，如何调整？
  ;;那么你需要和变量 gnus-summary-line-format 玩一玩，它得值是一个符号
  ;;串，比如作者，日期，主题等。手册 "Summary Buffer Lines" 中有可用的
  ;;符号列表和常被忘记的节点 "Formatting Variables" 和它的子节点。其中
  ;;有很多有用的东西，像指定光标和制表符的位置等。
  ;;
  ;;从 5.10.0 起，Gnus 新提供了一些很不错的标志符，例如，%B 可以形成一
  ;;个线索树，%&user-date 根据帖子给出时间细节。例子如下：
  (setq gnus-summary-line-format
        "%U %R %B %s %-60= | %4L | %-20,20f | %&user-date; \n")

  ;;Article Buffer设置
  ;;设定要显示的头消息格式
  (setq gnus-visible-headers
        "^\\(^To:\\|^CC:\\|^From:\\|^Subject:\\|^Date:\\|^Followup-To:
\\|^X-Newsreader:\\|^User-Agent:\\|^X-Mailer:
\\|Line:\\|Lines:\\|Content-Type:\\|NNTP-Posting-Host\\)")

  ;; topic mode 参考这里：(info "(gnus)Group Topics")
  (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

  ;; 存帖设定
  ;; 如何存档有趣的消息？我将这个函数绑定在了F6键上
  ;; 例如在 gnu.emacs.gnus 中，你偶然发现一个有趣的消息，想要存档，有好
  ;; 几种方法。第一种，也是最简单的，另存为文件`O f'。但是，从 Gnus 访问
  ;; 这样的存档文件并不方便。把 Frank Haun &lt;pille3003@fhaun.de&gt; 的
  ;; 这个代码片断放入 ~/.gnus：
  (defun my-archive-article (&optional n)
    "Copies one or more article(s) to a corresponding `nnml:'
group, e.g.
     `gnus.ding' goes to `nnml:1.gnus.ding'. And `nnml:List-gnus.ding'
goes
     to `nnml:1.List-gnus-ding'.

     Use process marks or mark a region in the summary buffer to
archive
     more then one article."
    (interactive "P")
    (let ((archive-name
           (format "nnml:archives.%s"
                   (if (featurep 'xemacs)
                       (replace-in-string gnus-newsgroup-name "^.*:" "")
                     (replace-regexp-in-string "^.*:" ""
                                               gnus-newsgroup-name)))))
      (gnus-summary-copy-article n archive-name)))

  ;; 此时，可以在 summary buffer 中用 `M-x my-archive-article' 把光标处
  ;; 的文章存档到一个 nnml 组（当然，可以改为你想要的其他后端）。
  ;; 当然，也可以使用缓冲：(setq gnus-use-cache t)
  ;; 这样，你只需设置 tick 或者 dormant 标记来保存，在缓冲中设置已读标记
  ;;    可以删除（文章）。

  ;;另一种保存帖子的方法：
  ;;看到有价值的帖子，只要按下`*'键，这篇帖子就会被拷贝到本地的
  ;;cache中保存起来，即使服务器那边删除了帖子，也没关系了。如
  ;;果不想要了，用`Meta-*'就可以把帖子从缓存中删掉。
  (setq gnus-use-cache 'passive)

  ;; 发帖设定
  ;;A function that selects a reasonable group for Gcc'ing this mail.
  ;;(defun MySendedMail ()
  ;;  (cond ((and gnus-newsgroup-name
  ;;              (not (message-news-p))
  ;;              (stringp gnus-newsgroup-name))
  ;;         gnus-newsgroup-name)
  ;;        (t ted-default-gcc-group)))
  ;; Use it.
  ;;(setq gnus-outgoing-message-group "nnml:SendMails")

  ;; 自动保存发送的帖子
  (defun MySent ()
    (if (message-news-p)
        "nnml:sent_news"
      "nnml:sent_mails"))
  (setq gnus-outgoing-message-group 'MySent)

  (add-hook 'message-mode-hook
            (lambda ()
              (auto-fill-mode 1)
              (set-fill-column 64)
              (auto-image-file-mode 1)
              (setq mm-inline-large-images t)
              (add-to-list 'mm-attachment-override-types "image/*")))

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

  ;;引用设置：不要原来的签名，引用全文
  (setq message-cite-function 'message-cite-original-without-signature)
  (add-hook 'mail-citation-hook 'sc-cite-original)

  ;;压缩保存的邮件
  (setq nnml-use-compressed-files t)

  ;; multimedia content reading
  (eval-after-load "mm-decode"
    '(progn
       (add-to-list 'mm-discouraged-alternatives "text/html")
       (add-to-list 'mm-discouraged-alternatives "text/richtext")
       (setq mm-inline-large-images t)))

  ;; 积分设定
  (setq gnus-use-adaptive-scoring t  ;开启积分
        gnus-save-score t)           ;保存积分

  (setq  gnus-score-find-score-files-function
         '(gnus-score-find-hierarchical gnus-score-find-bnews
                                        bbdb/gnus-score))

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

  ;; Gnus Email settings
  ;; Recieving
  ;; (setq gnus-secondary-select-methods
  ;;       '((nnimap "Gmail-etimecowboy"
  ;;                   (nnimap-address "imap.gmail.com")
  ;;                   (nnimap-server-port 993)
  ;;                   (nnimap-stream ssl))
  ;;         ;; (nnimap "UWE-staff"
  ;;         ;;           (nnimap-address "ses-smtp.uwe.ac.uk")
  ;;         ;;           (nnimap-server-port 993)
  ;;         ;;           (nnimap-stream ssl))
  ;;         ))

  ;; (setq mail-sources
  ;;         '((imap :server "imap.gmail.com"
  ;;                   :user "xin2.yang"
  ;;                   :password "13971167383"
  ;;                   :port 993
  ;;                   :connection ssl
  ;;                   :leave t)
  ;;           (imap :server "ses-imap.uwe.ac.uk"
  ;;                   :user "x4-yang"
  ;;                   :password "2bh25E"
  ;;                   :port 993
  ;;                   :connection ssl
  ;;                   :leave t)))

  ;; Sending
  ;; REF: (@url :file-name "http://ejd.posterous.com/send-email-through-gmail-with-gnu-emacs" :display "Post")
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

  ;; tls smtp server
  ;; (GNULinux
  ;;  (setq
  ;;     send-mail-function 'smtpmail-send-it
  ;;     message-send-mail-function 'smtpmail-send-it
  ;;     smtpmail-auth-credentials (expand-file-name
  ;;                                "~/emacs/gnus/authinfo")
  ;;     smtpmail-debug-info t
  ;;     smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
  ;;     smtpmail-default-smtp-server "smtp.gmail.com"
  ;;     smtpmail-smtp-server "smtp.gmail.com"
  ;;     smtpmail-smtp-service 587))

  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/GnusMSMTP" :display "emacswiki")
  ;; (Windows
  ;;  (setq
  ;;     message-send-mail-function 'message-send-mail-with-sendmail
  ;;     ;; we substitute sendmail with msmtp
  ;;     sendmail-program (expand-file-name "~/.emacs.d/bin/win32/msmtp.exe")
  ;;     ;;need to tell msmtp which account we're using
  ;;     message-sendmail-extra-arguments '("-a" "gx2")
  ;;   ;; you might want to set the following too
  ;;     mail-host-address "gmail.com"))

  ;; non-tls smtp server
  ;; (Windows
   (setq
    send-mail-function 'smtpmail-send-it
    message-send-mail-function 'smtpmail-send-it
    smtpmail-smtp-service 25
    smtpmail-debug-info t)
   ;; @home
   (HomeDesktop
    (setq
     smtpmail-default-smtp-server "smtp.blueyonder.co.uk"
     smtpmail-smtp-server "smtp.blueyonder.co.uk"))
   ;; user-mail-address "etimecowboy@gmail.com")) ; make sure to change this
    ;; @brl
   (OfficePC
    (setq
     smtpmail-default-smtp-server "staf-smtp.uwe.ac.uk"
     smtpmail-smtp-server "staf-smtp.uwe.ac.uk"))
   ;; user-mail-address "xin2.yang@uwe.ac.uk")) ; make sure to change this
   ;; )

   ;; Windows 下 gnus 收发 gmail 邮件
   ;; REF:
   ;;     - (@url :file-name "http://hi.baidu.com/kton/blog/item/4fb26159f8ae312c2934f047.html" :display "1")
   ;;     - (@url :file-name "http://deebo.posterous.com/setting-up-emacs-gnus-on-windows-to-read-gmai" :display "2")
   ;;     - (@url :file-name "http://www.mail-archive.com/info-gnus-english@gnu.org/msg08606.html" :display "3")

   ;; 多窗口处理
   ;;
   ;; From: Katsumi Yamaoka <yamaoka@jpl.org>
   ;; Subject: Re: multiple message frames
   ;; To: ding@gnus.org
   ;; Newsgroups: gnus.ding
   ;; Date: Thu, 11 Sep 2003 16:06:37 +0900
   ;;
   ;; Hi,
   ;;
   ;; This is the revised version of the "multiple message frames" suit.
   ;; It makes it possible to open multiple message frames and delete
   ;; each frame automatically after sending or killing it.  You can use
   ;; it by simply putting it in your .gnus.el file.  Enjoy!
   ;;
   (let* ((default
            ;; Winodw layout for normal message frames.
            '(vertical
              ((user-position . t)
               ;;(left . -1) (top . 1)
               (width . 80) (height . 40))
              (message 1.0 point)))
          (bug
           ;; Window layout for message frames reporting bugs.
           ;; Note that multiple gnus-bug frames are not supported.
           '(vertical
             ((user-position . t)
              ;;(left . -1) (top . 1)
              (width . 80) (height . 40))
             (if gnus-bug-create-help-buffer '("*Gnus Help Bug*" 0.5))
             ("*Gnus Bug*" 1.0 point)))
          (config
           `(frame
             1.0
             (if (buffer-live-p gnus-summary-buffer)
                 (if (get-buffer gnus-article-buffer)
                     (car (cdr (assq 'article
                                     gnus-buffer-configuration)))
                   (car (cdr (assq 'summary gnus-buffer-configuration))))
               (car (cdr (assq 'group gnus-buffer-configuration))))
             ,default))
          (settings '(compose-bounce forward mail-bounce message post
                                     reply reply-yank)))
     (while settings
       (gnus-add-configuration (list (car settings) config))
       (setq settings (cdr settings)))
     (setcdr (nthcdr 2 (setq config (copy-sequence config))) (list bug))
     (gnus-add-configuration (list 'bug config)))

   (add-hook
    'gnus-configure-windows-hook
    (lambda nil
      (if (eq major-mode 'message-mode)
          (let* ((message-frame (selected-frame))
                 (delete-frame-function
                  `(lambda nil
                     (if (and
                          ;; Uncomment the following line if other windows
                          ;; in message frames are supposed to be important.
                          ;;(eq (selected-window) (next-window))
                          (eq (selected-frame) ,message-frame))
                         (delete-frame ,message-frame)))))
            (setq gnus-frame-list (delq message-frame gnus-frame-list)
                  message-exit-actions `((funcall
                                          ,delete-frame-function))
                  message-postpone-actions message-exit-actions)
            (if (or (featurep 'xemacs)
                    (< emacs-major-version 21))
                (make-local-hook 'kill-buffer-hook))
            (add-hook 'kill-buffer-hook `,delete-frame-function t t)))))

   ;; Don't popup a message frame when sending a queued message.
   (add-hook
    'gnus-message-setup-hook
    (lambda nil
      (if (or (memq this-command '(gnus-draft-send-message
                                   gnus-draft-send-all-messages
                                   gnus-group-send-queue))
              (and (featurep 'gnus-delay)
                   (save-excursion
                     (save-restriction
                       (widen)
                       (message-narrow-to-headers)
                       (re-search-forward
                        (concat "^" (regexp-quote gnus-delay-header)
                                ":\\s-+")
                        nil t)))))
          (let ((config (copy-sequence gnus-buffer-configuration)))
            (set (make-local-variable 'gnus-buffer-configuration)
                 (cons '(forward (vertical 1.0 (message 1.0 point)))
                       (delq (assq 'forward config) config)))
            (set (make-local-variable 'gnus-configure-windows-hook)
                 nil)))))

   ;; Additional lisps
   ;; org-mime
   (when (try-require 'org-mime)
     (add-hook 'message-mode-hook
               (lambda ()
                 (local-set-key "\C-c\M-o" 'org-mime-htmlize))))

   (message "* ---[ gnus configuration is complete ]---")
)

;;----------------------------------------------------------------------

(provide 'xy-rc-gnus)
