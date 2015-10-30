(defface my-hl-line-face ;; 現在行のハイライト
  '((((class color) (background dark))
     (:background "dark slate gray" t))
    (((class color) (background light))
     (:background "ForestGreen" t))
    (t (:bold nil)))
  "hl-line's my face")

(global-hl-line-mode t)

;; (defun global-hl-line-timer-function ()
;;   (global-hl-line-unhighlight-all)
;;   (let ((global-hl-line-mode t))
;;     (global-hl-line-highlight)))
;; (setq global-hl-line-timer
;;       (run-with-idle-timer 0.2 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)

(setq show-paren-delay 0.024)  
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(set-face-underline 'show-paren-match-face nil)
(set-face-foreground 'show-paren-match-face "pink")

(scroll-bar-mode -1)

(tool-bar-mode -1)

(blink-cursor-mode 0)

(setq frame-title-format "%f")

(column-number-mode t)

(size-indication-mode t)

(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq windmove-wrap-around t)

(load-theme 'deeper-blue t)

(setq make-pointer-invisible t)

(defun my/scroll-move-around (orig-fn &rest args)
  (let ((orig-line (count-lines (window-start) (point))))
    (apply orig-fn args)
    (move-to-window-line orig-line)))

(advice-add 'scroll-up :around 'my/scroll-move-around)
(advice-add 'scroll-down :around 'my/scroll-move-around)

(global-set-key (kbd "C-M-h") 'hs-toggle-hiding)
(global-set-key (kbd "C-q h") 'hs-hide-all)
(global-set-key (kbd "C-q s") 'hs-show-all)

(setq sr-speedbar-right-side nil)
(global-set-key (kbd "C-q t") 'sr-speedbar-toggle)

;; (hiwin-activate)
;; (set-face-background 'hiwin-face "#262626")
;; (set-face-background 'hiwin-face "#00103a")
;; (set-face-background 'hiwin-face "#003845")

(setq debug-on-error t)

