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

;; pallet
(use-package pallet
  :config
  (pallet-mode t))

;; Package
(defvar *mode* 'stable)
;; (setq *mode* 'all)

(pcase *mode*
  ('stable (setq package-archives
                 '(("melpa-stable" . "https://stable.melpa.org/packages/"))))
  ('all    (setq package-archives
                 '(("gnu"   . "http://elpa.gnu.org/packages/")
                   ("melpa" . "http://melpa.org/packages/")
                   ("org"   . "http://orgmode.org/elpa/")))))

(package-initialize)

;; Paradox
(use-package paradox
  :config
  (setq paradox-github-token t)
  (setq paradox-execute-asynchronously t)
  (setq paradox-automatically-star nil)
  (setq paradox-display-star-count t))

;; PATH
(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :init
    (setq exec-path-from-shell-variables '("PATH" "MANPATH"))
    (exec-path-from-shell-initialize)))

;; init-loader
(use-package init-loader
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (cond ((not window-system))
        ((window-system)
         (init-loader-load "~/.emacs.d/Inits"))))

