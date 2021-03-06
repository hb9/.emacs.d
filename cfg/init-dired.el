(require 'dired)
(require 'dired-x)

(use-package dired
  :defer t
  :config
  (add-hook 'dired-mode-hook 'dired-hide-details-mode)
  (setq dired-dwim-target t)
  :general
  (:keymaps 'dired-mode-map
   :prefix hb9/leader-2
   "o" '(dired-omit-mode :which-key "omit")
   "w" '(wdired-change-to-wdired-mode :which-key "wdired")))

(use-package dired-x
  :after dired
  :config
  (setq-default dired-omit-files-p t
                dired-omit-verbose nil)
  (setq
   dired-listing-switches "-alhv"
   dired-omit-files "^\\.\\|^#.#$\\|.~$"))

(use-package dired-narrow
  :defer t
  :general
  (:keymaps 'dired-mode-map
   :prefix hb9/leader-2
   "/" '(dired-narrow-fuzzy :which-key "narrow fuzzy")))

(use-package dired-filter
  :defer t
  :general
  (:keymaps 'dired-mode-map
   :prefix hb9/leader-2
   "f" '(:ignore t :which-key "filter")
   "fn" '(dired-filter-by-name :which-key "by name")
   "fd" '(dired-filter-by-directory :which-key "by directory")
   "fe" '(dired-filter-by-extension :which-key "by extension")
   "ff" '(dired-filter-by-file :which-key "by file")
   "fp" '(dired-filter-pop :which-key "pop")
   "fP" '(dired-filter-pop-all :which-key "pop all")
   "ft" '(dired-filter-transpose :which-key "transpose")
   "fo" '(dired-filter-or :which-key "or")
   "fa" '(dired-filter-and :which-key "and")
   "fN" '(dired-filter-negate :which-key "negate")))

(provide 'init-dired)
