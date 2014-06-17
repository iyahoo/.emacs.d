;; common-lisp
(eval-when-compile (require 'cl))

;; auto-byte-compile
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; コマンドにパスを通す
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/src/mozc/src/out_mac/Release")
(add-to-list 'exec-path "/usr/local/opt/ruby/bin")
(add-to-list 'exec-path "/usr/local/opt/ruby/bin/gem")
;; (add-to-list 'exec-path "/usr/local/Cellar/ruby/2.1.2/lib/ruby/gems/2.1.0/gems/rcodetools-0.8.5.0/lib")

(let ((envs '("PATH" "GEM_PATH" "GEM_HOME" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

(setq require-final-newline t)

(define-key global-map "\C-q" (make-sparse-keymap))
