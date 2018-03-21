(use-package ivy
  :diminish
  :bind
  (:map ivy-minibuffer-map
        ("C-j" . ivy-next-line)
        ("C-k" . ivy-previous-line)
        ("C-h" . ivy-backward-kill-word))
  :init
  (ivy-mode 1)
  (setq ivy-fixed-height-minibuffer t
        ;; ivy-extra-directories nil
        ivy-re-builders-alist '((swiper . ivy--regex-plus) (t . ivy--regex-fuzzy))
        ivy-use-virtual-buffers t))

(use-package swiper
  :config
  (global-set-key "\C-s" 'swiper))

(provide 'init-ivy)
