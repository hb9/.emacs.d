
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")))

;; Initialize, but don't load installed packages yet.
(package-initialize t)

;; taken from Steve Purcell
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;; Install all missing packages.
(require-package 'use-package)
(require-package 'undo-tree)
(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-nerd-commenter)
(require-package 'evil-lisp-state)
(require-package 'which-key)
(require-package 'bind-map)
(require-package 'general)
(require-package 'smartparens)
(require-package 'company)

;; Now load all packages.
(package-initialize)


(eval-when-compile
  (require 'use-package))

(provide 'init-packages)
