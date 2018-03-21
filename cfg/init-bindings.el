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
 ;; "j i" 'counsel-imenu
 "j w" 'webjump
 ;; "j P" '(lambda ()
 ;;          (interactive) (counsel-dired-jump "" "~/projects"))
 ;; "j C" '(lambda ()
 ;;          (interactive) (counsel-dired-jump "" "~/cloud"))

 ;; files
 "f" '(:ignore t :which-key "files")
 "ff" '(find-file :which-key "find file")

 ;; buffers
 "b" '(:ignore t :which-key "buffers")
 "bb" '(switch-to-buffer :which-key "switch-to-buffer")

 ;; help 
 )

(provide 'init-bindings)
