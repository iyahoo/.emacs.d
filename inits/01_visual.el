(defface my-hl-line-face ;; 現在行のハイライト
  '((((class color) (background dark))
     (:background "BLUE" t))
    (((class color) (background light))
     (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)
(blink-cursor-mode t)

(setq show-paren-delay 0.024)  
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(set-face-underline 'show-paren-match-face "yellow")
(set-face-foreground 'show-paren-match-face nil)

(scroll-bar-mode -1)

(tool-bar-mode -1)

(blink-cursor-mode 0)

(setq frame-title-format "%f")

(column-number-mode t)

(size-indication-mode t)

(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq windmove-wrap-around t)

(color-theme-initialize)
(color-theme-deep-blue)


