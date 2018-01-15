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

 ;; delete
 ("C-h" . backward-delete-char)
 ("M-h" . backward-kill-word)
 ((sparse-key+ "M-d")
  .
  (lambda ()
    (interactive)
    (delete-trailing-whitespace)
    (message "Delete tailing whitespace!")))
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
 ;; align-regexp
 ("C-x a r" . align-regexp)
 ("C-c a" . align)

 ;; Newline
 ("C-m" . newline-and-indent))

;; Start server
(use-package server
  :init (server-start))
