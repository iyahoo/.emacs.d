;; Auto-complete

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

(require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable (expand-file-name "~/.emacs.d/elisp/ac-dict/clang-complete"))
  (setq ac-sources (append '(ac-source-clang-async) ac-sources))
  (setq ac-clang-cflags (mapcar (lambda (item)
                                  (concat "-I" (expand-file-name item)))
                                (split-string "~/local/llvm/lib/clang/3.4/include
/Applications/Xcode.app/Contents/Developer/usr
/usr/include/c++/4.2.1"
                                              )))
  (setq ac-clang-cflags (append '("-std=c++11 -stdlib=libc++") ac-clang-cflags))
  (ac-clang-launch-completion-process))
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)
;; (add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t)


;; (require 'ac-helm) ;; Not necessary if using ELPA package
(global-set-key (kbd "M-p") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "M-p") 'ac-complete-with-helm)
(setq ac-auto-show-menu t)
