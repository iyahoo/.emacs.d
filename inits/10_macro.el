(defun revert-all-buffers ()
  (interactive)
  (let ((cbuf (current-buffer)))
    (dolist (buf (buffer-list))
      (if (not (buffer-file-name buf)) ;only the file which visit on path
   nil
 (switch-to-buffer buf)
 (revert-buffer t t)))
    (switch-to-buffer cbuf)))

(fset 'go-top "\C-a\C-a")

(defun comma-replace ()
  (interactive)
  (go-top)
  (replace-regexp "、" "，"))

(global-set-key (kbd "C-x C-,") 'comma-replace)
