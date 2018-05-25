(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)

(push 'company-lsp company-backends)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(provide 'lang-lsp)
