(use-package dired
  :config
  (define-key dired-mode-map (kbd "(") 'dired-hide-details-mode)
  (define-key dired-mode-map (kbd ")") 'dired-hide-details-mode)
  (define-key dired-mode-map (kbd "C-c C-d") 'dired-hide-details-mode)
  (define-key dired-mode-map (kbd "C-t") 'other-window-or-split))


