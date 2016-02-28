;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'font-lock-mode)
;; (add-hook 'haskell-mode-hook 'imenu-add-menubar-index)

;; (custom-set-variables
;;  '(haskell-indent-after-keywords (quote (("where" 4 0) ("of" 4) ("do" 4) ("mdo" 4) ("rec" 4) ("in" 4 0) ("{" 4) "if" "then" "else" "let")))
;;  '(haskell-indent-offset 4)
;;  '(haskell-indent-spaces 4))

;; ;; http://d.hatena.ne.jp/kitokitoki/20111217/p1
;; ;; ghc-mod
;; ;; cabal でインストールしたライブラリのコマンドが格納されている bin ディレクトリへのパスを exec-path に追加する
;; (add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))

;; ;; ghc-flymake.el などがあるディレクトリ ghc-mod を ~/.emacs.d 以下で管理することにした
;; (add-to-list 'load-path "~/.emacs.d/ghc-mod")

;; (autoload 'ghc-init "ghc" nil t)
;; (autoload 'ghc-debug "ghc" nil t)
;; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; ;; ;; https://github.com/m2ym/auto-complete
;; (ac-define-source ghc-mod
;;   '((depends ghc)
;;     (candidates . (ghc-select-completion-symbol))
;;     (symbol . "s")
;;     (cache)))

;; (defun my-ac-haskell-mode ()
;;   (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-ghc-mod)))
;; (add-hook 'haskell-mode-hook 'my-ac-haskell-mode)

;; (defun my-haskell-ac-init ()
;;   (when (member (file-name-extension buffer-file-name) '("hs" "lhs"))
;;     (auto-complete-mode t)
;;     (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-ghc-mod))))

;; (add-hook 'find-file-hook 'my-haskell-ac-init)
