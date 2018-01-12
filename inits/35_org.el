(define-key org-mode-map [(control tab)] 'elscreen-next)
(define-key org-mode-map [(control shift tab)] 'elscreen-previous)
(define-key org-mode-map (kbd "M-h") 'backward-kill-word)
(define-key org-mode-map (kbd "M-p") 'auto-complete)
(define-key org-mode-map (kbd "C-'") 'ace-jump-mode)
(define-key org-mode-map (kbd "C-,") 'er/expand-region)

(add-to-list 'auto-mode-alist '("*scratch*" . org-mode))


;; (add-hook 'org-mode-hook 'turn-on-font-lock)
;; ;; (setw org-hide-leading-stars t)
;; (setq org-directory "~/Dropbox/org/todo")
;; ;; (setw org-default-notes-file "notes.org")
;; (setq org-todo-keywords
;; 	  '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
;; (setq org-log-done t)

;; ;; アジェンダ表示の対象ファイル
;; (setq org-agenda-files (list org-directory))
;; ;; ;; アジェンダ表示で下線を用いる
;; ;; (add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
;; ;; (setq hl-line-face 'underline)
;; ;; 標準の祝日を利用しない
;; (setq calendar-holidays nil)

;; (setq
;;  org-export-taskjuggler-target-version
;;  3.0
;;  org-export-preprocess-before-selecting-backend-code-hook
;;  '(org-beamer-select-beamer-code)
;;  org-tab-first-hook
;;  '(org-hide-block-toggle-maybe
;;    org-src-native-tab-command-maybe
;;    org-babel-hide-result-toggle-maybe
;;    org-babel-header-arg-expand))

;; (add-hook 'org-mode-hook 'trun)

;; (add-to-list 'auto-mode-alist '("*scratch*" . org-mode))
;; ;; (print auto-mode-alist)
