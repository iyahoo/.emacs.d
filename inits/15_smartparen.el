(smartparens-global-mode)

(sp-pair "(" ")" :wrap "M-(")
(sp-pair "(" ")" :wrap "C-(")
(sp-pair "{" "}" :wrap "C-{")
(sp-pair "[" "]" :wrap "C-]")


(sp-local-pair 'lisp-mode "~{" "~}")
(sp-local-pair 'lisp-mode "~(" "~)")
(sp-local-pair 'lisp-mode "~<" "~>")
(sp-local-pair 'lisp-mode "~[" "~]")

(sp-pair "'" nil :actions :rem)
(sp-pair "`" nil :actions :rem)
(sp-pair "<" nil :actions :rem)
(sp-pair "\\\"" nil :actions :rem)
