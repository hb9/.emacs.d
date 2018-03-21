(require 'bind-map)
(require 'which-key)

;; dired-mode overrides evil-keymaps
;; @see https://github.com/noctuid/general.el/issues/99
(general-override-mode)

(general-define-key
 :states '(normal visual emacs)
 :prefix hb9/leader-1
 :keymaps 'override
 "TAB" '(evil-switch-to-windows-last-buffer :which-key "last buffer")

 ;; jumping
 "j" '(:ignore t :which-key "jump")
 "jb" '(bookmark-jump :which-key "bookmark jump")
 "jB" '(bookmark-set :which-key "bookmark set")
 "jd" '(dired-jump :which-key "dired jump")
 "jD" '(dired-jump-other-window :which-key "rename buffer")
 "ji" '(counsel-imenu :which-key "imenu")
 "jw" '(webjump :which-key "webjump")
 "jP" '(lambda ()
         (interactive) (counsel-dired-jump "" hb9/projects-dir))
 "jC" '(lambda ()
         (interactive) (counsel-dired-jump "" hb9/cloud-dir))

 ;; files
 "f" '(:ignore t :which-key "files")
 "ff" '(counsel-find-file :which-key "find file")

 ;; buffers
 "b" '(:ignore t :which-key "buffers")
 "bb" '(counsel-ibuffer :which-key "switch-to-buffer")
 "bd" '(kill-this-buffer :which-key "kill-buffer")

 ;; help 
 "h" '(:ignore t :which-key "help")
 "hv" '(counsel-describe-variable :which-key "describe variable")
 "hf" '(counsel-describe-function :which-key "describe function")
 "hm" '(describe-mode :which-key "describe mode")
 "hb" '(counsel-descbinds :which-key "describe bindings")
 "ht" '(which-key-show-top-level :which-key "top level bindings"))

(provide 'init-bindings)
