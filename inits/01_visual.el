(use-package hl-line
  :config
  (global-hl-line-mode t))

;; Show paren
(setq show-paren-delay 0.02)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(set-face-underline 'show-paren-match-face nil)
(set-face-foreground 'show-paren-match-face "pink")

;; Global visual setting
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(column-number-mode t)
(size-indication-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(set-fill-column 9999)

(setq inhibit-startup-message t)
(setq windmove-wrap-around t)
(setq make-pointer-invisible t)
(setq frame-title-format "%f")
(setq show-trailing-whitespace t)

;; Load theme
(load-theme 'deeper-blue t)

(defconst macp (eq system-type 'darwin))

;; Font
(cond (macp
       (let* ((size 17)
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
         (set-fontset-font t 'cyrillic "Droid Sans Mono"))))

;; Emphasis string
(font-lock-add-keywords
 nil
 '(("\\<\\(FIXME\\|TODO\\|QUESTION\\|NOTE\\)"
    1 font-lock-warning-face t)))

(defun my/scroll-move-around (orig-fn &rest args)
  (let ((orig-line (count-lines (window-start) (point))))
    (apply orig-fn args)
    (move-to-window-line orig-line)))

(advice-add 'scroll-up :around 'my/scroll-move-around)
(advice-add 'scroll-down :around 'my/scroll-move-around)

(global-set-key (kbd "C-M-h") 'hs-toggle-hiding)
(global-set-key (kbd "C-q h") 'hs-hide-all)
(global-set-key (kbd "C-q s") 'hs-show-all)

;; Speedbar
(setq sr-speedbar-right-side nil)
(global-set-key (kbd "C-q t") 'sr-speedbar-toggle)

(defun set-alpha (alpha-num)
  "set frame parameter alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

;; Track pad
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
