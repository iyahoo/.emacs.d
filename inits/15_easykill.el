(use-package easy-kill
  :bind (([remap kill-ring-save] . easy-kill)
         ("C-M-SPC" . mark-sexp)
         ([remap mark-sexp] . easy-mark)))
