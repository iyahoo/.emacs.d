(add-to-list 'exec-path "/Users/iyahoo/.stack/programs/x86_64-osx/ghc-8.0.1/bin")
(add-to-list 'exec-path "~/.local/bin")

(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal$" . haskell-cabal-mode))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(add-to-list 'company-backends 'company-ghc)

;; align
;; (add-to-list 'align-rules-list
;;              '(haskell-types
;;                (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
;;                (modes quote (haskell-mode literate-haskell-mode))))
;; (add-to-list 'align-rules-list
;;              '(haskell-assignment
;;                (regexp . "\\(\\s-+\\)=\\s-+")
;;                (modes quote (haskell-mode literate-haskell-mode))))
;; (add-to-list 'align-rules-list
;;              '(haskell-arrows
;;                (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
;;                (modes quote (haskell-mode literate-haskell-mode))))
;; (add-to-list 'align-rules-list
;;              '(haskell-left-arrows
;;                (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
;;                (modes quote (haskell-mode literate-haskell-mode))))

(defun my-haskell-mode-hook ()
    (interactive)
    ;; インデント
    (turn-on-haskell-indentation)
    (turn-on-haskell-doc-mode)
    (font-lock-mode)
    (imenu-add-menubar-index)
    ;; GHCi のコマンドを設定
    (custom-set-variables
     '(haskell-process-type 'stack-ghci))    
    (setq haskell-program-name "/usr/local/bin/stack ghci")
    ;; stack の場合
    ;; Key

    (inf-haskell-mode)
    ;; ghc-mod を使えるように
    (ghc-init)
    ;; flycheck を起動
    (flycheck-mode)
    (define-key haskell-mode-map (kbd "M-s") 'forward-word)
    (define-key haskell-mode-map (kbd "M-y") 'helm-show-kill-ring)
    (define-key haskell-mode-map (kbd "C-x a r") 'align-regexp)
    (define-key haskell-mode-map (kbd "C-c a") 'align)
    (define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
