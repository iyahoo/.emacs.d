(when (version< emacs-version "24.4")
  (error "Your Emacs is too old!"))

;; System check
(defconst *macp*   (eq system-type 'darwin))
(defconst *linuxp* (eq system-type 'gnu/linux))

;; Optimize
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 30000000)

;; My info
(setq user-full-name    "Tomoya Furukawa")
(setq user-mail-address "s1200191@gmail.com")

;; Cask path
(defconst *cask-file-path*
  (cond (*macp* "/usr/local/share/emacs/site-lisp/cask/cask.el")
        (t nil)))

;; Load Cask
(unless (and (stringp *cask-file-path*) (file-exists-p *cask-file-path*))
  (error "This init.el requires cask."))

(require 'cask *cask-file-path*)
(cask-initialize)

;; Load path
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

;; use-package
(require 'use-package)
(setq use-package-enable-imenu-support t)
(setq use-package-always-defer t)

;; pallet
(use-package pallet
  :defer nil
  :init
  (pallet-mode t))

;; Package
(defvar *mode* 'all)

(defun set-archives (archive)
  (setq package-archives
        (pcase archive
          ('stable '(("melpa-stable" . "https://stable.melpa.org/packages/")))
          ('all '(("gnu"   . "https://elpa.gnu.org/packages/")
                  ("melpa" . "https://melpa.org/packages/")
                  ("org"   . "https://orgmode.org/elpa/"))))))

(defun select-archives (n)
  (interactive "nSelect package archives (1:stable 2:all): ")
  (let ((archive (pcase n
                   (1 'stable)
                   (2 'all))))
    (set-archives archive)))

(select-archives 2)

(package-initialize)

;; Paradox
(use-package paradox
  :disabled
  :ensure t
  :defer nil
  :config
  (setq paradox-github-token t)
  (setq paradox-execute-asynchronously t)
  (setq paradox-automatically-star nil)
  (setq paradox-display-star-count t))


(use-package benchmark-init
  :ensure t
  :defer nil
  :config
  (benchmark-init/activate)
  (add-hook 'after-init-hook 'benchmark-init/deactivate))


;; PATH
(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :ensure t
    :defer nil
    :init
    (setq exec-path-from-shell-variables '("PATH" "MANPATH"))
    (exec-path-from-shell-initialize)))

;; init-loader
(use-package init-loader
  :ensure t
  :defer nil
  :init
  (setq init-loader-show-log-after-init 'error-only)
  (cond ((not window-system))
        ((window-system)
         (init-loader-load (expand-file-name "inits" user-emacs-directory)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode sql-indent docker-tramp nginx-mode cider py-yapf ddskk emojify magit smartparens treemacs-projectile treemacs company-go go-eldoc go-mode flymake-sass meghanada auto-virtualenvwrapper company-jedi jedi sass-mode helm-swoop powerline noflet benchmark-init diminish eyebrowse golden-ratio yaml-mode which-key undo-tree twittering-mode tuareg tern-auto-complete symbol-overlay sr-speedbar smartscan smartrep shampoo shackle scheme-complete redo+ rainbow-delimiters racer quickrun quack py-gnitset py-autopep8 pos-tip popwin point-undo paredit paradox pandoc-mode pallet package-utils newlisp-mode mwim multiple-cursors markdown-mode main-line key-combo jump julia-shell init-loader image+ ibuffer-vc hlinum hiwin hindent highlight-symbol helm-descbinds helm-company helm-c-yasnippet helm-anything helm-ag haskell-tab-indent graphviz-dot-mode google-translate gnuplot-mode ghc-imported-from fic-mode expand-region exec-path-from-shell esup ess-R-data-view erlang ensime emoji-cheat-sheet-plus elscreen eldoc-extension eimp easy-kill direx dired-toggle-sudo dired-toggle dired+ dash-functional dash-at-point company-ghc company-coq chicken-scheme bm bibtex-utils avy-zap autopair auto-highlight-symbol auto-complete-clang-async auto-async-byte-compile anzu ace-pinyin ac-slime ac-js2 ac-helm 4clojure)))
 '(safe-local-variable-values
   (quote
    ((cider-ns-refresh-before-fn . "hookcider/lein-clean")
     (cider-ns-refresh-before-fn . "simchan.core/lein-clean")
     (cider-ns-refresh-after-fn . "example/start")
     (cider-ns-refresh-before-fn . "example/stop")
     (eval cider-register-cljs-repl-type
           (quote fm)
           "(require 'figwheel.main)(figwheel.main/start \"dev\")"
           (quote cider-verify-piggieback-is-present))
     (cider-cljs-lein-repl . "(do (user/go) (user/cljs-repl))")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)
