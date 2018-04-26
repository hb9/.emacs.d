
(require 'sbt-mode)
(require 'scala-mode)
(require 'flycheck)

(setq flycheck-scalastylerc
      (expand-file-name "script/tools/scalastyle_cfg.xml" hb9/cloud-dir))


(defun find-spec-name ()
  "Find spec name of current buffer."
  (interactive)
  (message (concat "*." (file-name-sans-extension
                 (file-name-nondirectory (buffer-name))))))


(provide 'lang-scala)
