(use-package whitespace
  :bind ("C-x w" . global-whitespace-mode)
  :init (global-whitespace-mode t)
  :config
  (setq whitespace-style '(face tabs tab-mark)
        whitespace-display-mappings '((tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
  (set-face-foreground 'whitespace-tab "#00aaaa")
  (set-face-background 'whitespace-tab 'nil)
  (set-face-underline  'whitespace-tab 'nil)
  (set-face-bold-p 'whitespace-space nil))
