;; Initialize bind  keys
(defconst sparse-key "C-q")
(bind-key sparse-key (make-sparse-keymap))

(defun sparse-key+ (key)
  (concat sparse-key " " key))

;;; key --------------------------------------------------------------
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
 ("C-M-s" . forward-sexp)
 ("M-g" . goto-line)
 ("C-M-p" . (lambda () (interactive) (scroll-up 1)))
 ("C-M-n" . (lambda () (interactive) (scroll-down 1)))

 ;; Move window
 ("C-t" . other-window-or-split)
 ((sparse-key+ "C-r") . my-window-resizer)

 ;; delete
 ("C-h" . backward-delete-char)
 ("M-h" . backward-kill-word)
 ((sparse-key+ "C-d") . (lambda ()
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
            (progn 
              (eval-buffer)
              (message "eval-buffer"))))
 
 ;; special
 ((sparse-key+ "C-q") . quoted-insert))

(bind-keys
 ;; align-regexp
 ("C-x a r" . align-regexp)
 ("C-c a" . align)
 
 ;; Newline
 ("C-m" . newline-and-indent))

;; Config
(setq default-tab-width 4)
(setq indent-line-function 'indent-relative-maybe)
(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'super)
(setq debug-on-error t)

;;

