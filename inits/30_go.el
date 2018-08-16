(use-package go-mode
  :init
  (add-to-list 'exec-path (expand-file-name "~/go/bin/"))
  (add-to-list 'exec-path (expand-file-name "/usr/local/opt/go/libexec/bin"))
  (add-hook 'go-mode-hook (lambda ()
                            (add-hook 'before-save-hook 'gofmt-before-save)
                            ()))
  :config
  (bind-keys
   :map go-mode-map
   ("M-i" . company-go)))


