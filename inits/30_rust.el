(use-package rust-mode
  :init
  (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (bind-key "TAB" #'company-indent-or-complete-common rust-mode-map)
  (setq company-tooltip-align-annotations t))


