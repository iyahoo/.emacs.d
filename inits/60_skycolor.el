(defvar sky-color-clock-mode nil)

(defun global-sky-color-clock-mode ()
  (interactive)
  (if sky-color-clock-mode
      (progn (pop mode-line-format)
             (setq sky-color-clock-mode nil))
    (progn (push '(:eval (sky-color-clock)) mode-line-format)
           (setq sky-color-clock-mode t))))

(use-package sky-color-clock
  :defer nil
  :init
  (require 'sky-color-clock)
  (sky-color-clock-initialize 35)
  (sky-color-clock-initialize-openweathermap-client "d2f125b02364f09e899118e8738a93d8" 2112615)
  (setq sky-color-clock-enable-emoji-icon t))
