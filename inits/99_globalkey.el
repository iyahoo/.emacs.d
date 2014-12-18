;;; key --------------------------------------------------------------

(global-set-key (kbd "C-s") 'forward-char)

(global-set-key (kbd "C-f") 'isearch-forward)

(global-set-key (kbd "M-s") 'forward-word)

(global-set-key (kbd "C-M-s") 'forward-sexp)

(global-set-key (kbd "M-g") 'goto-line) ;;指定行へジャンプ

(define-key global-map (kbd "C-c l") 'toggle-truncate-lines) ;;折り返しトグルコマンド

(setq default-tab-width 2) ;; tab = 4space
(setq indent-line-function 'indent-relative-maybe)

;;commandkeyをメタに
(setq ns-command-modifier 'meta)

;; (setq ns-function-modifier 'hyper)
(setq ns-alternate-modifier 'super)

 ;;C-hをバックスペースに
(global-set-key (kbd "C-h") 'backward-delete-char)
 ;; M-hで単語削除
(global-set-key (kbd "M-h") 'backward-kill-word)

(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
;; (define-key isearch-mode-map (kbd "M-h") 'isearc)
 ;;C-mにnewline-and-indentを割り当て
(global-set-key (kbd "C-m") 'newline-and-indent)

;;"C-t"でウィンドウを切り替える,ウィンドウがひとつなら新たに作成し、
;;そちらのウィンドウに移動するウィンドウに移動する
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)


;; 単一ウィンドウに戻すのを Ctrl-x Ctrl-1 で可能に
;; 縦ウィンドウ分割を Ctrl-x Ctrl-2 で可能に
;; 縦ウィンドウ分割を Ctrl-x Ctrl-3 で可能に
;; Ctrl-x Ctrl-d でも  を起動する

(global-set-key (kbd "C-x C-d") 'dired)

 ;; quoted-insert は C-q C-q へ割り当て
(global-set-key "\C-q\C-q" 'quoted-insert)

 ;; window-resizer は C-q C-r (resize) で
(global-set-key "\C-q\C-r" 'my-window-resizer)

;; C-q C-fbnpでウィンドウ移動
(global-set-key (kbd "C-q C-f") 'windmove-right)
(global-set-key (kbd "C-q C-b") 'windmove-left)
(global-set-key (kbd "C-q C-n") 'windmove-down)
(global-set-key (kbd "C-q C-p") 'windmove-up)

(global-set-key (kbd "H-n") 'sort-numeric-fields)
(global-set-key (kbd "H-f") 'sort-fields)

(global-set-key [f12] 'eval-buffer)
(global-set-key [f11] 'ac-clang-syntax-check)
;; コマンドエイリアス

;; 空白を削除
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'exit 'save-buffers-kill-emacs)
(defalias 'al 'align)
(defalias 'ab 'auto-save-buffers-toggle)
;; macros
(defalias 'lc 'line-comment-out)
(defalias 'ln 'line)
(defalias 'reload 'revert-all-buffers)
(defalias 'acm 'auto-complete-mode)
(defalias 'ms 'magit-status)

;; quicrun
(global-set-key (kbd "C-x C-c") 'quickrun)
(defalias 'qr 'quickrun-region)
(defalias 'qwa 'quickrun-with-arg)
