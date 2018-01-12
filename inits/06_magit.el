(use-package magit
  ;;:bind (([C-tab] . elscreen-next))
  :config
  (setq magit-auto-revert-mode nil)  
  (defalias 'ms 'magit-status)
  (define-key magit-mode-map [C-tab] 'elscreen-next))


