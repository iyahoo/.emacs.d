(use-package markdown-mode
  :mode (("\\.text\\'"      . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'"       . markdown-mode))
  :config
  (setq markdown-command "/usr/local/bin/markdown")
  (setq markdown-command-needs-filename t))
