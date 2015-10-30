; for SWI-Prolog
(setq prolog-system 'swi)
(setq auto-mode-alist
      (append '(("\\.pl" . prolog-mode))
              '(("\\.b" . prolog-mode))
              '(("\\.n" . prolog-mode))
              '(("\\.f" . prolog-mode))
              auto-mode-alist))

(add-hook 'prolog-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'prolog-mode-hook 'acm)
(add-hook 'inferior-prolog-mode-hook 'acm)

(setq prolog-program-name "/usr/local/bin/yap")
;; (setq prolog-program-name "/usr/local/bin/swipl")


