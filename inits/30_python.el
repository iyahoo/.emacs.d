(use-package jedi
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  :config
  (setq jedi:complete-on-dot t))

(use-package python-mode
  :mode (("\\.py\\'" . python-mode))
  :init
  (setq python-shell-interpreter "python3"
        python-shell-interpreter-args "-i")
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save))

(use-package virtualenvwrapper :disabled)
(use-package auto-virtualenvwrapper
  :disabled
  :init
  (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate))
