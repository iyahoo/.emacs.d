(use-package cua-mode
  :bind (([C-return] . cua-set-rectangle-mark))
  :init
  (cua-mode t)
  (setq cua-enable-cua-keys nil))





