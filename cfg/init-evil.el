(require 'which-key)

(use-package evil
  :config
  (evil-mode 1)
  (setq-default evil-default-state 'normal)
  (setq avy-all-windows 'all-frames)

  ;; fix scrolling
  (global-set-key (kbd "M-u") 'universal-argument)
  (define-key universal-argument-map (kbd "M-u") 'universal-argument-more)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)))

(use-package evil-nerd-commenter
  :bind (:map hb9/space-leader-map
              ("c l" . evilnc-comment-or-uncomment-lines)
              ("c y" . evilnc-copy-and-comment-operator)
              ("c c" . evilnc-comment-operator))
  :init
  (which-key-add-key-based-replacements
    ;; SPC
    "SPC c" "comment"
    ;; M-m
    "M-m c" "comment"))


(use-package evil-lisp-state
  :init (setq evil-lisp-state-global t)
  :config
  ;; Dont use any leader. Instead use an arkward binding and trigger
  ;; that via 'unread-command-events'. This workaround solves some
  ;; problems in dired mode.
  (evil-lisp-state-leader "C-#")
  (bind-map-set-keys hb9/space-leader-map
    "k" '(lambda () (interactive)
           (setq unread-command-events (listify-key-sequence (kbd "C-#")))))
  (which-key-add-key-based-replacements
    ;; SPC
    "SPC k" "lispy"
    ;; M-m
    "M-m k" "lispy"))

(use-package evil-anzu
  :init (global-anzu-mode t)
  :diminish 'anzu-mode
  :config
  (setq anzu-search-threshold 1000))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1)
  (general-define-key :keymaps hb9/global-evil-key-maps
                      "s" 'evil-surround-region))

(provide 'init-evil)
