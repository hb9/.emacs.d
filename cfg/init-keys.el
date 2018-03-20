(use-package which-key
  :diminish
  :config
  (which-key-mode t))

;; bind-map is used to bind keys after a leader key
(use-package bind-map
  :config
  (bind-map hb9/space-leader-map
    :keys ("M-m")
    :evil-keys ("SPC")
    :evil-states (normal motion visual)))

(setq hb9/global-evil-key-maps '(org-mode-map
                                 prog-mode-map
                                 c-mode-map
                                 c-mode-base-map
                                 c++-mode-map
                                 help-mode-map
                                 lisp-mode-map))

;; general is mostly used to define evil normal-state bindings in a
;; lot of modes
(use-package general
  :config
  ;; Important, otherwise evil-bidings take precedence. Alternatevly
  ;; we could specify the state when declaring the current
  ;; key-binding.
  (setq general-default-states '(normal)))



(provide 'init-keys)
