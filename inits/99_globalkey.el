;; コマンドエイリアス

;; 空白を削除
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'exit 'save-buffers-kill-emacs)
(defalias 'al 'align)
(defalias 'ab 'auto-save-buffers-toggle)
;; macros
(defalias 'reload 'revert-all-buffers)
(defalias 'acm 'auto-complete-mode)
(defalias 'trun 'toggle-truncate-lines)

;; quicrun
(global-set-key (kbd "C-x C-c") 'quickrun)
(defalias 'qr 'quickrun-region)
(defalias 'qwa 'quickrun-with-arg)
