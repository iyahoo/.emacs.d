;; Diminish
(use-package diminish
  :config
  (defmacro safe-diminish (file mode &optional new-name)
    "https://github.com/larstvei/dot-emacs/blob/master/init.org"
    `(with-eval-after-load ,file
       (diminish ,mode ,new-name)))
  ;; (safe-diminish "whitespace" 'whitespace-mode)
  )
