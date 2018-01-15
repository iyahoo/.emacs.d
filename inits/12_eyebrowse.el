;; Alternative of elscreen
(use-package eyebrowse
  :bind* (([C-tab]   . eyebrowse-next-window-config)
          ([C-S-tab] . eyebrowse-prev-window-config)
          ("C-c w d" . eyebrowse-close-window-config))

  :init
  (setq-default eyebrowse-keymap-prefix (kbd "C-c w"))
  (eyebrowse-mode t)
  (eyebrowse-create-window-config)

  :config
  (add-to-list 'window-persistent-parameters '(window-side . writable))
  (add-to-list 'window-persistent-parameters '(window-slot . writable)))
