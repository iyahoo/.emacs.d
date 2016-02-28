(require 'scheme-complete)
;;(autoload 'scheme-smart-complete "scheme-complete" nil t)
;; auto-completeを使っているので不要
;; (eval-after-load 'scheme
;;   '(define-key scheme-mode-map "\e\t" 'scheme-smart-complete))
;; (add-to-list 'auto-mode-alist '("\\.scm?" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.scm?" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.rkt?" . racket-mode))


(add-hook 'racket-mode-hook      #'racket-unicode-input-method-enable)
(add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)

(setq tab-always-indet 'complete)

(add-hook 'racket-mode-hook
          (lambda ()
            (make-local-variable 'eldoc-documentation-function)
            (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
            (setq geiser-racket-binary "/usr/local/bin/racket")
            (setq geiser-active-implementations '(racket))
            (setq geiser-repl-read-only-prompt-p nil) ;; Racket REPL上で(read)の入力を取る際に必要
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
(setq process-coding-system-alist
      (cons '("racket" utf-8 . utf-8) process-coding-system-alist))

(setq scheme-program-name "/usr/local/bin/gosh -i")
;; (setq scheme-program-name "/usr/local/bin/racket -i")

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window ()
  "Run Gauche on other window"
  (interactive)
  (split-window-horizontally (/ (frame-width) 2))
  (let ((buf-name (buffer-name (current-buffer))))
    (scheme-mode)
    (switch-to-buffer-other-window
     (get-buffer-create "*scheme*"))
    (run-scheme scheme-program-name)
    (switch-to-buffer-other-window
     (get-buffer-create buf-name))))

