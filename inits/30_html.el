(use-package web-mode
  :mode (("\\.html$\\'" . web-mode)
         ("\\.css$\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 4
        web-mode-css-indent-offset 4
        web-mode-script-padding 4))
