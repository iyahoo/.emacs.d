(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (add-hook 'Markdown-mode-hook
;;           (lambda ()
;;             (define-key Markdown-mode-map (kbd "C-i") 'markdown-cycle)
;;             (hide-sublevels 2)))

;; markdownのコマンドのパス追加
(setq markdown-command "/usr/local/bin/markdown")

(setq markdown-command-needs-filename t)

;; (use-package org)

;; (defun cleanup-org-tables ()
;;   (save-excursion
;;     (goto-char (point-min))
;;     (while (search-forward "-+-" nil t) (replace-match "-|-"))))

;; (add-hook 'markdown-mode-hook 'orgtbl-mode)
;; (add-hook 'markdown-mode-hook
;;           #'(lambda()
;;               (add-hook 'after-save-hook 'cleanup-org-tables  nil 'make-it-local)))
