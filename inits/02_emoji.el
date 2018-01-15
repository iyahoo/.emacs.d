(use-package emojify
  :config
  (defalias 'emoji-sheet 'emoji-cheat-sheet-plus-insert)
  (defalias 'emoji 'emojify-mode)
  (add-hook 'magit-mode-hook 'emojify-mode)
  (add-hook 'text-mode-hook 'emojify-mode)
  (add-hook 'markdown-mode-hook 'emojify-mode))



