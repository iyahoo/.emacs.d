;; add-to-list -------------------------------------------------------

;; (add-to-list 'load-path "~/.emacs.d")
;; (require 'cl)
;; (loop for f in (directory-files "~/.emacs.d" t)
;;       when (and (file-directory-p f)
;;                 (not (member (file-name-nondirectory f) '("." ".."))))
;; 			do (add-to-list 'load-path f))

(defun add-to-load-path (&rest paths) ; elisp内のファイルもパスを通す
  (let (path)
    (dolist (path paths paths)
            (let ((default-directory
                    (expand-file-name (concat user-emacs-directory path))))
              (add-to-list 'load-path default-directory)
              (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
                  (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp/" ".cask/")

;; cask

(cond
 ((string-match "apple-darwin" system-configuration)
  (load "~/.emacs.d/etc/cocoa.el"))
 
 ((string-match "linux" system-configuration)
  (load "~/.emacs.d/etc/linux.el"))
 
 ((string-match "freebsd" system-configuration)
  (load "~/.emacs.d/etc/freebsd.el")))

;; init-loader
(require 'init-loader)
;; 設定ディレクトリ

(cond ((not window-system))
;       (init-loader-load "~/.emacs.d/Inits_nw")
      ((window-system)
       (init-loader-load "~/.emacs.d/Inits")))

;; ログファイル
(setq init-loader-show-log-after-init nil)

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
 '(haskell-process-type (quote cabal-repl))
 '(haskell-program-name "cabal repl")
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp))))
 '(yas-trigger-key (kbd "TAB")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
