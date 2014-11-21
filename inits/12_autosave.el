(require 'auto-save-buffers)
(run-with-idle-timer 0.3 t 'auto-save-buffers)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)
(global-set-key (kbd "C-q C-s") 'auto-save-buffers-toggle)

