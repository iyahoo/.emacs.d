(use-package sql
  :config
  (sql-set-product "mysql")
  (setq sql-mysql-login-params (append sql-mysql-login-params '(port)))
  (add-hook 'sql-mode-hook 'sqlind-minor-mode))
