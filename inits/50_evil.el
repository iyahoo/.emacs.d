(defadvice update-buffer-local-cursor-color
  (around evil-update-buffer-local-cursor-color-in-insert-state activate)
  ;; SKKによるカーソル色変更を, 挿入ステートかつ日本語モードの場合に限定
  "Allow ccc to update cursor color only when we are in insert
state and in `skk-j-mode'."
  (when (and (eq evil-state 'insert) (boundp 'skk-j-mode) skk-j-mode)
    ad-do-it))

(defadvice evil-refresh-cursor
  (around evil-refresh-cursor-unless-skk-mode activate)
  ;; Evilによるカーソルの変更を, 挿入ステートかつ日本語モードではない場合に限定
  "Allow ccc to update cursor color only when we are in insert
state and in `skk-j-mode'."
  (unless (and (eq evil-state 'insert) (boundp 'skk-j-mode) skk-j-mode)
    ad-do-it))

(defadvice evil-ex-search-update-pattern
  (around evil-inhibit-ex-search-update-pattern-in-skk-henkan activate)
  ;; SKKの未確定状態(skk-henkan-mode)ではない場合だけ, 検索パターンをアップデート
  "Inhibit search pattern update during `skk-henkan-mode'.
This is reasonable since inserted text during `skk-henkan-mode'
is a kind of temporary one which is not confirmed yet."
  (unless (and (boundp 'skk-henkan-mode) skk-henkan-mode)
    ad-do-it))

