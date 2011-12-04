;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-openwith.el'
;; Time-stamp:<2011-12-04 Sun 17:34 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `openwith.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun openwith-settings ()
  "Settings of `openwith.el'."
  (GNULinux
   (setq openwith-associations
         '(
           ("\\.pdf\\'" "acroread" (file))
           ;; ("\\.mp3\\'" "xmms" (file))
           ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mkv\\|rm\\|rmvb\\)\\'" "smplayer" (file))
           ;; ("\\.\\(?:jp?g\\|png\\)\\'" "display" (file))
           ("\\.jar\\'" "java -jar" (file))
           )))
  (message "* ---[ openwith configuration is complete ]---")
)

(provide 'xy-rc-openwith)
