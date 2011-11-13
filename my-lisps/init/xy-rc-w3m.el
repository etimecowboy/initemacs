;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-rc-w3m.el'
;; Time-stamp:<2011-11-13 Sun 00:42 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `Emacs-w3m' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; REF: ahei's settings

;;;###autoload
(defun w3m-browse-current-buffer ()
  "Use w3m browser current buffer."
  (interactive)
  (w3m-browse-buffer))

;;;###autoload
(defun w3m-settings ()
  "Settings for `w3m'."

;;   (defvar w3m-buffer-name-prefix "*w3m" "Name prefix of w3m buffer")
;;   (defvar w3m-buffer-name (concat w3m-buffer-name-prefix "*") "Name of w3m buffer")
;;   (defvar w3m-bookmark-buffer-name (concat w3m-buffer-name-prefix "-bookmark*") "Name of w3m buffer")
;;   (defvar w3m-dir (concat my-emacs-lisps-path "emacs-w3m/") "Dir of w3m.")

  (setq w3m-add-tab-number t)
  (setq w3m-arrived-file "~/emacs/w3m/arrived")
  (setq w3m-bookmark-file "~/emacs/w3m/bookmark.html")
  (setq w3m-coding-system 'utf-8)
  (setq w3m-command-arguments '("-cookie" "-F"))
  (setq w3m-cookie-file "~/emacs/w3m/cookie")
  (setq w3m-default-coding-system 'utf-8)
  (setq w3m-default-directory "~/emacs/w3m")
  (setq w3m-default-display-inline-images nil)
  (setq-default w3m-display-inline-images nil)
  (setq w3m-default-save-directory "~/emacs/w3m")
  (setq w3m-display-inline-image t)
  (setq w3m-favicon-cache-file "~/emacs/w3m/favicach")
  (setq w3m-favicon-use-cache-file t)
  (setq w3m-file-coding-system 'utf-8)
  (setq w3m-file-name-coding-system 'utf-8)
  (setq w3m-fill-column 100)
  (setq w3m-form-textarea-directory "~/emacs/w3m/textarea")
  (setq w3m-home-page "http://www.google.co.uk")
  (setq w3m-icon-directory (concat my-local-image-path "/w3m"))
  (setq w3m-image-default-background "")
  ;; (setq w3m-init-file "~/.emacs.d/xy-w3m.el")
  (setq w3m-keep-cache-size 500)
  (setq w3m-new-session-in-background t)
  (setq w3m-new-session-url "about:blank")
  (setq w3m-prefer-cache t)
  (setq w3m-profile-directory "~/emacs/w3m")
  (setq w3m-session-file "~/emacs/w3m/sessions")
  (setq w3m-terminal-coding-system 'utf-8)
  (setq w3m-use-ange-ftp t)
  (setq w3m-use-cookies t)
  (setq w3m-use-favicon nil)
  (setq w3m-use-mule-ucs t)
  (setq w3m-view-this-url-new-session-in-background t))

  
;;   (defun w3m-mode-settings ()
;;     (make-local-variable 'hl-line-face)
;;     (setq hl-line-face 'hl-line-nonunderline-face)
;;     (setq hl-line-overlay nil)
;;     (color-theme-adjust-hl-line-face))

;;   (add-hook 'w3m-mode-hook 'w3m-mode-settings)

;;   (defun w3m-save-current-buffer ()
;;     "Save current w3m buffer."
;;     (interactive)
;;     (save-excursion
;;       (mark-whole-buffer)
;;       (call-interactively 'copy-region-as-kill-nomark))
;;     (with-temp-buffer
;;       (call-interactively 'yank)
;;       (call-interactively 'write-file)))

;;   (defun w3m-print-current-url ()
;;     "Display current url."
;;     (interactive)
;;     (w3m-message "%s" (w3m-url-readable-string w3m-current-url)))

;;   (defun w3m-copy-current-url ()
;;     "Display the current url in the echo area and put it into `kill-ring'."
;;     (interactive)
;;     (when w3m-current-url
;;       (let ((deactivate-mark nil))
;;         (kill-new w3m-current-url)
;;         (w3m-print-current-url))))

;;   (defun view-w3m-bookmark ()
;;     "View w3m bokmark."
;;     (interactive)
;;     (let ((buffer (get-buffer w3m-bookmark-buffer-name)))
;;       (if buffer
;;           (switch-to-buffer buffer)
;;         (with-current-buffer (get-buffer-create w3m-bookmark-buffer-name)
;;           (w3m-mode)
;;           (w3m-bookmark-view)))))

;;   (defun switch-to-w3m ()
;;     "Switch to *w3m* buffer."
;;     (interactive)
;;     (let ((buffer (get-buffer w3m-buffer-name)))
;;       (if buffer
;;           (switch-to-buffer buffer)
;;         (message "Could not found w3m buffer."))))

;;   (defun w3m-browse-buffer (&optional buffer)
;;     "Use w3m browser buffer BUFFER."
;;     (interactive "bBuffer to browse use w3m: ")
;;     (unless buffer (setq buffer (current-buffer)))
;;     (let* ((file (buffer-file-name buffer))
;;            (name (buffer-name buffer)))
;;       (if file
;;           (w3m-goto-url-new-session file)
;;         (with-current-buffer buffer
;;           (save-excursion
;;             (mark-whole-buffer)
;;             (call-interactively 'copy-region-as-kill-nomark)))
;;         (let* ((new-name
;;                 (concat
;;                  w3m-buffer-name-prefix
;;                  "-"
;;                  (if (string= "*" (substring name 0 1))
;;                      (substring name 1)
;;                    (concat name "*"))))
;;                (new-buffer (get-buffer-create new-name)))
;;           (switch-to-buffer new-buffer)
;;           (call-interactively 'yank)
;;           (w3m-buffer)
;;           (w3m-mode)
;;           (setq w3m-current-title (buffer-name))))))

;;   ;; fix small bug about of `w3m-auto-show'
;;   ;; see my-blog/emacs/w3m-auto-show-bug.htm
;;   (defun w3m-auto-show ()
;;     "Scroll horizontally so that the point is visible."
;;     (when (and truncate-lines
;;                w3m-auto-show
;;                (not w3m-horizontal-scroll-done)
;;                (not (and (eq last-command this-command)
;;                          (or (eq (point) (point-min))
;;                              (eq (point) (point-max)))))
;;                (or (memq this-command '(beginning-of-buffer end-of-buffer))
;;                    (string-match "\\`i?search-"
;;                                  (if (symbolp this-command) (symbol-name this-command) ""))
;;                    (and (markerp (nth 1 w3m-current-position))
;;                         (markerp (nth 2 w3m-current-position))
;;                         (>= (point)
;;                             (marker-position (nth 1 w3m-current-position)))
;;                         (<= (point)
;;                             (marker-position (nth 2 w3m-current-position))))))
;;       (w3m-horizontal-on-screen))
;;     (setq w3m-horizontal-scroll-done nil))

;;   (defun w3m-link-numbering (&rest args)
;;     "Make overlays that display link numbers."
;;     (when w3m-link-numbering-mode
;;       (save-excursion
;;         (goto-char (point-min))
;;         (let ((i 0)
;;               overlay num)
;;           (catch 'already-numbered
;;             (while (w3m-goto-next-anchor)
;;               (when (get-char-property (point) 'w3m-link-numbering-overlay)
;;                 (throw 'already-numbered nil))
;;               (setq overlay (make-overlay (point) (1+ (point)))
;;                     num (format "[%d]" (incf i)))
;;               (w3m-static-if (featurep 'xemacs)
;;                   (progn
;;                     (overlay-put overlay 'before-string num)
;;                     (set-glyph-face (extent-begin-glyph overlay)
;;                                     'w3m-link-numbering))
;;                 (w3m-add-face-property 0 (length num) 'w3m-link-numbering num)
;;                 (overlay-put overlay 'before-string num)
;;                 (overlay-put overlay 'evaporate t))
;;               (overlay-put overlay 'w3m-link-numbering-overlay i)))))))

;;   (eal-define-keys
;;    'w3m-mode-map
;;    `(("<backtab>" w3m-previous-anchor)
;;      ("n"         w3m-next-anchor)
;;      ("p"         w3m-previous-anchor)
;;      ("w"         w3m-next-form)
;;      ("b"         w3m-previous-form)
;;      ("f"         w3m-go-to-linknum)
;;      ("M-n"       w3m-next-buffer)
;;      ("M-p"       w3m-previous-buffer)
;;      ("C-k"       kill-this-buffer)
;;      ("C-k"       w3m-delete-buffer)
;;      ("C-c 1"     w3m-delete-other-buffers)
;;      ("1"         delete-other-windows)
;;      ("C-x C-s"   w3m-save-current-buffer-sb)
;;      ("P"         w3m-print-current-url)
;;      ("U"         w3m-print-this-url)
;;      ("c"         w3m-copy-current-url)
;;      ("g"         w3m-goto-url-new-session)
;;      ("G"         w3m-goto-url)
;;      ("d"         w3m-download-this-url-sb)
;;      ("M-d"       w3m-download-sb)
;;      ("s"         w3m-search)
;;      ("S"         w3m-history)
;;      ("u"         View-scroll-page-backward)
;;      ("J"         roll-down)
;;      ("K"         roll-up)
;;      ("o"         other-window)
;;      ("m"         w3m-view-this-url-new-session)
;;      ("C-h"       w3m-view-previous-page)
;;      ("F"         w3m-view-next-page)
;;      ("C-;"       w3m-view-next-page)
;;      ("r"         w3m-reload-this-page)
;;      ("v"         w3m-bookmark-view-new-session)
;;      ("M-e"       w3m-bookmark-edit)
;;      ("'"         switch-to-other-buffer))))

;; (defun w3m-face-settings ()
;;   "Face settings for `w3m'."
;;   (set-face-foreground 'w3m-arrived-anchor-face "magenta"))

;; (eval-after-load "w3m"
;;   `(w3m-face-settings))


;; ;; My previous settings
;; (GNULinux
;;  (when (try-require 'w3m-load)
;;    ;;(require 'w3m-buffer)
;;    ;;(require 'mime-w3m)
;;    (setq browse-url-browser-function 'w3m-browse-url)
;;    (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;    ;; (setq w3m-icon-directory (concat path-prefix "w3m/icons"))
;;    ;; (setq w3m-icon-directory "~/.emacs.d/icons/w3m")

;;    ;; Make this comment if you have no a proper proxy
;;    ;; (setq w3m-command-arguments-alist
;;    ;;       '( ;; Don't use any additional options to visit local web pages.
;;    ;;     ("^http://\\([^/]*\\.\\)*your_internal_website_name\\(/\\|$\\)"
;;    ;;      "-no-proxy")
;;    ;;     ;; Use the proxy server to visit any foreign urls.
;;    ;;     (""
;;    ;;      "-o" "http_proxy=http://your_proxy:80/")))

;;    ;;  optional keyboard short-cut
;;    ;; (global-set-key "\C-xm" 'browse-url-at-point)

;;    ;; Middle click to open url in a new sesstion (tab)
;;    ;;(define-key w3m-mode-map [mouse-2] 'w3m-mouse-view-this-url-new-session)

;;    (setq w3m-add-tab-number t)
;;    (setq w3m-arrived-file "~/emacs/w3m/arrived")
;;    (setq w3m-bookmark-file "~/emacs/w3m/bookmark.html")
;;    (setq w3m-coding-system 'utf-8)
;;    (setq w3m-cookie-file "~/emacs/w3m/cookie")
;;    (setq w3m-default-coding-system 'utf-8)
;;    (setq w3m-default-directory "~/emacs/w3m")
;;    (setq w3m-default-display-inline-images t)
;;    (setq w3m-default-save-directory "~/emacs/w3m")
;;    (setq w3m-display-inline-image t)
;;    (setq w3m-favicon-cache-file "~/emacs/w3m/favicach")
;;    (setq w3m-favicon-use-cache-file t)
;;    (setq w3m-file-coding-system 'utf-8)
;;    (setq w3m-file-name-coding-system 'utf-8)
;;    (setq w3m-fill-column 120)
;;    (setq w3m-form-textarea-directory "~/emacs/w3m/textarea")
;;    (setq w3m-home-page "http://www.google.co.uk")
;;    (setq w3m-icon-directory "~/.emacs.d/icons/w3m")
;;    (setq w3m-image-default-background "")
;;    (setq w3m-init-file "~/.emacs.d/xy-w3m.el")
;;    (setq w3m-keep-cache-size 500)
;;    (setq w3m-new-session-in-background t)
;;    (setq w3m-new-session-url "about:blank")
;;    (setq w3m-prefer-cache t)
;;    (setq w3m-profile-directory "~/emacs/w3m")
;;    (setq w3m-session-file "~/emacs/w3m/sessions")
;;    (setq w3m-terminal-coding-system 'utf-8)
;;    (setq w3m-use-ange-ftp t)
;;    (setq w3m-use-cookies t)
;;    (setq w3m-use-mule-ucs t)
;;    (setq w3m-view-this-url-new-session-in-background t)
;;    )  
;;  )

(provide 'xy-rc-w3m)
