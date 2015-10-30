;;; helm ------------------------------------------------------------
(require 'helm-mode)
(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)
(require 'helm-c-yasnippet)
(require 'helm-swoop)
;; (require 'helm-migemo)

;;(define-key helm-parse-keys (kbd "C-h") )
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-generic-files-map (kbd "C-h") 'delete-backward-char)
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

;; (eval-after-load
;;  "helm-migemo"
;;  '(defun helm-compile-source--candidates-in-buffer (source)
;;     (helm-aif (assoc 'candidates-in-buffer source)
;;               (append
;;                source
;;                `((candidates
;;                   .
;;                   ,(or
;;                     (cdr it)
;;                     (lambda ()
;;                       ;; Do not use `source' because other plugins
;;                       ;; (such as helm-migemo) may change it
;;                       (helm-candidates-in-buffer
;;                        (helm-get-current-source)))))
;;                  (volatile) (match identity)))
;;               source)))

(setq recentf-max-saved-items 10000)
(setq kill-ring-max 1000)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c M-x") 'helm-M-x)
(global-set-key (kbd "C-o") 'helm-swoop)
(global-set-key (kbd "C-c o") 'helm-multi-swoop)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C--") 'helm-c-yas-complete)
(global-set-key (kbd "C-c s") 'helm-imenu)

(defalias 'hg 'helm-do-grep)
(defalias 'ht 'helm-etags-select)
(defalias 'ha 'helm-ag)
(defalias 'haf 'helm-ag-this-file)

