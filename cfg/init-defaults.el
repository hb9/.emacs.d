(use-package better-defaults
  :ensure t)

(column-number-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default
 make-backup-files nil
 recentf-max-saved-items 1000
 recentf-max-menu-items 200)

(provide 'init-defaults)
