(use-package magit
  :init
  (defalias 'ms 'magit-status)
  :config
  (setq magit-auto-revert-mode nil))
