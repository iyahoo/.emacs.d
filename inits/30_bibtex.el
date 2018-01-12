(add-to-list 'auto-mode-alist '("\\.bib$" . bibtex-mode))

(add-hook 'bibtex-mode-hook
  '(lambda ()
     (setq bibtex-align-at-equal-sign t)
     (define-key bibtex-mode-map (kbd "C-i") 'bibtex-fill-entry)))


