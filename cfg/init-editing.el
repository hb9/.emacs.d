(use-package smartparens
  :diminish
  :config
  (smartparens-global-mode t)
  (require 'smartparens-config))

(use-package undo-tree
  :diminish)

(use-package expand-region
  :general
  (:states 'normal
   :prefix hb9/leader-1
   :keymaps 'override
   "v" '(er/expand-region :which-key "expand region"))
  (:states 'visual
   :keymaps 'override
   "M-v" '(er/contract-region :which-key "contract region"))
  :config
  (setq expand-region-contract-fast-key "M-v"))

(provide 'init-editing)
