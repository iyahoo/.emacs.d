(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
(define-key lisp-mode-map (kbd "C-c C-d") 'lispxmp)

;; Clozure CLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "ccl")
;; (setq inferior-lisp-program "clisp")

;; ~/.emacs.d/slimeをload-pathに追加
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
(slime-setup '(slime-repl slime-fancy slime-banner))

(defalias 'sl-restart 'slime-restart-inferior-lisp)

;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
