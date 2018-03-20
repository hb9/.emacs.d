
(use-package company
  :config
  (setq company-global-modes
           '(not
             eshell-mode comint-mode
             minibuffer-inactive-mode))

  (add-hook 'after-init-hook 'global-company-mode))

(provide 'init-company)
