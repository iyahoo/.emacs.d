(global-set-key "\C-\\" 'skk-mode)

;;コメント行を抜けたらasciiにする

;; (add-hook 'skk-load-hook
;;           (lambda ()
;;             (require 'context-skk)))

;; .SKKの設定

;; 表示の設定

;; メッセージを日本語で通知する
(setq skk-japanese-message-and-error t)

;; メニューを英語で表示する
(setq skk-show-japanese-menu t)

;; 変換時に注釈 (annotation) を表示する
(setq skk-show-annotation t)

;;isearch-mode に入った際に自動的に skk-isearch を起動
(add-hook 'isearch-mode-hook 'skk-isearch-mode-setup)
(add-hook 'isearch-mode-end-hook 'skk-isearch-mode-cleanup)

(defun my--markdown-entery-key-ad (this-func &rest args)
  "markdown-modeでskk-henkan-mode中にエンターすると行頭にカーソルが飛んでしまう問題の対応"
  (if skk-henkan-mode (skk-kakutei)
    (apply this-func args)))

(advice-add #'markdown-enter-key :around #'my--markdown-entery-key-ad)

;; 
;; (when skk-use-color-cursor
;;   ;; カーソル色を変えてみる
;;   (setq skk-cursor-hiragana-color "LimeGreen"
;;         skk-cursor-katakana-color "DodgerBlue"
;;         skk-cursor-abbrev-color "red"
;;         skk-cursor-jisx0208-latin-color "red"
;;         skk-cursor-jisx0201-color "purple"
;;         skk-cursor-latin-color "Yellow3"))


;; 変換候補一覧と注釈 (annotation) を GUI ぽく表示する
(setq skk-show-tooltip t)

;;tooltipの色設定
(when skk-show-tooltip
  (setq skk-tooltip-parameters
        '((background-color . "ForestGreen")
          (border-color . "royal blue")))
  )

;; 変換候補をインラインに表示する
(setq skk-show-inline t)

;; 変換候補を縦型インラインに表示する
(setq skk-show-inline 'vertical)

(when skk-show-inline
  ;; 変数 skk-treat-candidate-appearance-function を利用して自前で候補に
  ;; 色を付ける場合はこの変数を nil に設定する。
  (setq skk-inline-show-face nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;基本的なユーザ・インターフェース
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enter キーを押したときには確定する
(setq skk-egg-like-newline t)

;; 対応する閉括弧を自動的に挿入する
(setq skk-auto-insert-paren t)

;; 句読点を動的に決定する
;; (add-hook 'skk-mode-hook
;;           (lambda ()
;;             (save-excursion
;;               (goto-char 0)
;;               (make-local-variable 'skk-kutouten-type)
;;               (if (re-search-forward "。" 10000 t)
;;                   (setq skk-kutouten-type 'en)
;;                 (setq skk-kutouten-type 'jp)))))

(setq skk-kutouten-type 'en) ;; 

;; 動的な補完を使う 
;; (setq skk-dcomp-activate t)

;; 動的補完の可否を判定するより高度な設定例
;; (setq skk-dcomp-activate
;;       #'(lambda ()
;;           (and
;;            ;; -nw では動的補完をしない。
;;            window-system
;;            ;; 基本的に行末のときのみ補完する。ただし行末でなくても現在の
;;            ;; ポイントから行末までの文字が空白のみだったら補完する。
;;            (or (eolp)
;;                (looking-at "[ \t]+$")))))

;; 動的補完で候補を複数表示する
;; (setq skk-dcomp-multiple-activate t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;変換動作の調整
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 送り仮名が厳密に正しい候補を優先して表示する
(setq skk-henkan-strict-okuri-precedence t)

;; 辞書登録のとき、余計な送り仮名を送らないようにする
(setq skk-check-okurigana-on-touroku 'auto)

;; 変換の学習
(require 'skk-study)

;;単漢字検索のキーを!にする
(setq skk-tankan-search-key ?!)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @@ 検索に関連した設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; look コマンドを使った検索をする
(setq skk-use-look t)

(when skk-use-look
  ;; look が見つけた語を見出し語として検索する
  (setq skk-look-recursive-search t)
  ;; ispell を look と一緒に使うのはやめる
  (setq skk-look-use-ispell nil)
  ;; look に渡すコマンドラインオプションの設定。補完時と検索時それぞれに
  ;; ついて設定できる。
  ;; look で case を見るときは、それ専用の辞書を sort コマンドで作る必要
  ;; がある (look の引数 -d, -f は sort の引数 -d, -f と一致させておく必
  ;; 要がある)。
  ;; (*) 補完時には引数 -d を指定すると dcomp との併用時に問題あることが
  ;; 報告されているため、-d を指定しないことをお勧めします。
  (setq skk-look-completion-arguments "%s /usr/share/dict/words")
  (setq skk-look-conversion-arguments "-df %s /usr/share/dict/words")
  ;; `skk-abbrev-mode' で skk-look を使った検索をしたときに確定情報を
  ;; 個人辞書に記録しないようにする
  (add-hook 'skk-search-excluding-word-pattern-function
            ;; KAKUTEI-WORD を引数にしてコールされるので、不要でも引数を取る
            ;; 必要あり
            #'(lambda (kakutei-word)
                (and skk-abbrev-mode
                     (save-match-data
                       ;; `skk-henkan-key' が "*" で終わるとき、または
                       ;; `skk-henkan-key' が数字のみのとき
                       (or (string-match "\\*$" skk-henkan-key)
                           (string-match "^[0-9]*$" skk-henkan-key)))))))

;; 数値変換機能を使う
(setq skk-use-numeric-conversion t)

;; カタカナ語を変換候補に加える。
;; (setq skk-search-prog-list
;;       (skk-nunion skk-search-prog-list
;;                   '((skk-search-katakana))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;辞書に関する設定 實は
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 辞書サーバを使うための設定
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)

;; 複数の Emacsen を起動して個人辞書を共有する
(setq skk-share-private-jisyo t)

;; 10 分放置すると個人辞書が自動的に保存される設定
(defvar skk-auto-save-jisyo-interval 60)
(defun skk-auto-save-jisyo ()
  (skk-save-jisyo)
  (run-with-idle-timer skk-auto-save-jisyo-interval
                       skk-auto-save-jisyo-interval
                       'skk-auto-save-jisyo))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;その他いろいろ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; かなモードの入力で (モード変更を行なわずに) 長音(ー)を
;; ASCII 数字の直後では `-' に、全角数字の直後では `?' にしたい。
(setq skk-rom-kana-rule-list
	  (cons '("-" nil skk-hyphen)
			skk-rom-kana-rule-list))
(defun skk-hyphen (arg)
  (let ((c (char-before (point))))
    (cond ((null c) "ー")
          ((and (<= ?0 c) (>= ?9 c)) "-")
          ((and (<= ?０ c) (>= ?９ c)) "?")
          (t "ー"))))

;; かなモードの入力でモード変更を行わずに、数字入力中の
;; 小数点 (.) およびカンマ (,) 入力を実現する。
;; (例) かなモードのまま 1.23 や 1,234,567 などの記述を行える。
;; period
(setq skk-rom-kana-rule-list
	  (cons '("." nil skk-period)
			skk-rom-kana-rule-list))
(defun skk-period (arg)
  (let ((c (char-before (point))))
    (cond ((null c) "。")
          ((and (<= ?0 c) (>= ?9 c)) ".")
          ((and (<= ?０ c) (>= ?９ c)) "．")
          (t "。"))))

;; comma
(setq skk-rom-kana-rule-list
      (cons '("," nil skk-comma)
            skk-rom-kana-rule-list))
(defun skk-comma (arg)
  (let ((c (char-before (point))))
    (cond ((null c) "、")
          ((and (<= ?0 c) (>= ?9 c)) ",")
          ((and (<= ?０ c) (>= ?９ c)) "，")
          (t "、"))))
