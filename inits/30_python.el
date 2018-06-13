(use-package jedi
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  :config
  (setq jedi:complete-on-dot t))

(use-package python-mode
  :mode (("\\.py\\'" . python-mode)))

(use-package virtualenvwrapper)
(use-package auto-virtualenvwrapper
  :init
  (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate))
