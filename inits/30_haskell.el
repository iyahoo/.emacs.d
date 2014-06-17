(require 'haskell-mode)

(autoload 'haskell-mode "haskell-mode")
(autoload 'haskell-cabal "haskell-cabal")
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
(setq haskell-program-name "/usr/local/bin/ghci")


;; ghc-mod
(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.cabal/share/x86_64-osx-ghc-7.6.3/ghc-mod-3.1.7")
(autoload 'ghc-init "ghc")
(ghc-init)
(add-to-list 'ac-sources 'ac-source-ghc-mod)

(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
(add-hook 'haskell-mode-hook 'auto-highlight-symbol-mode)

;; (add-hook 'haskell-mode-hook 'flycheck-mode)

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
     (define-key haskell-mode-map (kbd "C-c C-r") 'inferior-haskell-load-and-run)
     (define-key haskell-mode-map (kbd "M-s") 'forward-word)))
  

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))
