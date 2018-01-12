(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
(define-key lisp-mode-map (kbd "C-c C-d") 'lispxmp)
(define-key lisp-mode-map "\M-n" (lambda () (interactive) (scroll-up 1)))
(define-key lisp-mode-map "\M-p" (lambda () (interactive) (scroll-down 1)))

;; clispをデフォルトのCommon Lisp処理系に設定
;; (setq inferior-lisp-program "/opt/local/bin/clisp")

;; Clozure CLをデフォルトのCommon Lisp処理系に設定
;; (setq inferior-lisp-program "/usr/local/bin/ccl")

;; sbclをデフォルトのCommon Lisp処理系に設定
;; (setq inferior-lisp-program "/opt/local/bin/sbcl")

;; aclをデフォルトのCommon Lisp処理系に設定
;; (setq inferior-lisp-program "/usr/local/bin/alisp")

(load (expand-file-name "~/.roswell/impls/ALL/ALL/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "ros -L sbcl -Q -l ~/.sbclrc run")
;; (setq inferior-lisp-program "ros -L ccl-bin -Q -l ~/.ccl-init.lisp run")

;; ~/.emacs.d/slimeをload-pathに追加
(slime-setup '(slime-repl slime-fancy slime-banner slime-indentation))

;; (use-package auto-complete-mode
;;   :config
;;   (push 'ac-source-symbols ac-sources))

(use-package ac-slime
    :config
    (add-hook 'slime-mode-hook 'set-up-slime-ac)
    (add-hook 'slime-repl-mode-hook 'set-up-slime-ac))


;; key
(defalias 'sl-restart 'slime-restart-inferior-Lisp)
(define-key slime-repl-mode-map (kbd "M-s") 'forward-word)

(use-package slime-annot)

(setq slime-net-coding-system 'utf-8-unix)
(setq lisp-lambda-list-keyword-parameter-alignment t)
(setq lisp-lambda-list-keyword-alignment t)
(setq common-lisp-style-default 'modern)

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

;; cl21

(add-hook 'slime-connected-hook (lambda ()
                                  (when (slime-eval `(cl:if (cl:find-package :cl21-user) t))
                                    (slime-repl-set-package :cl21-user)
                                    (slime-repl-eval-string "(cl21:enable-cl21-syntax)")))
          t)

(load (expand-file-name "~/.emacs.d/elisp/cl21-mode.el"))
