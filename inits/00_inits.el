;; Utility functions
(defun expand-emacs-home (path)
  (expand-file-name path user-emacs-directory))

(defun my-file-contents (filename)
  "Return the contents of FILENAME as string removed ?\n."
  (remove ?\n
          (with-temp-buffer
            (insert-file-contents filename)
            (buffer-string))))

;; Initialize bind (sparse) keys
(defconst sparse-key "M-m")
(bind-key sparse-key (make-sparse-keymap))

(defun sparse-key+ (key)
  (concat sparse-key " " key))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(defun delete-trailing-whitespace-with-message ()
  (interactive)
  (delete-trailing-whitespace)
  (message "Delete tailing whitespace!"))

(bind-keys* ;; force
 ;; Move cursol
 ("C-s" . forward-char)
 ("C-f" . isearch-forward)
 ("M-s" . forward-word)
 ("M-g" . goto-line)
 ("C-M-s" . forward-sexp)
 ("C-M-p" . (lambda () (interactive) (scroll-up 1)))
 ("C-M-n" . (lambda () (interactive) (scroll-down 1)))

 ;; Move window
 ("C-t" . other-window-or-split)
 ("C-=" . other-frame)

 ;; delete
 ;; ("C-h" . backward-delete-char)
 ("M-h" . backward-kill-word)
 ((sparse-key+ "M-d") . delete-trailing-whitespace-with-message)
 ;; toggle
 ("C-c l" . toggle-truncate-lines)

 ;; Dired
 ("C-x C-d" . dired-toggle)

 ;; C++
 ([f11] . ac-clang-syntax-check)

 ;; Eval buffer
 ([f12] . (lambda ()
            (interactive)
            (eval-buffer)
            (message "eval-buffer")))

 ;; special
 ((sparse-key+ "q") . quoted-insert)

 ;; quickruno
 ("C-x C-c" . quickrun))

(bind-keys
 ("C-h" . backward-delete-char)
 ("C-x a r" . align-regexp)
 ("C-c a" . align)

 ;; Newline
 ("C-m" . newline-and-indent)

 ;; :map isearch-mode-map
 ;; ("C-h" . isearch-backward-delete-char)
 )

;; Start server
(use-package server
  :init (server-start))
