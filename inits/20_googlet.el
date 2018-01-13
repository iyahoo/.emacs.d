(use-package google-translate
  :bind (("C-x C-t"     . google-translate-at-point)
         ;; ("C-x C-T" . google-translate-query-translate)
         ("C-x C-r"     . google-translate-at-point-reverse)
         ;; ("C-x C-R" . google-translate-query-translate-reverse)
         )
  :config
  (custom-set-variables
   '(google-translate-default-source-language "en")
   '(google-translate-default-target-language "ja")))

