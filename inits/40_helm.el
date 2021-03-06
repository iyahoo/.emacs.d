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
             helm-ag-this-file
             helm-find-files)
  :bind
  (("M-y" . helm-show-kill-ring)
   ("M-x" . helm-M-x)
   ("C-o" . helm-swoop)
   ("C--" . helm-company)
   ("C-c o" . helm-multi-swoop)
   ("C-c h" . helm-mini)
   ("C-c s" . helm-imenu)
   ("C-x C-f" . helm-find-files)
   )
  :init
  (defalias 'hg 'helm-do-grep)
  (defalias 'ht 'helm-etags-select)
  (defalias 'ha 'helm-ag)
  (defalias 'haf 'helm-ag-this-file)
  :config
  (bind-keys :map helm-map
             ("C-h" . nil)
             ("C-h" . backward-delete-char)
             :map helm-buffer-map
             ("C-h" . nil)
             ("C-h" . backward-delete-char)))
