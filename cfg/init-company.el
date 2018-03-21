(use-package company
  :bind
  (:map company-active-map
        ("C-j" . company-select-next)
        ("C-k" . company-select-previous))
  :init
  (setq company-dabbrev-ignore-case t)
  (add-hook 'after-init-hook 'global-company-mode)
  :diminish company-mode)

(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1)
  ;; workaround
  ;; @see https://github.com/syl20bnr/spacemacs/issues/2974
  (add-hook
   'company-completion-started-hook
   (lambda (&rest ignore)
     (when evil-mode
       (when (evil-insert-state-p)
         (define-key evil-insert-state-map (kbd "C-k") nil))))))

(provide 'init-company)
