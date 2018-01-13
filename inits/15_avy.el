(use-package avy
  :bind* (("C-'" . avy-goto-char-timer)
          ("M-g" . avy-goto-line))
  :config
  (setq avy-background t))

(use-package avy-zap
  :bind (("M-z" . avy-zap-to-char-dwim)
         ("M-Z" . avy-zap-up-to-char-dwim)))

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(use-package ace-pinyin
  :diminish AcePY
  :bind* (("C-;" . ace-jump-char-mode))
  :config
  (let ((sorce-pinyin-file "inits/15_avy_chartable.txt"))
    (when (file-exists-p sorce-pinyin-file)
      (setq ace-pinyin--char-table
            (read-lines (expand-file-name sorce-pinyin-file user-emacs-directory)))))
  (ace-pinyin-global-mode t))
