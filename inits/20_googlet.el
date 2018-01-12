;; (defvar google-translate-english-chars "[:ascii:]"
;;   "これらの文字が含まれているときは英語とみなす")
;; (defun google-translate-enja-or-jaen (&optional string)
;;   "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
;;   (interactive)
;;   (setq string
;;         (cond ((stringp string) string)
;;               (current-prefix-arg
;;                (read-string "Google Translate: "))
;;               ((use-region-p)
;;                (buffer-substring (region-beginning) (region-end)))
;;               (t
;;                (save-excursion
;;                  (let (s)
;;                    (forward-char 1)
;;                    (backward-sentence)
;;                    (setq s (point))
;;                    (forward-sentence)
;;                    (buffer-substring s (point)))))))
;;   (let* ((asciip (string-match
;;                   (format "\\`[%s]+\\'" google-translate-english-chars)
;;                   string)))
;;     (run-at-time 0.1 nil 'deactivate-mark)
;;     (google-translate-translate
;;      (if asciip "en" "ja")
;;      (if asciip "ja" "en")
;;      string)))
;; (global-set-key (kbd "C-x C-t") 'google-translate-enja-or-jaen)

(global-set-key (kbd "C-x C-t") 'google-translate-at-point)
(global-set-key (kbd "C-x C-r") 'google-translate-at-point-reverce)

;; 翻訳のデフォルト値を設定(ja -> en)（無効化は C-u する）
(custom-set-variables
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja"))

;; google-translate.elの翻訳バッファをポップアップで表示させる
(push '("*Google Translate*") popwin:special-display-config)
