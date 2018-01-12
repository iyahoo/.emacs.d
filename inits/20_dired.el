(defun dired-toggle-mark (arg)
  "Toggle the current (or next ARG) files."
  ;; S.Namba Sat Aug 10 12:20:36 1996
  (interactive "P")
  (let ((dired-marker-char
         (if (save-excursion (beginning-of-line)
                             (looking-at " "))
             dired-marker-char ?\040)))
    (dired-mark arg)
    (dired-previous-line 1)))

(use-package dired+
  :config
  (setq dired-dwim-target t)
  (bind-key "d" 'diredp-dired-files ctl-x-map)
  (bind-key "d" 'diredp-dired-files-other-window ctl-x-4-map)
  (bind-key "SPC" 'dired-toggle-mark dired-mode-map))
