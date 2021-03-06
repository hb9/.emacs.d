;; For some reason i still need to require winum here.
(require 'winum)

(use-package winum
  :general
  (:states 'normal
   :prefix hb9/leader-1
   :keymaps 'override
   "0" 'winum-select-window-0
   "1" 'winum-select-window-1
   "2" 'winum-select-window-2
   "3" 'winum-select-window-3
   "4" 'winum-select-window-4
   "5" 'winum-select-window-5
   "6" 'winum-select-window-6
   "7" 'winum-select-window-7
   "8" 'winum-select-window-8
   "9" 'winum-select-window-9)
  :config
  (winum-mode)
  (set-face-attribute 'winum-face nil :weight 'bold)
  ;; Improve the appearance in which-key.
  (push '(("\\(.*\\) 0" . "winum-select-window-0") . ("\\1 0..9" . "window 0..9"))
        which-key-replacement-alist)
  (push '((nil . "winum-select-window-[1-9]") . t) which-key-replacement-alist))

;; prevent vertical splitting
(setq split-height-threshold 999)

(provide 'init-windows)
