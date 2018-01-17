;; Alternative of elscreen
(use-package eyebrowse
  :defer nil
  :bind* (([C-tab]   . eyebrowse-next-window-config)
          ([C-S-tab] . eyebrowse-prev-window-config)
          ("M-m c" . eyebrowse-create-window-config)
          ("M-m d" . eyebrowse-close-window-config))
  :init
  (setq-default eyebrowse-keymap-prefix (kbd "C-c w"))
  (eyebrowse-mode t)
  :config
  (add-to-list 'window-persistent-parameters '(window-side . writable))
  (add-to-list 'window-persistent-parameters '(window-slot . writable))
  (advice-add 'eyebrowse-create-window-config :after (lambda () (switch-to-buffer "*scratch*"))))

(use-package desktop
  :disabled
  :init
  (desktop-save-mode t)
  (push (expand-file-name "desktops/" user-emacs-directory) desktop-path)
  (setq desktop-auto-save-timeout 60)
  (push 'kill-ring desktop-globals-to-save))

