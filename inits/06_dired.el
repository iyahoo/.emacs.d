(use-package dired
  :config
  (bind-keys :map dired-mode-map
             ("h" . dired-hide-details-mode)
             ("C-c C-d" . dired-hide-details-mode)))
