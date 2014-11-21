;; Completion words longer than 4 characters
;; (custom-set-variable
;;   '(ac-ispell-requires 4))

(require 'ac-ispell "~/.emacs.d/elisp/emacs-ac-ispell.el")

(eval-after-load "auto-complete"
  '(progn
      (ac-ispell-setup)))

(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)
(add-hook 'text-mode-hook 'ac-ispell-ac-setup)
(add-hook 'markdown-mode 'ac-ispell-ac-setup)
(add-hook 'lisp-mode 'ac-ispell-ac-setup)
