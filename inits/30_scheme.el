(require 'scheme-complete)
;;(autoload 'scheme-smart-complete "scheme-complete" nil t)
;; auto-completeを使っているので不要
;; (eval-after-load 'scheme
;;   '(define-key scheme-mode-map "\e\t" 'scheme-smart-complete))
(add-hook 'scheme-mode-hook
          (lambda ()
            (make-local-variable 'eldoc-documentation-function)
            (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
            (eldoc-mode)))
(setq lisp-indent-function 'scheme-smart-indent-function)

;; 括弧の補完
;; (define-key scheme-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
;; (define-key inferior-scheme-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
;; (define-key scheme-mode-map (kbd "{") 'skeleton-pair-insert-maybe)
;; (define-key inferior-scheme-mode-map (kbd "{") 'skeleton-pair-insert-maybe)
;; (define-key scheme-mode-map (kbd "[") 'skeleton-pair-insert-maybe)
;; (define-key inferior-scheme-mode-map (kbd "[") 'skeleton-pair-insert-maybe)
;; (define-key scheme-mode-map (kbd "\"") 'skeleton-pair-insert-maybe)
;; (define-key inferior-scheme-mode-map (kbd "\"") 'skeleton-pair-insert-maybe)
;; (setq skeleton-pair 1)

;; emacsでGauche
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "/usr/local/bin/gosh -i")

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
