(use-package helm
  :bind (:map helm-map
              ("C-j" . helm-next-line)
              ("C-k" . helm-previous-line)))

(use-package helm-dash
  :config
  (setq helm-dash-browser-func 'browse-url-generic))

(provide 'init-helm)
