(require 'which-key)

(use-package evil
  :config
  (evil-mode 1)
  (setq-default evil-default-state 'normal)
  (setq avy-all-windows 'all-frames)

  ;; Fix scrolling and unbind ','-key (reserved for the second leader key)
  (global-set-key (kbd "M-u") 'universal-argument)
  (define-key universal-argument-map (kbd "M-u") 'universal-argument-more)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-motion-state-map (kbd ",") nil)))

(use-package evil-nerd-commenter
  :commands
  evilnc-comment-operator
  evilnc-copy-and-comment-operator
  :general
  (:states '(normal visual)
   :prefix hb9/leader-1
   :keymaps 'override
   "c" '(:ignore t :which-key "comment")
   "cc" '(evilnc-comment-operator :which-key "comment operator")
   "cy" '(evilnc-copy-and-comment-operator :which-key "copy-comment operator")
   "cl" '(evilnc-comment-or-uncomment-lines :which-key "(un)comment lines")))

(use-package evil-lisp-state
  :init (setq evil-lisp-state-global t)
  :config
  (evil-lisp-state-leader "SPC k")
  (which-key-add-key-based-replacements
    "SPC k" "lisp-state"))

(use-package evil-anzu
  :init (global-anzu-mode t)
  :diminish 'anzu-mode
  :config
  (setq anzu-search-threshold 1000))

(use-package evil-surround
  :commands evil-surround-region
  :config
  (global-evil-surround-mode 1)
  :general
  (:keymaps 'visual
   "s" '(evil-surround-region :which-key "surround")))

(provide 'init-evil)
