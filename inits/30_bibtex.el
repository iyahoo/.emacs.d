(use-package bibtex
  :mode (("\\.bib$" . bibtex-mode))
  :config
  (setq bibtex-align-at-equal-sign t)
  (bind-key "C-i" 'bibtex-fill-entry bibtex-mode-map))

