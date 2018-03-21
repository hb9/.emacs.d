(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-org-config)
  (set-face-attribute
   'default nil
   :font "-ADBO-Source Code Pro-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

(provide 'init-theme)
