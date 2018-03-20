
(defun hb9/switch-cfg ()
  (interactive)
  (start-process-shell-command "switch-cfg" "*scratch*" (concat "cd ~"
                                                                " && "
                                                                "mv .emacs.d .emacs.d_hb9"
                                                                " && "
                                                                "mv .emacs.d_space .emacs.d")))

(provide 'misc-functions)
