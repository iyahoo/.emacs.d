(setq quack-default-program "gosh")
(require 'quack)
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
