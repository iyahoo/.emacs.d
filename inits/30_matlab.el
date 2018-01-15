(defun matlab-start ()
  (interactive)
  (matlab-shell)
  (bind-key "C-m" 'newline matlab-mode-map)
  nil)

(use-package matlab
  :mode (("\\.m\\'" . matlab-mode))
  :config
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
