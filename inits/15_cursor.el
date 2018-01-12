(use-package smartrep
  :disabled t
  :bind (("C-," . er/expand-region)
         ("C-M-," . er/contract-region)
         ("<C-M-return>" . mc/edit-lines))
  :config
  (smartrep-define-key
   global-map "C-." '(("C-n" . 'mc/mark-next-like-this)
                      ("C-p" . 'mc/mark-previous-like-this)
                      ("*"   . 'mc/mark-all-like-this))))



