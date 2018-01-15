(use-package main-line
  :disabled
  :config
  (setq main-line-separator-style 'arrow)
  (defmain-line row "%4l"))

(use-package powerline
  ;; :disable
  :init (powerline-default-theme))
