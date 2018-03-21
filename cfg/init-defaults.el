(use-package better-defaults
  :ensure t)

(column-number-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default
 make-backup-files nil)

(provide 'init-defaults)
