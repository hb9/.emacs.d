(use-package ivy
  :diminish
  :bind
  (:map ivy-minibuffer-map
        ("C-j" . ivy-next-line)
        ("C-k" . ivy-previous-line)
        ("C-h" . ivy-backward-kill-word)
        ("C-l" . ivy-alt-done)
        ("TAB" . ivy-alt-done)
        ("C-SPC" . ivy-call)
        ("C-m" . ivy-immediate-done))
  :init
  (ivy-mode 1)
  (setq ivy-fixed-height-minibuffer t
        ivy-use-virtual-buffers t))

(use-package swiper
  :config
  (global-set-key (kbd "C-s") 'swiper))

(use-package counsel
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x))

(provide 'init-ivy)
