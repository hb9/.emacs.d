(use-package which-key
  :diminish
  :config
  (which-key-mode t))

(use-package bind-map
  :config
  (bind-map hb9/space-leader-map
    :keys ("M-m")
    :evil-keys ("SPC")
    :evil-states (normal motion visual)))

(provide 'init-keys)
