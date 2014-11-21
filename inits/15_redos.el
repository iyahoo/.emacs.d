(global-undo-tree-mode)

(require 'undo-tree)
(global-set-key (kbd "C-_") 'undo-tree-)

(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)

(require 'point-undo)
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)

(setq-default save-place t)

