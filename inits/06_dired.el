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

(use-package dired
  :config
  (bind-keys :map dired-mode-map
             ("h" . dired-hide-details-mode)
             ("C-c C-d" . dired-hide-details-mode))
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies  'always)
  (use-package dired-aux
    :after dired
    :config
    (add-to-list 'dired-compress-file-suffixes
                 '(".zip" "unzip")))
  (use-package dired+
    :after dired
    :config
    (setq dired-dwim-target t)
    (bind-keys :map ctl-x-map
               ("d" . diredp-dired-files)
               :map ctl-x-4-map
               ("d" . diredp-dired-files-other-window)
               :map dired-mode-map
               ("SPC" . dired-toggle-mark))))
