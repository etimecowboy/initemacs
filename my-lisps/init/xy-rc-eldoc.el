;;   -*- mode: emacs-eldoc; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-eldoc.el'
;; Time-stamp:<2011-12-04 Sun 16:39 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `eldoc.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun eldoc-print-current-symbol-info-anyway ()
  "Print current symbol info."
  (interactive)
  (condition-case err
      (if eldoc-documentation-function
          (eldoc-message (funcall eldoc-documentation-function))
        (let* ((current-symbol (eldoc-current-symbol))
               (current-fnsym  (eldoc-fnsym-in-current-sexp))
               (doc (cond
                     ((null current-fnsym)
                      nil)
                     ((eq current-symbol (car current-fnsym))
                      (or (apply 'eldoc-get-fnsym-args-string
                                 current-fnsym)
                          (eldoc-get-var-docstring current-symbol)))
                     (t
                      (or (eldoc-get-var-docstring current-symbol)
                          (apply 'eldoc-get-fnsym-args-string
                                 current-fnsym))))))
          (eldoc-message doc)))
    ;; This is run from post-command-hook or some idle timer thing,
    ;; so we need to be careful that errors aren't ignored.
    (error (message "eldoc error: %s" err))))

;;;###autoload
(defun eldoc-settings ()
  "settings for `eldoc'."
  ;; (defun eldoc-pre-command-refresh-echo-area ())
  (setq eldoc-idle-delay 0.5)
  (eldoc-add-command 'describe-symbol-at-point 'View-scroll-half-page-backward 'l-command
                     'save-buffer-sb 'switch-to-other-buffer)
  (eldoc-remove-command 'goto-paren)
  (message "* ---[ eldoc configuration is complete ]---")
)

;; ;;;###autoload
;; (defun eldoc-face-settings ()
;;   "Face settings for `eldoc'."
;;   (custom-set-faces
;;    '(eldoc-highlight-function-argument
;;      ((((type tty)) :bold t :foreground "green")
;;       (t :bold nil :foreground "green")))))

(provide 'xy-rc-eldoc)
