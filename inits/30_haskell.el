(require 'haskell-mode)
(require 'haskell-cabal)
(require 'inf-haskell)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

;; (setq haskell-program-name "cabal repl")

(custom-set-variables '(haskell-process-type 'cabal-repl))

;; ghc-mod
(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(add-to-list 'load-path "~/.emacs.d/elisp/ghc-mod")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
  (lambda () (ghc-init)))
(add-to-list 'ac-sources 'ac-source-ghc-mod)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'auto-highlight-symbol-mode)

(add-hook 'inferior-haskell-mode-hook 'auto-complete-mode)
(add-hook 'inferior-haskell-mode-hook 'auto-highlight-symbol-mode)



(fset 'haskell-type-complete
   "\C-a\C-c\C-t\C-m\C-t\C-e\C-e\C-p\C-a\C-k\C-t\C-p\C-y\C-h\C-a\C-n")

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
     (define-key haskell-mode-map (kbd "C-c C-r") 'inferior-haskell-load-and-run)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
     (define-key haskell-mode-map (kbd "C-c C-l") 'inferior-haskell-load-file)
     (define-key haskell-mode-map (kbd "C-c C-t") 'inferior-haskell-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-type-complete)
     (define-key haskell-mode-map (kbd "M-s") 'forward-word)))

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))
