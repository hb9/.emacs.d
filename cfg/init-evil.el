(use-package evil
  :config
  (evil-mode 1)
  (setq-default evil-default-state 'normal)
  (setq avy-all-windows 'all-frames)

  ;; fix scrolling
  (global-set-key (kbd "M-u") 'universal-argument)
  (define-key universal-argument-map (kbd "M-u") 'universal-argument-more)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)))

(use-package evil-nerd-commenter
  :config
  :bind (:map hb9/space-leader-map
              ("c l" . evilnc-comment-or-uncomment-lines)
              ("c y" . evilnc-copy-and-comment-operator)
              ("," . evilnc-comment-operator)))

(use-package evil-lisp-state
  :init (setq evil-lisp-state-global t)
  :config
  (evil-lisp-state-leader "SPC k"))

(use-package evil-anzu
  :init (global-anzu-mode t)
  :diminish 'anzu-mode
  :config
  (setq anzu-search-threshold 1000))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
