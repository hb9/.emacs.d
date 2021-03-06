(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

;; Initialize, but don't load installed packages yet.
(package-initialize t)

;; {{ taken from Steve Purcell
;; Copyright (c) 2006-2017, Steve Purcell
;; All rights reserved.
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))
;; }}


;; install packages
(require-package 'use-package)
(require-package 'undo-tree)
(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-anzu)
(require-package 'evil-nerd-commenter)
(require-package 'evil-lisp-state)
(require-package 'expand-region)
(require-package 'which-key)
(require-package 'winum)
(require-package 'bind-map)
(require-package 'general)
(require-package 'smartparens)
(require-package 'pos-tip)
(require-package 'company)
(require-package 'company-quickhelp)
(require-package 'diminish)
(require-package 'flx)
(require-package 'counsel)
(require-package 'swiper)
(require-package 'helm)
(require-package 'helm-dash)
(require-package 'hydra)
(require-package 'ivy-hydra)
(require-package 'dired-hacks-utils)
(require-package 'dired-filter)
(require-package 'dired-narrow)
(require-package 'dired-subtree)
(require-package 'git-commit)
(require-package 'magit)
(require-package 'smeargle)
(require-package 'git-gutter-fringe+)
(require-package 'evil-magit)
(require-package 'evil-collection)
(require-package 'eww-lnum)
(require-package 'projectile)
(require-package 'ag)
(require-package 'wgrep)
(require-package 'doom-themes)
(require-package 'nyan-mode)
(require-package 'sbt-mode)
(require-package 'ensime)
(require-package 'scala-mode)
(require-package 'flycheck)
(require-package 'engine-mode)
(require-package 'flycheck-tip)
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'company-lsp)
(require-package 'lsp-python)
(require-package 'pyvenv)

;; load packages
(package-initialize)
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(eval-when-compile
  (require 'use-package))

(provide 'init-packages)
