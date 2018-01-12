(defun matlab-start ()
  (interactive)
  (matlab-shell)
  (define-key matlab-mode-map (kbd "C-h") 'backward-delete-char)
  (define-key matlab-shell-mode-map (kbd "C-h") 'backward-delete-char)
  (define-key matlab-mode-map (kbd "M-s") 'forward-word)
  (define-key matlab-mode-map (kbd "C-m") 'newline)
  nil)

(use-package matlab-mode
  :init
  (setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
  (setq matlab-shell-command "/Applications/MATLAB_R2017a.app/bin/matlab"
      matlab-shell-command-swithes '("-nojvm -nodisplay -nosplash")  
      matlab-indent-level 4
      matlab-indent-function-body nil
      matlab-highlight-cross-function-variables t  
      matlab-return-add-semicolon nil
      matlab-case-level '(4 . 4)
      matlab-fill-fudge-hard-maximum 100
      matlab-elipsis-string "..."
      matlab-fill-code nil
      matlab-comment-region-s "% "))
