;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-image-dired.el'
;; Time-stamp:<2011-12-04 Sun 17:13 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired+.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun image-dired-settings ()
  "Settings for `dired'."
  (setq image-dired-dir (concat my-var-path "/image-dired"))
  (GNULinux
   (setq image-dired-main-image-directory "~/Pictures"))
  (Windows
   (setq image-dired-main-image-directory "~/My Pictures"))
  (setq image-dired-db-file
        (concat image-dired-dir "/image-dired_db-"
                user-login-name "@"
                system-name "@"
                system-configuration))
  (setq image-dired-temp-image-file
        (concat image-dired-dir "/image-dired_temp-"
                user-login-name "@"
                system-name "@"
                system-configuration))
  (setq image-file-name-extensions
        '("png"  "PNG"  "jpeg" "JPEG" "jpg" "JPG"
          "gif"  "GIF"  "bmp"  "BMP"
          "tiff" "TIFF" "tif"  "TIF"  "xbm" "XBM"
          "xpm"  "XPM"  "pbm"  "PBM"  "pgm" "PGM"
          "ppm"  "PPM"  "pnm"  "PNM"
          "svg"  "SVG"  "eps"  "EPS"))
  (message "* ---[ image-dired configuration is complete ]---")
)

(provide 'xy-image-dired)
