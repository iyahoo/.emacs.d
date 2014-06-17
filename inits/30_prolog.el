; for SWI-Prolog
(setq prolog-system 'swi)
(setq auto-mode-alist
      (append '(("\\.pl" . prolog-mode))
       auto-mode-alist))
(setq prolog-program-name "/usr/local/bin/swipl")
