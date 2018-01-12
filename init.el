(defun add-to-load-path (&rest paths) ; elisp内のファイルもパスを通す
  (let (path)
    (dolist (path paths paths)
            (let ((default-directory
                    (expand-file-name (concat user-emacs-directory path))))
                 (add-to-list 'load-path default-directory)
                 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
                     (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp/" ".cask/")

(cond
 ((string-match "apple-darwin" system-configuration)
  (load "~/.emacs.d/etc/cocoa.el"))
 ((string-match "linux" system-configuration)
  (load "~/.emacs.d/etc/linux.el"))
 ((string-match "freebsd" system-configuration)
  (load "~/.emacs.d/etc/freebsd.el")))

;; use-package

(require 'use-package)

;; cask
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(use-package cask
 :config
 (cask-initialize))

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

;; Package
(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PATH"))

(use-package pallet
 :config
 (pallet-mode t))


;; init-loader
(require 'init-loader)
(use-package init-loader
 :config
 (setq init-loader-show-log-after-init 'error-only)
  (cond ((not window-system))
  
                     ((window-system)
                  (init-loader-load "~/.emacs.d/Inits"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja")
 '(haskell-process-type (quote stack-ghci))
 '(haskell-program-name "cabal repl" t)
 '(package-selected-packages
   (quote
    (dired-toggle-sudo racer twittering-mode markdown-mode emoji-cheat-sheet-plus yaml-mode web-mode use-package undo-tree tern-auto-complete sr-speedbar smartscan smartparens slack shampoo scheme-complete redo+ rainbow-delimiters quickrun quack py-gnitset point-undo paredit pandoc-mode pallet package-utils newlisp-mode mwim multiple-cursors matlab-mode magit key-combo jump julia-shell init-loader image+ ido-skk hlinum hiwin hindent helm-swoop helm-descbinds helm-company helm-c-yasnippet helm-anything helm-ag haskell-tab-indent graphviz-dot-mode google-translate gnuplot-mode ghc-imported-from expand-region exec-path-from-shell ess-R-data-view ensime elscreen eldoc-extension eimp easy-kill direx dired-toggle dash-functional dash-at-point company-ghc company-coq chicken-scheme bibtex-utils autopair auto-highlight-symbol auto-complete-clang-async auto-async-byte-compile anzu ac-slime ac-js2 ac-helm 4clojure)))
 '(quack-smart-open-paren-p t)
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp))))
 '(yas-trigger-key (kbd "TAB")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(quack-pltish-defn-face ((t (:foreground "DarkGoldenrod2" :weight bold))))
 '(quack-pltish-module-defn-face ((t (:inherit quack-pltish-defn-face :foreground "orange2"))))
 '(quack-pltish-paren-face ((t (:foreground "salmon"))))
 '(quack-pltish-selfeval-face ((t (:foreground "indian red")))))
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
