(use-package popwin
  :commands popwin-mode
  :init (add-hook 'after-init-hook #'popwin-mode)
  :config
  ;; (bind-key "C-z" popwin:keymap)
  (setq popwin:special-display-config
        '(("*quickrun*" :dedicated t :position bottom :noselect t :height 0.4)
          ("*helm mini*" :dedicated t :position bottom :height 0.7)
          ("^\*[Hh]elm.+\*" :regexp t :dedicated t :position bottom :height 0.4)
          ;; ("*Helm Swoop*" :regexp t :dedicated t :position bottom)
          ("*Google Translate*" :position bottom :height 0.4 :dedicated t))))

