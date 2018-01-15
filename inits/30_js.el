(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode)
  :config
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))
