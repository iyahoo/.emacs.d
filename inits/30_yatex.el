(use-package yatex-mode
  :mode ("\\.tex$" . yatex-mode)
  :config
  (setq tex-command "/usr/local/bin/platex2pdf"
        YaTeX-environment-indent 4)
  (cond
   ((eq system-type 'gnu/linux)
    (setq dvi2-command "evince"))
   ((eq system-type 'darwin)
    (setq dvi2-command "open -a Preview")))
  (add-hook 'yatex-mode-hook
            '(lambda () (setq auto-fill-function nil))))
