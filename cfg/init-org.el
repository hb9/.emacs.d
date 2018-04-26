(require 'private-cfg)

;; defaults
(setq org-directory hb9/wiki-dir
      org-agenda-files (quote (hb9/wiki-general-dir
                               hb9/projects-dir))
      org-agenda-files hb9/org-files
      org-default-notes-file hb9/note-file
      org-hide-emphasis-markers t
      org-startup-indented t
      org-edit-src-content-indentation 0
      org-return-follows-link t
      org-log-done t
      org-log-into-drawer t
      org-src-window-setup 'current-window)

;; todo and agenda
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(i)" "|" "DONE(d!)")
        (sequence "WAITING(w@/!)" "|" "CANCELED(c@)"))
      org-agenda-start-day "-10d"
      org-agenda-span 40
      org-tag-alist (quote (("readit" . ?R)
                            ("date" . ?d)
                            ("code" . ?C)
                            ("R" . ?r)
                            ("C" . ?c)
                            ("pyhton" . ?p)
                            ("java" . ?j)
                            ("elisp" . ?L)
                            ("htmlcss" . ?h)
                            ("js" . ?J)
                            ("bash" . ?B)
                            ("perl" . ?P)
                            ("emacs" . ?e)
                            ("git" . ?g)
                            ("linux" . ?l)
                            ("errand" . ?E)
                            ("meeting" . ?m)
                            ("note" . ?n)
                            ("file-note" . ?F)
                            ("bookmark" . ?b)
                            ("project" . ?o)
                            ("work" . ?w)
                            ("cash" . ?$))))

;; capture
(setq org-capture-templates
      '(("b"               ; key
         "Bookmark"        ; name
         entry             ; type
         (file+headline hb9/bookmark-file "Unsorted")  ; target
         "* [[%^{LINK}][%^{TITLE}]] :bookmark:%^G \n:PROPERTIES:\n:Created: %U\n:END:\n%i\n"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
         :immediate-finish
         :kill-buffer t)   ; properties

        ;; For taking notes on random things
        ("n"               ; key
         "Note"            ; name
         entry             ; type
         (file+headline hb9/note-file "Notes")  ; target
         "* %^{TITLE} :note:%^G \n:PROPERTIES:\n:Created: %U\n:END:\n%i\n%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
         :kill-buffer t)   ; properties

        ;; For taking notes on files
        ("f"               ; key
         "File-Note"            ; name
         entry             ; type
         (file+headline hb9/note-file "File-Notes")  ; target
         "* %^{TITLE} :file-note:%^G \n:PROPERTIES:\n:Created: %U\n:Linked: %a\n:END:\n%i\n%A\n%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
         :kill-buffer t)   ; properties

        ;; For notes or something regarding more work
        ("w"               ; key
         "Work"            ; name
         entry             ; type
         (file+headline hb9/note-file "Work")  ; target
         "* TODO %^{Todo} :work:\n:PROPERTIES:\n:Created: %U\n:END:\n%i\n%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
         :kill-buffer t)   ; properties

        ;; Calendar date
        ("c"               ; key
         "Calendar"         ; name
         entry             ; type
         (file hb9/cal-file)  ; target
         "* %^{Title} :date:\n\n%^t\n"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
         :immediate-finish
         :kill-buffer t)   ; properties

        ;; To capture tons of errands
        ("e"               ; key
         "Errands"         ; name
         entry             ; type
         (file+headline hb9/note-file "Errands")  ; target
         "* TODO %^{Todo} :errands:\n:PROPERTIES:\n:Created: %U\n:END:\n%i\n%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
         :kill-buffer t)   ; properties

        ("j"
         "Journal"
         entry
         (file+datetree hb9/diary-file)
         "* %?\n%U\n"
         :empty-lines 0
         :kill-buffer t)))

;; latex
(add-hook 'spacemacs-post-user-config-hook
          (lambda () (plist-put org-format-latex-options :scale 1.3)))

;; babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (js . t)
   (C . t)
   (dot . t)
   (sql . t)
   (clojure . t)
   (scala . t)
   (lisp . t)))

(setq org-babel-clojure-backend 'cider
      org-babel-python-command "python3"
      org-confirm-babel-evaluate nil
      org-structure-template-alist (append org-structure-template-alist
                                           '(("sel" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC")
                                             ("sp" "#+BEGIN_SRC python :results output\n?\n#+END_SRC")
                                             ("ss" "#+BEGIN_SRC scala :results output\n?\n#+END_SRC"))))

;; contacts
;; (use-package org-contacts
;;   :config
;;   (add-to-list 'org-capture-templates
;;                '("t" "Contacts" entry (file hb9/org-contacts-file)
;;                  "* %(org-contacts-template-name)\n:PROPERTIES:\n:EMAIL: %(org-contacts-template-email)\n:END:"))
;;   (setq org-contacts-files (list hb9/org-contacts-file)))
(provide 'init-org)
