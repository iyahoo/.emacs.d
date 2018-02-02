(defvar sky-color-clock-mode nil)

(defun global-sky-color-clock-mode ()
  (interactive)
  (if sky-color-clock-mode
      (progn (pop mode-line-format)
             (setq sky-color-clock-mode nil))
    (progn (push '(:eval (sky-color-clock)) mode-line-format)
           (setq sky-color-clock-mode t))))

(defconst sky-api-key-file-path
  (expand-emacs-home "inits/___sky_api.el"))

(when (file-exists-p sky-api-key-file-path)
  (defconst sky-api-key
    (my-file-contents sky-api-key-file-path))
  (use-package sky-color-clock
    :disabled
    :defer nil
    :init
    (require 'sky-color-clock)
    (sky-color-clock-initialize 35)
    (sky-color-clock-initialize-openweathermap-client sky-api-key 2112615)
    (setq sky-color-clock-enable-emoji-icon t)))


