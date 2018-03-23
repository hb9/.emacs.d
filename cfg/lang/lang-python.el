
(require 'elpy)
(elpy-enable)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(provide 'lang-python)
