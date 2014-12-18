;; common-lisp 
(eval-when-compile (require 'cl))

;; auto-byte-compile
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; cask
(require 'cask)
(cask-initialize)
;; (pallet-install)

;; コマンドにパスを通す
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/opt/ccl/scripts")

(let ((envs '("PATH" "GEM_PATH" "GEM_HOME" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

(setq require-final-newline t)

(define-key global-map "\C-q" (make-sparse-keymap))

;; (setq debug-on-error t)
