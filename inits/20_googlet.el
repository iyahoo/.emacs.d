(use-package google-translate
  :bind (("C-x C-t"     . google-translate-at-point)
         ("C-x C-M-t" . google-translate-query-translate)
         ("C-x C-r"     . google-translate-at-point-reverse)
         ("C-x C-M-r" . google-translate-query-translate-reverse))
  :init
  (setq-default google-translate-default-source-language "en"
                google-translate-default-target-language "ja"))
