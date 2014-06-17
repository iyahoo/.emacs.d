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
(add-to-load-path "../.emacs.d")

;; cask

(cond
 ((string-match "apple-darwin" system-configuration)
  (load "~/.emacs.d/etc/cocoa.el")
  (require 'cask "/usr/local/Cellar/cask/0.7.0/cask.el")
  (cask-initialize))
 
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
