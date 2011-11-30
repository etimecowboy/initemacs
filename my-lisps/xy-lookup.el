;;; xy-lookup.el --- lookup various of references

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Maintainer: Xin Yang
;; Created: 28 Jan 2011
;; Time-stamp:<2011-11-30 Wed 07:43 xin on P6T-WIN7>
;; Keywords:
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:


;; REF: http://xahlee.org/emacs/emacs_lookup_ref.html
;; use emacs as a dictionary application, that allows you to lookup
;; the definitions of a word under cursor, or any general reference
;; such as Wikipedia, Google, or lookup documentation of computer
;; language's keywords.

;; press F6 will launch your browser and lookup definition of the word
;; under cursor.

;; You can change the url to a different online dictionary reference
;; website.

;; Here are some other online dictionary sites and their url search
;; syntax, using sample word “curlicue”. AHD means American Heritage
;; Dictionary.

;; http://education.yahoo.com/reference/dictionary/entry/curlicue (AHD)
;; http://www.answers.com/main/ntquery?s=curlicue (AHD)
;; http://en.wiktionary.org/wiki/curlicue (wiktionary)
;; http://m-w.com/dictionary/curlicue (Merriam Webster)
;; http://www.askoxford.com/concise_oed/curlicue (Compact Oxford Eng Dict )
;; http://www.yourdictionary.com/curlicue
;; http://dictionary.reference.com/browse/curlicue (AHD, Random House, WordNet, ...)
;; http://www.dict.org/bin/Dict?Form=Dict2&Database=*&Query=curlicue (OpenSource Dicts)

;;;###autoload
(defun lookup-word-definition ()
  "Look up the current word's definition in a browser.
If a region is active (a phrase), lookup that phrase."
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))

    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat
                 "http://www.askoxford.com/concise_oed/" myword))

    (browse-url myurl)
    ;; (w3m-browse-url myurl) ;; if you want to browse using w3m
    ))

;;--------------------------------------------------------------------

;; The following is a example of looking up Wikipedia.
;; Here are some example urls for some reference lookup sites.
;; Perl       http://perldoc.perl.org/search.html?q=‹SearchWord›
;; PHP        http://us.php.net/‹SearchWord›
;; LSL        http://wiki.secondlife.com/wiki/‹SearchWord›
;; AHK        http://www.autohotkey.com/docs/commands/‹SearchWord›.htm
;; Wikipedia  http://en.wikipedia.org/wiki/‹SearchWord›
;; Google     http://www.google.com/search?q=‹SearchWord›

;;;###autoload
(defun lookup-wikipedia ()
  "Look up the word under cursor in Wikipedia.
This command generates a url for Wikipedia.com and switches you
to browser. If a region is active (a phrase), lookup that phrase."
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    t
    (setq myword (replace-regexp-in-string " " "_" myword))
    (setq myurl (concat "http://en.wikipedia.org/wiki/" myword))
    (browse-url myurl)
    ))

;;--------------------------------------------------------------------

;; REF: http://blog.tuxicity.se/?p=32
;; by Johan Andersson
;; Two of my most frequently used tools when programming are Emacs and
;; Firefox. And much of the time in Firefox I spend on Google. That’s
;; why I created this (simple) function that googles a region. Just
;; select the region you want to google and then do M-x google-region
;; (or preferably bind a key to it).

;;;###autoload
(defun google-region (beg end)
  "Google the selected region."
  (interactive "r")
  (browse-url (concat
               "http://www.google.co.uk/search?ie=utf-8&oe=utf-8&q="
               (buffer-substring beg end))))

(provide 'xy-lookup)

;;; xy-lookup.el ends here
