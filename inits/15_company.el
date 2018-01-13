(use-package company
  :diminish company-mode
  :bind (("M-i" . company-complete)
         :map company-active-map
         ("M-p" . company-select-previous)
         ("M-n" . company-select-next)
         ("C-v" . scroll-up-command)
         ("M-v" . scroll-down-command)
         ("C-h" . backward-delete-char))
  :init (add-hook 'after-init-hook #'global-company-mode)
  :config
  (setq company-idle-delay            0.1
        company-minimum-prefix-length 2))
