(use-package smartparens
  :defer nil
  :diminish smartparens-mode
  :init (smartparens-global-mode)
  :config
  (sp-pair "(" ")" :wrap "C-(")
  (sp-pair "{" "}" :wrap "C-{")
  (sp-pair "[" "]" :wrap "C-]")
  (sp-pair "\"" "\"" :wrap "C-\"")

  (sp-local-pair 'lisp-mode "~{" "~}")
  (sp-local-pair 'lisp-mode "~(" "~)")
  (sp-local-pair 'lisp-mode "~<" "~>")
  (sp-local-pair 'lisp-mode "~[" "~]")

  (sp-local-pair 'latex-mode "$" "$")

  (sp-pair "'" nil :actions :rem)
  (sp-pair "`" nil :actions :rem)
  (sp-pair "<" nil :actions :rem)
  (sp-pair "\\\"" nil :actions :rem))
