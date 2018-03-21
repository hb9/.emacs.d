(use-package which-key
  :diminish
  :config
  (which-key-mode t))

(require 'general)

;; define some leader keys
(setq hb9/leader-1 "SPC")
(setq hb9/leader-2 ",")

(provide 'init-keys)
