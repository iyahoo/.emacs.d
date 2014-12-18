(key-combo-mode t)
(global-key-combo-mode t)

(add-hook 'prolog-mode-hook
          '(lambda ()
             (key-combo-define-local (kbd ":") '(" : " " :- " ":"))))

(add-hook 'coq-mode-hook
          '(lambda ()
             (key-combo-define-local (kbd "=") '(" = " " == " " === " ))
             (key-combo-define-local (kbd "=>") " => ")
             (key-combo-define-local (kbd "-") '(" - " "-"))
             (key-combo-define-local (kbd "+") '(" + " "+"))
             (key-combo-define-local (kbd "*") '(" * " "*"))
             (key-combo-define-local (kbd ":") '(" : " " :: " "::"))
             (key-combo-define-local (kbd ">") '(" > " " -> " " => " ">"))
             (key-combo-define-local (kbd "<") '(" < " " <- " " <= " "<"))
             (key-combo-define-local (kbd ":=") " := ")
             (key-combo-define-local (kbd "<=") " <= ")
             (key-combo-define-local (kbd ".") '(". " "."))
             (key-combo-define-local (kbd ",") '(", " ","))
             (key-combo-define-local (kbd "|") '(" | " "|"))
             (key-combo-define-local (kbd "|-") " |- ")))

;; tuareg-interactive-mode-hook
(add-hook 'tuareg-interactive-mode-hook
          '(lambda ()
             (key-combo-define-local (kbd "+") '(" + " " +. "))
             (key-combo-define-local (kbd "-") '(" - " " -. "))
             (key-combo-define-local (kbd "*") '(" * " " *. " " ** " ))
             (key-combo-define-local (kbd "/") '(" / " " /. "))
             (key-combo-define-local (kbd ">") '(" > " " -> "))
             (key-combo-define-local (kbd "=") '(" = " "="))))

(add-hook 'tuareg-mode-hook
          '(lambda ()
             (key-combo-define-local (kbd "+") '(" + " " +. "))
             (key-combo-define-local (kbd "-") '(" - " " -. "))
             (key-combo-define-local (kbd "*") '(" * " " *. " " ** " ))
             (key-combo-define-local (kbd "/") '(" / " " /. "))
             (key-combo-define-local (kbd ">") '(" > " " -> "))
             (key-combo-define-local (kbd "=") '(" = " "="))))

(add-hook 'haskell-mode-hook
          '(lambda ()
             (key-combo-define-local (kbd "=") '(" = " " == " " === " ))
             (key-combo-define-local (kbd "=>") " => ")
             (key-combo-define-local (kbd "-") '(" - " "-"))
             (key-combo-define-local (kbd "+") '(" + " "++ " " + "))
             (key-combo-define-local (kbd "*") '(" * " "*"))
             (key-combo-define-local (kbd ":") '(":" " :: " "::"))
             (key-combo-define-local (kbd ">") '(" > " " -> " " => " ">"))
             (key-combo-define-local (kbd "<") '(" < " " <- " " <= " "<"))
             (key-combo-define-local (kbd "<=") " <= ")
             (key-combo-define-local (kbd ".") '(". " "."))
             (key-combo-define-local (kbd "|") '(" | " "|"))
             (key-combo-define-local (kbd "|-") " |- ")))

(add-hook 'lisp-mode-hook
          '(lambda ()
             (key-combo-define-local (kbd "=") '("= " "="))
             (key-combo-define-local (kbd "-") '("-" "- "))
             (key-combo-define-local (kbd "+") '("+ " "+"))
             (key-combo-define-local (kbd "*") '("*" "* "))
             (key-combo-define-local (kbd ">") '("> " ">= " ">"))
             (key-combo-define-local (kbd "<") '("< " "<= " "<"))
             (key-combo-define-local (kbd ",") '("," ",@"))
             (key-combo-define-local (kbd "'") '("'" "#'" "#'(lambda ())"))))

;; error
;; (add-hook 'slime-repl-mode-hook
;;           '(lambda ()
;;              (key-combo-define-local (kbd ",") '("," ",@"))
;;              (key-combo-define-local (kbd "'") '("'" "#'"))))

