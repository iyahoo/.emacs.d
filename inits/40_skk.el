(use-package skk
  :bind* (:map global-map ("C-\\" . skk-mode))
  :config
  (setq-default skk-japanese-message-and-error t
                skk-show-japanese-menu         nil

                skk-show-annotation t
                skk-show-tooltip    t
                skk-show-inline     'vertical

                skk-egg-like-newline t

                skk-kutouten-type 'jp
                skk-jisyo-code "euc"

                skk-henkan-strict-okuri-precedence t
                skk-check-okurigana-on-touroku     'auto

                skk-use-look t
                skk-use-act  t

                skk-use-numeric-conversion t

                skk-server-host "localhost"
                skk-server-portnum 1178
                skk-share-private-jisyo t

                skk-save-jisyo-instantly t

                skk-auto-insert-paren t
                skk-delete-implies-kakutei nil)

  (when skk-show-tooltip
    (setq-default skk-tooltip-parameters
                  '((background-color . "ForestGreen")
                    (border-color . "royal blue"))))

  (when skk-show-inline
    (setq-default skk-inline-show-face nil))

  (when skk-use-look
    (setq-default skk-look-recursive-search t
                  skk-look-use-ispell nil
                  skk-look-completion-arguments "%s /usr/share/dict/words"
                  skk-look-conversion-arguments "-df %s /usr/share/dict/words")
    (add-hook 'skk-search-excluding-word-pattern-function
              #'(lambda (kakutei-word)
                  (and skk-abbrev-mode
                       (save-match-data
                         (or (string-match "\\*$" skk-henkan-key)
                             (string-match "^[0-9]*$" skk-henkan-key)))))))

  (add-hook 'isearch-mode-hook 'skk-isearch-mode-setup)
  (add-hook 'isearch-mode-end-hook 'skk-isearch-mode-cleanup)

  (defun my--markdown-entery-key-ad (this-func &rest args)
    "https://www.yewton.net/2016/01/20/markdown-mode-skk-kakutei/"
    (if skk-henkan-mode (skk-kakutei)
      (apply this-func args)))
  (advice-add #'markdown-enter-key :around #'my--markdown-entery-key-ad)

  (defvar skk-auto-save-jisyo-interval 60)
  (defun skk-auto-save-jisyo ()
    (skk-save-jisyo)
    (run-with-idle-timer skk-auto-save-jisyo-interval
                         skk-auto-save-jisyo-interval
                         'skk-auto-save-jisyo))
  ;;
  (setq skk-rom-kana-rule-list
        (cons '("-" nil skk-hyphen)
              skk-rom-kana-rule-list))
  (defun skk-hyphen (arg)
    (let ((c (char-before (point))))
      (cond ((null c) "ー")
            ((and (<= ?0 c) (>= ?9 c)) "-")
            ((and (<= ?０ c) (>= ?９ c)) "?")
            (t "ー"))))

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

  (use-package skk-study
    :after skk
    :config
    (setq skk-tankan-search-key ?!)))
