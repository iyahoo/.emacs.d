(use-package magit
  :init
  (defalias 'ms 'magit-status)
  :config
  (setq magit-auto-revert-mode nil))

;; Show Git branch information to mode-line
(defun my/update-git-branch-mode-line ()
  (let* ((branch (replace-regexp-in-string
                  "[\r\n]+\\'" ""
                  (shell-command-to-string "git symbolic-ref -q HEAD")))
         (mode-line-str (if (string-match "^refs/heads/" branch)
                            (format "[%s]" (substring branch 11))
                          "[Not Repo]")))
    (propertize mode-line-str
                'face '((:foreground "Dark green" :weight bold)))))


