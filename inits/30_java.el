(use-package meghanada
  :init
  (add-hook 'java-mode-hook
            (lambda ()
              (meghanada-mode t)
              (setq c-basic-offset 2)
              (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
  :config
  (setq meghanada-java-path "java"
        meghanada-maven-path "mvn"
        tab-width 4))
