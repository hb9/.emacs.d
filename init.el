;; define some places first


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(add-to-list 'load-path (expand-file-name "cfg" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "misc" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "elpa" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "../.emacs_private" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
      (load custom-file))


;; this must come first
(require 'init-packages)

;; core functionality
(require 'init-defaults)
(require 'init-files)
(require 'init-keys)
(require 'init-evil)
(require 'init-editing)
(require 'init-windows)
(require 'init-dired)
(require 'init-eshell)

;; configure packages
(require 'init-ivy)
(require 'init-company)
(require 'init-git)
(require 'init-org)

;; visual appearence
(require 'init-theme)

;; load misc stuff
(require 'misc-functions)

;; load private data
(require 'private-cfg)

;; global bindings
(require 'init-bindings)
