(use-package magit
  :commands magit-status magit-blame
  :init
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))
  :config
  (setq magit-branch-arguments nil
        ;; don't put "origin-" in front of new branch names by default
        magit-default-tracking-name-function 'magit-default-tracking-name-branch-only
        ;; magit-push-always-verify nil
        ;; Get rid of the previous advice to go into fullscreen
        magit-restore-window-configuration t)

  :bind ("C-x g" . magit-status)
  :general
  (:states 'normal
   :prefix hb9/leader-1
   :keymaps 'override
   "g" '(:ignore t :which-key "git")
   "gs" '(magit-status :which-key "magit status")
   "gb" '(magit-blame :which-key "magit blame")
   "gB" '(magit-blame-quit :which-key "magit blame quit")))

(use-package smeargle
  :general
  (:states 'normal
   :prefix hb9/leader-1
   :keymaps 'override
   "gh" '(:ignore t :which-key "highlight")
   "ghh" '(smeargle-commits :which-key "highlight by age of changes")
   "ght" '(smeargle :which-key "highlight by last update time")
   "ghc" '(smeargle-clear :which-key "clear")))

(use-package git-gutter-fringe+
  :diminish git-gutter+-mode
  :config
  (fringe-helper-define 'git-gutter-fr+-added nil
    "..X...."
    "..X...."
    "XXXXX.."
    "..X...."
    "..X...."
    )
  (fringe-helper-define 'git-gutter-fr+-deleted nil
    "......."
    "......."
    "XXXXX.."
    "......."
    "......."
    )
  (fringe-helper-define 'git-gutter-fr+-modified nil
    "..X...."
    ".XXX..."
    "XX.XX.."
    ".XXX..."
    "..X...."
    )
  (setq git-gutter-fr+-side 'right-fringe)
  (global-git-gutter+-mode 1))

;; optional: this is the evil state that evil-magit will use
;; (setq evil-magit-state 'normal)
;; optional: disable additional bindings for yanking text
;; (setq evil-magit-use-y-for-yank nil)
(require 'evil-magit)

(provide 'init-git)
