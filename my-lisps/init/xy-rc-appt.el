;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-appt.el'
;; Time-stamp:<2011-12-07 Wed 21:58 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `appt.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun appt-settings ()
  "Settings of `appt'."
  ;; (add-hook 'diary-hook 'appt-make-list)
  ;; (setq appt-display-format 'window)
  ;; (setq appt-display-diary nil)

  (setq appt-time-msg-list nil)
  (setq appt-audible t)
  (setq appt-display-format 'echo)
  (setq appt-message-warning-time 15)
  (setq appt-display-interval 5)
  (setq appt-display-duration (* 365 24 60 60))
  (setq appt-display-mode-line t)

  ;; REF: (@url :file-name "http://lists.gnu.org/archive/html/emacs-orgmode/2009-11/msg00236.html" :display "Post@emacs-orgmode")
  ;; NOTE: May do the job twice with (@file :file-name "xy-rc-org.el" :to "org-show-notification-handler" :display "`org-show-notification-handler'")
  (when window-system
    (when (try-require 'xy-todochiku)
      (setq appt-display-format 'window)

      (defun xy/appt-display (min-to-app new-time msg)
        (todochiku-message "appt notification" msg
                           (todochiku-icon 'emacs)))

      (setq appt-disp-window-function (function xy/appt-display))))

  ;; turn appointment checking on
  (unless (daemonp) (appt-activate 1))

  (message "* ---[ appt configuration is complete ]---"))

(provide 'xy-rc-appt)
