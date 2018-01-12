(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)

;; (push '("*auto-async-byte-compile*" :height 14 :position bottom :noselect t) popwin:special-display-config)


