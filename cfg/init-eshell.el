(setq eshell-aliases-file
      (expand-file-name "eshell/eshell_aliases.txt" user-emacs-directory)
      eshell-buffer-maximum-lines 20000)
(setq hb9/shell-counter 0)

(defun hb9/shell-naming ()
  "rename shells"
  (let ((hb9/temp-counter 1))
    (setq hb9/shell-counter (1- hb9/shell-counter))
    (while (<= hb9/temp-counter hb9/shell-counter)
      (unless (get-buffer (concat "esh-" (number-to-string hb9/temp-counter)))
        (set-buffer (concat "esh-" (number-to-string (+ hb9/temp-counter 1))))
        (rename-buffer (concat "esh-" (number-to-string hb9/temp-counter)))
        )
      (setq hb9/temp-counter (1+ hb9/temp-counter)))))

(defun hb9/remove-shell ()
  "remove shell"
  (message "remove shell")
  (run-with-timer 0 nil 'hb9/shell-naming))

(defun hb9/add-shell ()
  "add shell"
  (message "add shell")
  (setq hb9/shell-counter (1+ hb9/shell-counter))
  (dolist (buffer (buffer-list t))
    (set-buffer buffer)
    (when (eq major-mode 'eshell-mode)
      (message (buffer-name))
      (when (string= (buffer-name) "*eshell*")
        (message "found new eshell")
        (rename-buffer (concat "esh-" (number-to-string hb9/shell-counter)))))))

(add-hook 'eshell-mode-hook 'hb9/add-shell)
(add-hook 'eshell-exit-hook 'hb9/remove-shell)

(defun hb9/eshell-kill-input ()
  (interactive)
  (evil-goto-line)
  (evil-append-line nil)
  (eshell-kill-input))

(defun hb9/eshell-goto-end ()
  (interactive)
  (evil-goto-line)
  (evil-append-line nil))

(with-eval-after-load 'esh-opt
  (add-hook 'eshell-mode-hook
            (lambda ()
              (evil-define-key 'insert eshell-mode-map
                (kbd "<tab>") 'completion-at-point)
              (evil-define-key 'insert eshell-mode-map
                (kbd "M-c") 'counsel-esh-history)
              (evil-define-key 'insert eshell-mode-map
                (kbd "C-g") 'hb9/eshell-kill-input)
              (evil-define-key 'insert eshell-mode-map
                (kbd "C-a") 'eshell-bol)
              (evil-define-key 'insert eshell-mode-map
                (kbd "C-e") 'end-of-line)
              (evil-define-key 'normal eshell-mode-map
                (kbd "G") 'hb9/eshell-goto-end))))

;; {{ taken from Howard Abrams
;; @see http://howardism.org/Technical/Emacs/eshell-present.html
(defun eshell/-buffer-as-args (buffer separator command)
  "Takes the contents of BUFFER, and splits it on SEPARATOR, and
runs the COMMAND with the contents as arguments. Use an argument
`%' to substitute the contents at a particular point, otherwise,
they are appended."
  (let* ((lines (with-current-buffer buffer
                  (split-string
                   (buffer-substring-no-properties (point-min) (point-max))
                   separator)))
         (subcmd (if (-contains? command "%")
                     (-flatten (-replace "%" lines command))
                   (-concat command lines)))
         (cmd-str  (string-join subcmd " ")))
    (message cmd-str)
    (eshell-command-result cmd-str)))

(defun eshell/bargs (buffer &rest command)
  "Passes the lines from BUFFER as arguments to COMMAND."
  (eshell/-buffer-as-args buffer "\n" command))

(defun eshell/sargs (buffer &rest command)
  "Passes the words from BUFFER as arguments to COMMAND."
  (eshell/-buffer-as-args buffer nil command))

(defun eshell/clear ()
  "Clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
;; }}

(provide 'init-eshell)
