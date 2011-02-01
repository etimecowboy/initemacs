;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*- 
;;--------------------------------------------------------------------
;; File name:    `xy-image-dired+.el'
;; Time-stamp:<2011-01-30 Sun 23:26 xin on P6T>
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
        (concat image-dired-dir "/image-dired_db"))
  (setq image-dired-temp-image-file
        (concat image-dired-dir "/image-dired_temp-others"))
  (OfficePC
   (setq image-dired-db-file
         (concat image-dired-dir "/image-dired_db-office"))
   (setq image-dired-temp-image-file
         (concat image-dired-dir "/image-dired_temp-office")))
  (HomeDesktop
   (setq image-dired-db-file
         (concat image-dired-dir "/image-dired_db-home-desktop"))
   (setq image-dired-temp-image-file
         (concat image-dired-dir "/image-dired_temp-home-desktop")))
  (Laptop
   (setq image-dired-db-file
         (concat image-dired-dir "/image-dired_db-laptop"))
   (setq image-dired-temp-image-file
         (concat image-dired-dir "/image-dired_temp-laptop")))

  (setq image-file-name-extensions 
        '("png"  "PNG"  "jpeg" "JPEG" "jpg" "JPG" 
          "gif"  "GIF"  "bmp"  "BMP"
          "tiff" "TIFF" "tif"  "TIF"  "xbm" "XBM" 
          "xpm"  "XPM"  "pbm"  "PBM"  "pgm" "PGM" 
          "ppm"  "PPM"  "pnm"  "PNM" 
          "svg"  "SVG"  "eps"  "EPS")))

(provide 'xy-image-dired+.el)
