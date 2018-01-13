(use-package whitespace
  :bind ("C-x w" . global-whitespace-mode)
  :init (global-whitespace-mode t)
  :config
  (setq whitespace-style '(face tabs tab-mark spaces space-mark)
        whitespace-display-mappings '((space-mark ?\u3000 [?\u25a1])
                                      (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t]))
        whitespace-space-regexp "\\(\u3000+\\)")
  (set-face-foreground 'whitespace-tab "#00aaaa")
  (set-face-background 'whitespace-tab 'nil)
  (set-face-underline  'whitespace-tab 'nil)
  (set-face-foreground 'whitespace-space "#7cfc00")

  (set-face-background 'whitespace-space 'nil)
  (set-face-bold-p 'whitespace-space t))
