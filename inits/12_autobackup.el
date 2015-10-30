;;; バックアップ先
;; (setq backup-each-save-mirror-location "~/.emacs.d/each_backup")
;;; バックアップファイルにつけるsuffix
;; (setq backup-each-save-time-format "%y%m%d_%H%M%S")
;;; バックアップするファイルサイズの上限
;; (setq backup-each-save-size-limit 5000000)
;;; バックアップ作成するファイルを判定
;; (defun backup-each-save-backup-p (filename)
;;   (string-match
;;    ;; ファイル名に/sync/が含まれるときのみバックアップする
;;    (rx (or "/sync/"))
;;    (file-truename filename)))
;; (setq backup-each-save-filter-function 'backup-each-save-backup-p)
;;; すべてのファイルをバックアップする
;; (setq backup-each-save-filter-function 'identity) ;
;;; 有効化！
;; (add-hook 'after-save-hook 'backup-each-save)

