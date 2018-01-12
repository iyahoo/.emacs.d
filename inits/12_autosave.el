;; (require 'auto-save-buffers)            
;; (run-with-idle-timer 60 t 'auto-save-buffers)
;; (setq auto-save-list-file-name nil)
;; (setq auto-save-list-file-prefix nil)
;; (global-set-key (kbd "C-q C-s") 'auto-save-buffers-toggle)

;; (require 'real-auto-save)
;; (setq real-auto-save-interval 3)        ;3秒後に自動保存
;; ;; (add-hook 'prog-mode-hook 'real-auto-save-mode)
;; (add-hook 'find-file-hook 'real-auto-save-mode)
