(use-package esup
  :commands (esup esup-init-loader)
  :config
  (require 'noflet)
  (defun esup-init-loader ()
    (interactive)
    (let ((files)
          (esup-user-init-file "/tmp/esup-init.el"))
      (noflet ((load (file &rest _) (push (locate-library file) files)))
        (init-loader-load "~/.emacs.d/inits/"))
      (with-current-buffer (find-file-noselect esup-user-init-file)
        (erase-buffer)
        (dolist (file (reverse files))
          (insert-file-contents file)
          (goto-char (point-max)))
        (save-buffer))
      (esup))))
