(use-package clojure-mode
  :init
  (add-hook 'clojure-mode-hook #'subword-mode))

(defun tdd-test ()
  "Thin wrapper around `cider-test-run-tests'."
  (when (cider-connected-p)
    (let ((cider-auto-select-test-report-buffer nil)
          (cider-test-show-report-on-success nil))
      (cider-test-run-ns-tests nil))))

(defun save-relode-test ()
  (interactive)
  (save-buffer)
  (cider-refresh)
  (cider-test-run-loaded-tests))

(use-package cider
  :init
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)    
  :diminish subword-mode
  :config  
  (setq nrepl-log-messages t
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        cider-overlays-use-font-lock t)
  (cider-repl-toggle-pretty-printing)
  (define-key cider-mode-map (kbd "M-r") 'save-relode-test)
  (define-key cider-repl-mode-map (kbd "M-s") 'forward-word))

;; ac-clojure
;; (use-package ac-cidere
;;   :config
;;   (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;;   (add-hook 'cider-mode-hook 'ac-cider-setup)
;;   (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;;   (eval-after-load "auto-complete"
;;     '((progn )
;;       (add-to-list 'ac-modes 'cider-mode)
;;       (add-to-list 'ac-modes 'cider-repl-mode)))
;;   (add-hook 'clojure-mode-hook 'cider-mode)
;;   (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;;   (setq nrepl-hide-special-buffers t)
;;   (setq nrepl-buffer-name-show-port t)
;;   (define-key cider-repl-mode-map (kbd "M-s") 'forward-word)
;;   (add-hook 'cider-mode-hook 'hs-minor-mode)
;;   ;; indent
;;   (add-hook 'clojure-mode-hook
;;             (lambda()
;;              (define-clojure-indent
;;                (defroutes 'defun)
;;                (GET 2)
;;                (POST 2)
;;                (PUT 2)
;;                (DELETE 2)
;;                (HEAD 2)
;;                (ANY 2)
;;                (context 2)
;;                (match 1)
;;                (fact 1)
;;                (facts 1)))))

;; kibit

;; Teach compile the syntax of the kibit output
;; (autoload 'compile "compile" nil t)
;; (add-to-list 'compilation-error-regexp-alist-alist
;;              '(kibit "At \\([^:]+\\):\\([[:digit:]]+\\):" 1 2 nil 0))
;; (add-to-list 'compilation-error-regexp-alist 'kibit)

;; ;; A convenient command to run "lein kibit" in the project to which
;; ;; the current emacs buffer belongs to.
;; (defun kibit ()
;;   "Run kibit on the current project.
;; Display the results in a hyperlinked *compilation* buffer."
;;   (interactive)
;;   (compile "lein kibit"))

;; (defun kibit-current-file ()
;;   "Run kibit on the current file.
;; Display the results in a hyperlinked *compilation* buffer."
;;   (interactive)
;;   (compile (concat "lein kibit " buffer-file-name)))

;; (put-clojure-indent 'match 1)

