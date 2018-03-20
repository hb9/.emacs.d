(require 'dired)
(require 'dired-x)
(require 'evil)

(add-hook 'dired-mode-hook
          (lambda ()
            (evil-define-key 'normal dired-mode-map
              (kbd "SPC") '(lambda () (interactive)
                             (setq unread-command-events (listify-key-sequence "\M-m"))))
            ))

(provide 'init-dired)
