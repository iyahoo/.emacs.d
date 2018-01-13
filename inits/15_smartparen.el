(use-package smartparens
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

  (sp-pair "'" nil :actions :rem)
  (sp-pair "`" nil :actions :rem)
  (sp-pair "<" nil :actions :rem)
  (sp-pair "\\\"" nil :actions :rem))
