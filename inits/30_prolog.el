; for SWI-Prolog
(setq prolog-system 'swi)
(setq auto-mode-alist
      (append '(("\\.pl" . prolog-mode))
              auto-mode-alist))

(add-hook 'prolog-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'prolog-mode-hook 'acm)
(add-hook 'inferior-prolog-mode-hook 'acm)

(setq prolog-program-name "/opt/local/bin/swipl")


