(use-package hl-line
  :config
  (global-hl-line-mode t))

;; Show paren
(setq show-paren-delay 0.02)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; Global setting
(scroll-bar-mode      -1)
(tool-bar-mode        -1)
(menu-bar-mode        -1)
(blink-cursor-mode     0)
(column-number-mode    t)
(size-indication-mode  t)
(fset 'yes-or-no-p     'y-or-n-p)
(set-fill-column       9999)
(iswitchb-mode         t)

(setq-default  indent-tabs-mode     nil
               default-tab-width    4
               indent-line-function 'indent-relative-maybe
               ;;
               make-pointer-invisible   t
               line-move-visual         nil
               show-trailing-whitespace t
               ring-bell-function       'ignore
               scroll-preserve-screen-position t
               ;;
               delete-auto-save-files    t
               delete-by-moving-to-trash t
               read-buffer-function      'iswitchb-read-buffer
               recentf-max-saved-items 2000
               recentf-max-menu-items 200
               kill-ring-max           200
               kill-whole-line         t
               ;; Key
               ns-command-modifier   'meta
               ns-alternate-modifier 'super
               ;; debug
               debug-on-error t)

(setq inhibit-startup-message t
      windmove-wrap-around    t
      )

;; Emacs title
(setq frame-title-format
      '("GNU Emacs " emacs-version "@" user-login-name " : "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
;; Save history
(savehist-mode)

;; Save place
(use-package saveplace
  :defer nil
  :init
  (if (fboundp 'save-place-mode)
      (save-place-mode)
    (setq save-place t)))

(use-package recentf
  :defer nil
  :init
  (add-hook 'find-file-hook (lambda () (unless recentf-mode
                                         (recentf-mode)
                                         (recentf-track-opened-file))))
  (recentf-mode t)
  (setq recentf-max-saved-items 200
        recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "recentf"))

;;
(ffap-bindings)

;; Font
(cond (*macp*
       (let* ((size 19)
              (jpfont "Hiragino Maru Gothic ProN")
              (asciifont "Fira Code")
              (h (* size 8)))
         (set-face-attribute 'default nil :family asciifont :height h)
         (set-fontset-font t 'katakana-jisx0201 jpfont)
         (set-fontset-font t 'japanese-jisx0208 jpfont)
         (set-fontset-font t 'japanese-jisx0212 jpfont)
         (set-fontset-font t 'japanese-jisx0213-1 jpfont)
         (set-fontset-font t 'japanese-jisx0213-2 jpfont)
         (set-fontset-font t '(#x0080 . #x024F) asciifont)
         (set-fontset-font t 'unicode "Symbola" nil 'prepend)
         (set-fontset-font t 'cyrillic "Droid Sans Mono")
         (setq face-font-rescale-alist
               '(("^-apple-hiragino.*" . 1.0)
                 (".*-Hiragino Maru Gothic ProN-.*" . 1.0)
                 (".*osaka-bold.*" . 1.0)
                 (".*osaka-medium.*" . 1.0)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 1.0)
                 (".*monaco-bold-.*-mac-roman" . 1.0)
                 ("-cdac$" . 1.0)))
         )))
;; サイズテストh
;; saiizutesuto

(defun set-alpha (alpha-num)
  "set frame parameter alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

;; Track pad
(defun my/scroll-move-around (orig-fn &rest args)
  (let ((orig-line (count-lines (window-start) (point))))
    (apply orig-fn args)
    (move-to-window-line orig-line)))

(advice-add 'scroll-up :around 'my/scroll-move-around)
(advice-add 'scroll-down :around 'my/scroll-move-around)

(defun scroll-down-with-lines ()
  (interactive)
  (scroll-down 3))

(defun scroll-up-with-lines ()
  (interactive)
  (scroll-up 3))

(cond (*macp*
       (bind-keys ([wheel-up] . scroll-down-with-lines)
                  ([wheel-down] . scroll-up-with-lines)
                  ([double-wheel-up] . scroll-down-with-lines)
                  ([double-wheel-down] . scroll-up-with-lines)
                  ([triple-wheel-up] . scroll-down-with-lines)
                  ([triple-wheel-down] . scroll-up-with-lines))))

;; Window

(use-package windmove
  :ensure nil
  :init (add-hook 'after-init-hook #'windmove-default-keybindings))

;; Auto revert
(use-package autorevert
  :defer nil
  :diminish auto-revert-mode
  :init (global-auto-revert-mode t))

;; Manual revert
(defun revert-current-buffer ()
  "Revert the current buffer."
  (interactive)
  (message "Revert this buffer.")
  (revert-buffer t t))

(bind-key "<f5>" 'revert-current-buffer)

;; Load theme
;; Normal
(load-theme 'deeper-blue t)
;; When nocturne mode
;; (load-theme 'adwaita t)
