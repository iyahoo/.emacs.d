;; auto-byte-compile
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(setq require-final-newline t)

(define-key global-map "\C-q" (make-sparse-keymap))

