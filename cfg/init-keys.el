
(use-package which-key
  :config
  (which-key-mode t))

;; (use-package general
;;   :ensure t
;;   :config
;;   ;; Important, otherwise evil-bidings take precedence.  Alternatevly we
;;   ;; could specify the state when declaring the current key-binding.
;;   (setq general-default-states '(normal))
;;   ;; According to keybindings i tend to use spacemacs-style.
;;   (setq hb9/leader-key-1 "SPC"
;;         hb9/global-evil-key-maps '(org-mode-map
;;                                    prog-mode-map
;;                                    c-mode-map
;;                                    c-mode-base-map
;;                                    c++-mode-map
;;                                    help-mode-map)))

(use-package bind-map
  :config
  (bind-map hb9/space-leader-map
    :keys ("M-m")
    :evil-keys ("SPC")
    :evil-states (normal motion visual)))

(provide 'init-keys)
