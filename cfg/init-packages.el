(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

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


;; install packages
(require-package 'use-package)
(require-package 'undo-tree)
(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-anzu)
(require-package 'evil-nerd-commenter)
(require-package 'evil-lisp-state)
(require-package 'which-key)
(require-package 'winum)
(require-package 'bind-map)
(require-package 'general)
(require-package 'smartparens)
(require-package 'company)
(require-package 'diminish)
(require-package 'doom-themes)

;; load packages
(package-initialize)
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(eval-when-compile
  (require 'use-package))

(provide 'init-packages)
