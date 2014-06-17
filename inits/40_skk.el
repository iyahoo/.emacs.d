;; (setq load-path
;;       (append '("~/.emacs.d"
;;                 "~/.emacs.d/elisp/apel"
;;                 "~/.emacs.d/elisp/emu"
;;                 "~/.emacs.d/elisp/skk"
;;               load-path)))

;; (require 'skk-setup)
;; (require 'skk-study)

;; (when (require 'skk nil t)  
;;   (setq skk-tut-file "~/local/etc/skk/SKK.tut"))

;; ;;skk-server AquaSKK
;; (setq skk-server-portnum 1178)
;; (setq skk-server-host "localhost")

;; (global-set-key "\C-\\" 'skk-mode)

;; (defadvice skk-setup-j-mode-map-options (after c-i-comp-wrapper2 activate)
;;   (define-key skk-j-mode-map (kbd "C-i") #'skk-comp-wrapper))


;; ;; (add-hook 'isearch-mode-hook
;; ;;           (function (lambda ()
;; ;;                       (and (boundp 'skk-mode) skk-mode
;; ;;                            (skk-isearch-mode-setup)))))
;; ;; (add-hook 'isearch-mode-end-hook
;; ;;           (function (lambda ()
;; ;;                       (and (boundp 'skk-mode) skk-mode (skk-isearch-mode-cleanup))
;; ;;                       (and (boundp 'skk-mode-invoked) skk-mode-invoked
;; ;;                            (skk-set-cursor-properly)))))

;; (require 'skk-autoloads)
;; (global-set-key (kbd "C-\\") 'skk-mode)
;; (setq skk-large-jisyo "~/.emacs.d/skk/SKK-JISYO.L")
;; (setq skk-tut-file "~/local/etc/skk/SKK.tut")

;; (require 'skk-autoloads)
;; (global-set-key "\C-\\" 'skk-mode)
;; (global-set-key "\C-x\\" 'skk-auto-fill-mode)
;; (global-set-key "\C-xt" 'skk-tutorial)

