(use-package haskell-mode  
  :mode (("\\.hs$" . haskell-mode)
         ("\\.lhs$" . literate-haskell-mode)
         ("\\.cabal$" . haskell-cabal-mode))
  :init
  (add-to-list 'exec-path "/Users/iyahoo/.stack/programs/x86_64-osx/ghc-8.0.1/bin")
  (add-to-list 'exec-path "~/.local/bin")
  (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
  (add-hook 'haskell-mode-hook 'haskell-doc-mode)
  :config
  (setq-default haskell-process-type 'stack-ghci)
  (setq haskell-process-type 'stack-ghci)
  (setq haskell-process-path-ghci "stack")
  (setq haskell-process-args-ghci "ghci"))
