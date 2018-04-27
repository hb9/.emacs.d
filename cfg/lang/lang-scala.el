(require 'sbt-mode)
(require 'scala-mode)
(require 'flycheck)
(require 'engine-mode)

(use-package scala-mode
  :config
  (add-hook 'scala-mode-hook 'flycheck-mode)
  :general
  (:keymaps 'scala-mode-map
            :prefix hb9/leader-2
            "s" '(:ignore t :which-key "sbt")
            "ss" '(sbt-start :which-key "start")
            "sr" '(sbt-send-region :which-key "send region")))

(use-package flycheck
  :config
  (setq flycheck-scalastylerc
        (expand-file-name "script/tools/scalastyle_cfg.xml" hb9/cloud-dir)))

(use-package engine-mode
  :config
  (defengine scala-docs
    "https://www.scala-lang.org/files/archive/api/2.12.3/?search=%s"
    :browser 'eww-browse-url)
  :general
  (:keymaps 'scala-mode-map
            :prefix hb9/leader-2
            "d" '(engine/search-scala-docs :which-key "docs")))

;; WIP
;; I plan to do something similar to this:
;; https://coderwall.com/p/z6riog/my-emacs-scala-development-environment
;;
;; (defun find-spec-name ()
;;   "Find spec name of current buffer."
;;   (interactive)
;;   (message (concat "*." (file-name-sans-extension
;;                  (file-name-nondirectory (buffer-name))))))

(provide 'lang-scala)
