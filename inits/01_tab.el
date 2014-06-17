(setq-default tab-width 4 indent-tabs-mode nil)


(add-hook 'c-mode-hook
          '(lambda () (setq tab-width 4)))

;; C++ style
(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")
             (setq indent-tabs-mode nil)     ; インデントは空白文字で行う（TABコードを空白に変換）
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
             ))

;; (add-hook 'c-mode-common-hook
;;           (setq-default c-basic-offset 4)
          ;; )                             ;

(add-hook 'c-mode-common-hook
          (lambda () (setq tab-width 4)))

(add-hook 'nxml-mode-hook
          '(lambda () (setq tab-width 4)))
