(require 'smartrep)

(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-M-,") 'er/contract-region)

(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)

(smartrep-define-key
 global-map "C-." '(("C-n" . 'mc/mark-next-like-this)
                    ("C-p" . 'mc/mark-previous-like-this)
                    ("*"   . 'mc/mark-all-like-this)))
