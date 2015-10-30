(require 'tuareg)


(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.seml[iylp]?" . tuareg-mode))

;; Add opam emacs directory to the load-path
;; (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
;; (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; ;; Load merlin-mode
;; (require 'merlin)
;; ;; Start merlin on ocaml files
;; (add-hook 'tuareg-mode-hook 'merlin-mode t)
;; (add-hook 'caml-mode-hook 'merlin-mode t)
;; ;; Enable auto-complete
;; (setq merlin-use-auto-complete-mode 'easy)
;; ;; Use opam switch to lookup ocamlmerlin binary
;; (setq merlin-command 'opam)

(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)

(define-key tuareg-mode-map (kbd "C-c h") 'helm-mini)

