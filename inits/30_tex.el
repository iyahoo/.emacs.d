(use-package tex-mode
  :mode ("\\.tex$" . tex-mode)
  :config
  (setq tex-command "latexmk")
  (cond
   ((eq system-type 'gnu/linux)
    (setq dvi2-command "evince"))
   ((eq system-type 'darwin)
    (setq dvi2-command "open -a Preview")))
  (add-hook 'yatex-mode-hook
            '(lambda () (setq auto-fill-function nil))))
