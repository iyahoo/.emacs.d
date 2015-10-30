
(setq auto-mode-alist (cons (cons "\\.[rR]$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
 
;; R 起動時にワーキングディレクトリを訊ねない
(setq ess-ask-for-ess-directory nil)


(when (locate-library "ess-site")
  (setq ess-use-auto-complete t)
  ;; (setq ess-use-auto-complete 'script-only)
  )
