;; Auto-complete
(ac-config-default)
(global-auto-complete-mode t)
;;自動表示設定(少々重い)
;;(setq ac-auto-start t)
;; (setq ac-auto-start nil)
;;(setq ac-auto-show-m enu 1.0)
;;(setq ac-auto-start 4)
;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)
;; (define-key ac-mode-map (kbd "M-p") 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(setq popup-use-optimized-column-computation nil)
(setq ac-disable-faces nil)



;; (require 'auto-complete-clang-async)

;; (defun ac-cc-mode-setup ()
;; 	(setq ac-clang-complete-executable "~/.emacs.d/elisp/clang-complete")
;; 	;; (setq ac-sources (cons 'ac-source-clang-async ac-sources))
;;   (setq ac-clang-cflags
;;         (mapcar (lambda (item)(concat "-I" item))
;;                 (split-string
;;                  "
;; /usr/lib
;; /usr/local/include
;; /usr/include
;; "
;;                  )))
;; 	(setq ac-sources '(ac-source-clang-async))  
;; 	(ac-clang-launch-completion-process))


;; (defun my-ac-config ()
;; 	(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;; 	(add-hook 'auto-complete-mode-hook 'ac-common-setup))
;; (my-ac-config)

;; (require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable (expand-file-name "~/.emacs.d/clang-complete"))
  (setq ac-sources (append '(ac-source-clang-async) ac-sources))
  (setq ac-clang-cflags (mapcar (lambda (item)
                                  (concat "-I" (expand-file-name item)))
                                (split-string "~/local/llvm/lib/clang/3.4/include
~/local/include
/Applications/Xcode.app/Contents/Developer/usr
/usr/include/c++/4.2.1"
                                              )))
  (setq ac-clang-cflags (append '("-std=c++11 -stdlib=libc++") ac-clang-cflags))
  (ac-clang-launch-completion-process))
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t)


;; (require 'ac-helm) ;; Not necessary if using ELPA package
(global-set-key (kbd "M-p") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "M-p") 'ac-complete-with-helm)
(setq ac-auto-show-menu nil)
