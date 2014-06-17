(require 'dired+)

(setq dired-dwim-target t)

(define-key ctl-x-map   "d" 'diredp-dired-files)
(define-key ctl-x-4-map "d" 'diredp-dired-files-other-window)

;; スペースでマークする (FD like)
(define-key dired-mode-map " " 'dired-toggle-mark)

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
