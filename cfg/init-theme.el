(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-eighties)
  (set-face-attribute
   'default nil
   :font "-ADBO-Source Code Pro-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

(provide 'init-theme)
