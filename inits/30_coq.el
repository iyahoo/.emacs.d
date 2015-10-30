(load-file "/usr/local/share/emacs/site-lisp/proof-general/generic/proof-site.el")

(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

;; (add-hook 'coq-mode-hook
;;           (lambda ()
;;             (define-coq-indent
;;               (Case 4)
;;               (SCase 2)
;;               (SSCase 2))))
