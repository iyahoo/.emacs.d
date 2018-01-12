(defalias 'hg 'helm-do-grep)
(defalias 'ht 'helm-etags-select)
(defalias 'ha 'helm-ag)
(defalias 'haf 'helm-ag-this-file)
(setq recentf-max-saved-items 10000)
(setq kill-ring-max 1000)

(bind-keys* ("M-y" . helm-show-kill-ring)
            ("M-x" . helm-M-x)
            ("C-o" . helm-swoop)
            ("C-c o" . helm-multi-swoop)
            ("C-c h" . helm-mini)
            ("C-c -" . helm-c-yas-complete)
            ("C-c s" . helm-imenu)
            ("C--" . helm-company))

(use-package helm-mode
  :commands (helm-occur-from-isearch
             helm-show-kill-ring
             helm-M-x
             helm-swoop
             helm-multi-swoop
             helm-mini
             helm-c-yas-complete
             helm-imenu
             helm-company
             helm-do-grep
             helm-etags-select
             helm-ag
             helm-ag-this-file))
