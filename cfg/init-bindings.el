(require 'bind-map)
(require 'which-key)

(bind-map-set-keys hb9/space-leader-map
  "TAB" 'evil-switch-to-windows-last-buffer

  ;; jump to
  "j b" 'bookmark-jump
  "j B" 'bookmark-set
  "j d" 'dired-jump
  "j D" 'dired-jump-other-window
  ;; "j i" 'counsel-imenu
  "j w" 'webjump
  ;; "j P" '(lambda () 
  ;;          (interactive) (counsel-dired-jump "" "~/projects"))
  ;; "j C" '(lambda () 
  ;;          (interactive) (counsel-dired-jump "" "~/cloud")) 
  )

(which-key-add-key-based-replacements
  ;; SPC
  "SPC j" "jump"
  ;; M-m
  "M-m j" "jump")

(provide 'init-bindings)
