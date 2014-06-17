;;; (require 'enh-ruby-mode)

(add-hook 'ruby-mode-hook 'flycheck-mode)

(ruby-end-mode t)
;; definition for flycheck
;; (flycheck-define-checker ruby-rubylint
;;   "A Ruby syntax and style checker using the rubylint tool."
;;   :command ("ruby-lint" source)
;;   :error-patterns
;;   ((warning line-start
;;             (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
;;             line-end)
;;    (error line-start
;;           (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
;;           line-end))
;;   :modes (enh-ruby-mode ruby-mode))

;; (autoload 'ruby-mode "enh-ruby-mode"
;;   "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(require 'inf-ruby)

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                              interpreter-mode-alist))

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;;       '(lambda ()
;;          (inf-ruby-keys)))

;; (require 'ruby-electric)
;; (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; (setq ruby-electric-expand-delimiters-list nil)

;; rcodetools
(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
  (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
  (define-key ruby-mode-map "\C-c\C-f" 'rct-ri)
  (define-key ruby-mode-map "\C-c\C-d" 'xmp))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

;; (require 'ruby-electric)
;; (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; (setq ruby-electric-expand-delimiters-list nil)

;; (require 'anything)
;; ;; (require 'anything-rdefs)
;; ;; (add-hook 'enh-ruby-mode-hook
;; ;;           (lambda ()
;; ;;             (define-key enh-ruby-mode (kbd "C-@") 'anything-rdefs)))

;; (autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
;; (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
;; (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
;; (add-hook 'ruby-mode-hook '(lambda ()
;;                              (require 'rcodetools)
;;                              (require 'anything-rcodetools)
;;                              (require 'myrurema)
;;                              (load-auto-complete)  # 追加
;;                              (define-key ruby-mode-map "\M-c" 'rct-complete-symbol)
;;                              (define-key ruby-mode-map "\M-d" 'xmp)
;;                              (setq ruby-deep-indent-paren-style nil)))

;; ; auto-complete
;; (defun load-auto-complete ()
;;   (require 'auto-complete-config)
;;   (ac-config-default)

;;   (add-to-list 'ac-dictionary-directories "~/.emacs.d/etc/auto-complete")

;;   (setq ac-use-menu-map t)
;;   (define-key ac-menu-map "\C-n" 'ac-next)
;;   (define-key ac-menu-map "\C-p" 'ac-previous)

;;   (setq ac-auto-show-menu 0.5)
;;   (setq ac-menu-height 20)

;;   (robe-mode))

;; ; robe
;; (autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
;; (autoload 'robe-ac-setup "robe-ac" "robe auto-complete" nil nil)
;; (add-hook 'robe-mode-hook 'robe-ac-setup)
