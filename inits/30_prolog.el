;; for SWI-Prolog
(use-package prolog
  :mode (("\\.pl$" . prolog-mode)
         ("\\.b$" . prolog-mode)
         ("\\.n$" . prolog-mode)
         ("\\.f$" . prolog-mode))
  :config
  (setq prolog-system 'yap
        prolog-program-name "/usr/local/bin/yap"))

