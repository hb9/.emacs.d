(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)
(require 'lsp-python)

(add-hook 'python-mode-hook #'lsp-python-enable)
(add-hook 'python-mode-hook #'flymake-mode)

(use-package flymake-mode
  :config
  :general
  (:keymaps 'python-mode-map
            :states '(normal visual)
            :prefix hb9/leader-2
            "e" '(:ignore t :which-key "error")
            "en" '(flymake-goto-next-error :which-key "next")
            "ep" '(flymake-goto-prev-error :which-key "prev")
            "ee" '((lambda () (interactive) (previous-line)
                     (call-interactively 'flymake-goto-next-error))
                   :which-key "display")))

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(provide 'lang-python)
