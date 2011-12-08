;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `xy-rc-org-google-weather.el'
;; Time-stamp:<2011-12-07 Wed 22:36 xin on P6T-WIN7>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `org-google-weather.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun org-google-weather-settings ()
  "Settings of `org-google-weather.el'."
  (setq org-google-weather-cache-time 3600)
  (setq org-google-weather-display-icon-p t)
  (setq org-google-weather-format "%i %C: %c, [%l,%h] %s")
  (setq org-google-weather-icon-alist
        (quote ((chance_of_rain . "weather-showers-scattered.png")
                (chance_of_snow . "weather-snow.png")
                (chance_of_storm . "weather-storm.png")
                (cn_cloudy . "weather-overcast.png")
                (cn_heavyrun . "weather-showers.png")
                (cn_sunny . "weather-clear.png")
                (cloudy . "weather-overcast.png")
                (dust . "weather-fog.png")
                (flurries . "weather-storm.png")
                (fog . "weather-fog.png")
                (haze . "weather-fog.png")
                (icy . "weather-snow.png")
                (jp_sunny . "weather-clear.png")
                (jp_cloudy . "weather-overcast.png")
                (mist . "weather-storm.png")
                (mostly_cloudy . "weather-overcast.png")
                (mostly_sunny . "weather-clear.png")
                (partly_cloudy . "weather-few-clouds.png")
                (rain . "weather-showers.png")
                (rain_snow . "weather-snow.png")
                (sleet . "weather-snow.png")
                (smoke . "weather-fog.png")
                (snow . "weather-snow.png")
                (storm . "weather-storm.png")
                (thunderstorm . "weather-storm.png")
                (sunny . "weather-clear.png"))))
  (setq org-google-weather-icon-directory (concat my-local-image-path
                                                  "/gnome-status"))
  (setq org-google-weather-use-google-icons nil)
  (message "* ---[ org-google-weather configuration is complete ]---"))

(provide 'xy-rc-org-google-weather)