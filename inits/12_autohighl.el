(global-auto-highlight-symbol-mode)

(global-set-key (kbd "<f8>") 'highlight-symbol-at-point)
(global-set-key (kbd "M-<f8>") 'highlight-symbol-remove-all)

(add-hook 'lisp-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'REPL 'auto-highlight-symbol-mode)
