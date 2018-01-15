(use-package anzu
  :init
  (setq-default anzu-mode-lighter ""
                anzu-deactivate-region t
                anzu-search-threshold 1000
                anzu-replace-to-string-separator " => ")
  (global-anzu-mode t)
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp)))

