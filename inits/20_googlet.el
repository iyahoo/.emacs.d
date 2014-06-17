(global-set-key (kbd "C-x C-t") 'google-translate-at-point)
(global-set-key (kbd "C-x C-S-t") 'google-translate-query-translate)
(global-set-key (kbd "C-x C-r") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-x C-S-r") 'google-translate-query-translate-reverse)

(custom-set-variables
 ;; '(google-translate-default-source-language "ja")
 ;; '(google-translate-default-target-language "en")
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja"))

(push '("*Google Translate*") popwin:special-display-config)
