(defun revert-all-buffers ()
  (interactive)
  (let ((cbuf (current-buffer)))
    (dolist (buf (buffer-list))
      (if (not (buffer-file-name buf)) ;only the file which visit on path
          nil
        (switch-to-buffer buf)
        (revert-buffer t t)))
    (switch-to-buffer cbuf)))
