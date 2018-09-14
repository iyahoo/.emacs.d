(use-package symbol-overlay
  :bind (("M-s" . symbol-overlay-put)
         ("M-n" . symbol-overlay-switch-forward)
         ("M-p" . symbol-overlay-switch-backward)
         ("<f8>" . symbol-overlay-remove-all)))

;; TODO

(use-package fic-mode
  :defer nil
  :init (fic-mode t)
  :config
  (setq fic-activated-faces '(font-lock-comment-face))
  (set-face-background 'fic-face "yellow")
  (set-face-background 'fic-author-face "yellow"))
