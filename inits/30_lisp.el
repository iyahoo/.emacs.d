(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
(define-key lisp-mode-map (kbd "C-c C-d") 'lispxmp)

;; clispをデフォルトのCommon Lisp処理系に設定
;; (setq inferior-lisp-program "/opt/local/bin/clisp")

;; Clozure CLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "~/opt/ccl/scripts/ccl")

;; sbclをデフォルトのCommon Lisp処理系に設定
;; (setq inferior-lisp-program "/opt/local/bin/sbcl")

;; aclをデフォルトのCommon Lisp処理系に設定
;; (setq inferior-lisp-program "/usr/local/bin/alisp")

(setq slime-lisp-implementations '((ccl ("~/opt/ccl/scripts/ccl"))
                                   (clisp ("/opt/local/bin/clisp"))
                                   (sbcl ("/opt/local/bin/sbcl"))
                                   (alisp ("/usr/local/bin/alisp"))))

(setq auto-mode-alist
      (append '(("\\.cl" . lisp-mode))
              auto-mode-alist))

;; ~/.emacs.d/slimeをload-pathに追加
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
(slime-setup '(slime-repl slime-fancy slime-banner))

;; key
(defalias 'sl-restart 'slime-restart-inferior-Lisp)

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(define-key slime-repl-mode-map (kbd "M-s") 'forward-word)
(require 'slime-annot)

;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
