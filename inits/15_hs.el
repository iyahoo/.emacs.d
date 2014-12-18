(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'scheme-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)

(define-key global-map (kbd "C-#") 'hs-toggle-hiding)

