(use-package hl-line
  :config
  (global-hl-line-mode t))

;; Show paren
(setq show-paren-delay 0.02)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(set-face-underline 'show-paren-match-face nil)
(set-face-foreground 'show-paren-match-face "pink")

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

(setq-default indent-tabs-mode         nil
              default-tab-width        4
              make-pointer-invisible   t
              show-trailing-whitespace t
              kill-whole-line          t
              delete-auto-save-files   t
              ring-bell-function       'ignore
              read-buffer-function     'iswitchb-read-buffer
              line-move-visual         nil
              ;; recentf-max-saved-items  1000
              kill-ring-max            200
              indent-line-function     'indent-relative-maybe
              ns-command-modifier      'meta
              ns-alternate-modifier    'super
              debug-on-error           t)

(setq inhibit-startup-message  t
      windmove-wrap-around     t)

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
  :init
  (if (fboundp 'save-place-mode)
      (save-place-mode)
    (setq save-place t)))

;;
(ffap-bindings)

;; Font
(cond (macp
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
                 (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
                 (".*osaka-bold.*" . 1.2)
                 (".*osaka-medium.*" . 1.2)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
                 (".*monaco-bold-.*-mac-roman" . 0.9) ;
                 ("-cdac$" . 1.3)))
         )))
;; サイズテスト
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

(cond (macp
       (bind-keys ([wheel-up] . scroll-down-with-lines)
                  ([wheel-down] . scroll-up-with-lines)
                  ([double-wheel-up] . scroll-down-with-lines)
                  ([double-wheel-down] . scroll-up-with-lines)
                  ([triple-wheel-up] . scroll-down-with-lines)
                  ([triple-wheel-down] . scroll-up-with-lines))))
;; recursive-edit
(defadvice abort-recursive-edit (before minibuffer-save)
  (when (when (eq (selected-window) (active-minibuffer-window))
          (add-to-history minibuffer-history-variable (minibuffer-contents)))))

;; Trash
(setq delete-by-moving-to-trash t)

;; Auto revert
(use-package autorevert
  :diminish auto-revert-mode
  :init (global-auto-revert-mode t))

;; Load theme
(load-theme 'deeper-blue t)
