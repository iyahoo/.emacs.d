;; Auto-complete

;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;; (add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)
;; (add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t)


;; (require 'ac-helm) ;; Not necessary if using ELPA package
(global-set-key (kbd "M-p") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "M-p") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)

(global-set-key (kbd "C-q C-a") 'auto-complete-mode)

(setq ac-auto-show-menu nil)
