(use-package anzu
  :init (global-anzu-mode t)
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config
  (setq-default anzu-mode-lighter ""
                anzu-deactivate-region t
                anzu-search-threshold 1000
                anzu-replace-to-string-separator " => "))

