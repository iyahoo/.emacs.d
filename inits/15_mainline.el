(use-package main-line
  :disabled t
  :config
  (setq main-line-separator-style 'arrow)
  (defmain-line row "%4l"))

(use-package powerline
  :disabled t
  :init (powerline-default-theme))
