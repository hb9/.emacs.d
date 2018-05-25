(require 'sbt-mode)
(require 'scala-mode)
(require 'flycheck)
(require 'engine-mode)
(require 'ensime)

(use-package scala-mode
  :config
  (add-hook 'scala-mode-hook 'flycheck-mode)
  :general
  (:keymaps 'scala-mode-map
            :states '(normal visual)
            :prefix hb9/leader-2
            "s" '(:ignore t :which-key "sbt")
            "ss" '(sbt-start :which-key "start")
            "sr" '(sbt-send-region :which-key "send region")))

(use-package helm-dash
  :config
  (add-hook 'scala-mode-hook '(lambda ()
          (interactive) (setq-local helm-dash-docsets '("Scala" "Java"))))
  :general
  (:keymaps 'scala-mode-map
            :states '(normal visual)
            :prefix hb9/leader-2
            "d" '(:ignore t :which-key "docs")
            "dd" '(helm-dash :which-key "dash")
            "dh" '(helm-dash-at-point :which-key "dash here")))

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
