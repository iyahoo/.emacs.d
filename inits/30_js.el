(use-package web-mode
  :mode ("\\.js\\'" . web-mode)
  :config
  (custom-set-variables
   '(web-mode-enable-auto-quoting nil)
   '(web-mode-enable-current-column-highlight t)
   '(web-mode-enable-current-element-highlight t)
   '(web-mode-markup-indent-offset 2)))
