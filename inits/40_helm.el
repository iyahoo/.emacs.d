;;; helm ------------------------------------------------------------
(require 'helm-mode)
(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)
(require 'helm-c-yasnippet)
(require 'helm-swoop)     

;;(define-key helm-parse-keys (kbd "C-h") )
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-generic-files-map (kbd "C-h") 'delete-backward-char)
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

(setq recentf-max-saved-items 10000)
(setq kill-ring-max 1000)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c M-x") 'helm-M-x)
(global-set-key (kbd "C-o") 'helm-occur)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C--") 'helm-c-yas-complete)
(global-set-key (kbd "C-c s") 'helm-swoop)
(global-set-key (kbd "C-c S") 'helm-multi-swoop)



(defalias 'hg 'helm-do-grep)
(defalias 'ht 'helm-etags-select)
(defalias 'ha 'helm-ag)
(defalias 'haf 'helm-ag-this-file)

