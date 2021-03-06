(require 'bind-map)
(require 'which-key)
(require 'private-cfg)

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
 "jd" '(dired-jump :which-key "diredjump")
 "jD" '(dired-jump-other-window :which-key "diredjump wnd")
 "ji" '(counsel-imenu :which-key "imenu")
 "jw" '(webjump :which-key "webjump")
 "jP" '((lambda ()
          (interactive) (counsel-dired-jump "" hb9/projects-dir))
        :which-key "projects")
 "jC" '((lambda ()
          (interactive) (counsel-dired-jump "" hb9/cloud-dir))
        :which-key "cloud")

 ;; searching
 "s" '(:ignore t :which-key "search")
 "sW" '((lambda ()
          (interactive) (counsel-ag "" hb9/wiki-dir)) :which-key "wiki")
 "sg" '(counsel-rg :which-key "counsel rg")
 "sG" '(grep :which-key "plain grep")
 "sd" '(find-grep-dired :which-key "find grep dired")

 ;; files
 "f" '(:ignore t :which-key "files")
 "ff" '(counsel-find-file :which-key "find file")
 "fr" '(counsel-recentf :which-key "recent file")

 ;; buffers
 "b" '(:ignore t :which-key "buffers")
 "bb" '(helm-mini :which-key "switch-to-buffer")
 "bd" '(kill-this-buffer :which-key "kill-buffer")

 ;; apps
 "a" '(:ignore t :which-key "apps")
 "am" '(mu4e :which-key "mu4e")
 "ac" '(calc :which-key "calc")
 "ao" '(org-agenda :which-key "org agenda")
 "aC" '(org-capture :which-key "org capture")

 ;; project
 "p" '(:ignore t :which-key "project")
 "pa" '(projectile-ag :which-key "projectile ag")
 "ps" '(counsel-git-grep :which-key "git grep")
 "pf" '(projectile-find-file :which-key "find file")
 "pb" '(projectile-switch-to-buffer :which-key "switch buffer")
 "pr" '(projectile-dired :which-key "root folder")

 ;; toggle
 "t" '(:ignore t :which-key "toggle")
 "tS" '(flyspell-mode :which-key "spelling")

 ;; spelling
 "S" '(:ignore t :which-key "spelling")
 "Sd" '(ispell-change-dictionary :which-key "change dict")

 ;; help
 "h" '(:ignore t :which-key "help")
 "hv" '(counsel-describe-variable :which-key "describe variable")
 "hf" '(counsel-describe-function :which-key "describe function")
 "hm" '(describe-mode :which-key "describe mode")
 "hb" '(counsel-descbinds :which-key "describe bindings")
 "ht" '(which-key-show-top-level :which-key "top level bindings"))

(provide 'init-bindings)
