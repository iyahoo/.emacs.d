;; Alternative of elscreen
(use-package eyebrowse
  :bind* (([C-tab]   . eyebrowse-next-window-config)
          ([C-S-tab] . eyebrowse-prev-window-config)
          ("M-m c" . eyebrowse-create-window-config)
          ("M-m d" . eyebrowse-close-window-config))
  :init
  (setq-default eyebrowse-keymap-prefix (kbd "C-c w")
                eyebrowse-new-workspace t
                eyebrowse-close-window-config-prompt t)
  :config
  (eyebrowse-mode t))

(use-package desktop
  :disabled
  :init
  (desktop-save-mode t)
  (push (expand-file-name "desktops/" user-emacs-directory) desktop-path)
  (setq desktop-auto-save-timeout 60)
  (push 'kill-ring desktop-globals-to-save))
