(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-global-mode)
  (setq projectile-switch-project-action 'projectile-dired
        projectile-completion-system 'ivy
        projectile-enable-caching t
        projectile-mode-line "")) ;; fix tramp

(provide 'init-projectile)
