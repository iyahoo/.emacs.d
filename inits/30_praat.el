(autoload 'praat-mode "praat" "Enter Praat mode." t)
(setq auto-mode-alist (cons '("\\.praat$" . praat-mode) auto-mode-alist))

