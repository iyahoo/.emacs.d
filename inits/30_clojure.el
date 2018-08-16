(defun save-relode-test ()
  (interactive)
  (save-buffer)
  (cider-refresh)
  (cider-test-run-loaded-tests))

(use-package clojure-mode
  :init
  (add-hook 'clojure-mode-hook #'subword-mode))

(use-package cider
  :if (locate-library "cider")
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
        cider-overlays-use-font-lock t
        cider-repl-pop-to-buffer-on-connect nil)
  (cider-repl-toggle-pretty-printing)
  (bind-key "M-r" 'save-relode-test cider-mode-map)
  (put-clojure-indent 'match 1))
