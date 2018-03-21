(use-package eww
  :init
  (setq browse-url-browser-function
        '((".*google.*maps.*" . browse-url-generic)
          ;; Github goes to firefox, but not gist
          ("http.*\/\/github.com" . browse-url-generic)
          ("groups.google.com" . browse-url-generic)
          ("docs.google.com" . browse-url-generic)
          ("melpa.org" . browse-url-generic)
          ;; ("stackoverflow\.com" . browse-url-generic)
          ("apache\.org\/jira" . browse-url-generic)
          ("twitter.com" . browse-url-generic)
          ("youtube.com" . browse-url-generic)
          ("amazon.com" . browse-url-generic)
          ("." . eww-browse-url)))
  (setq shr-external-browser 'browse-url-generic)
  (setq browse-url-generic-program (executable-find "firefox"))
  (use-package eww-lnum
    :config
    (defun hb9/eww-lnum-follow-new-window ()
      (interactive)
      (setq current-prefix-arg '(4))
      (call-interactively 'eww-lnum-follow)))

  :general
  (:states '(normal visual emacs)
   :keymaps 'eww-mode-map
   "o" '(eww :which-key "open")
   "O" '(eww-browse-with-external-browser :which-key "open external")
   "DEL" '(eww-back-url :which-key "go back")
   "S-DEL" '(eww-forward-url :which-key "go forward")
   "f" '(eww-lnum-follow :which-key "follow")
   "F" '(hb9/eww-lnum-follow-new-window :which-key "follow new window")
   "u" '(eww-lnum-universal :which-key "follow universal")))

(require 'webjump)
(setq webjump-sites
      (append '(
                ("Google Search" .
                 [simple-query "google.com" "https://www.google.de/search?q=" ""])
                ("Stackoverflow Search" .
                 [simple-query "stackoverflow.com" "https://stackoverflow.com/search?q=" ""]))))

(provide 'init-web)
