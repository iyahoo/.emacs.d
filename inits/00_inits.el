;; Initialize bind (sparse) keys
(defconst sparse-key "C-q")
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
 ((sparse-key+ "C-r") . my-window-resizer)

 ;; delete
 ("C-h" . backward-delete-char)
 ("M-h" . backward-kill-word)
 ((sparse-key+ "C-d")
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
 ((sparse-key+ "C-q") . quoted-insert)

 ;; quickrun
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

;; Custom set (Auto inserted)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 (custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(quack-pltish-defn-face ((t (:foreground "DarkGoldenrod2" :weight bold))))
  '(quack-pltish-module-defn-face ((t (:inherit quack-pltish-defn-face :foreground "orange2"))))
  '(quack-pltish-paren-face ((t (:foreground "salmon"))))
  '(quack-pltish-selfeval-face ((t (:foreground "indian red"))))))
