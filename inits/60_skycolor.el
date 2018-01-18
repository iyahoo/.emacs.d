(defvar sky-color-clock-mode nil)

(defun global-sky-color-clock-mode ()
  (interactive)
  (if sky-color-clock-mode
      (progn (pop mode-line-format)
             (setq sky-color-clock-mode nil))
    (progn (push '(:eval (sky-color-clock)) mode-line-format)
           (setq sky-color-clock-mode t))))

(defun my-file-contents (filename)
  "Return the contents of FILENAME as string."
  (remove ?\n (with-temp-buffer
                (insert-file-contents filename)
                (buffer-string))))

(use-package sky-color-clock
  :defer nil
  :init
  (require 'sky-color-clock)
  (sky-color-clock-initialize 35)
  (sky-color-clock-initialize-openweathermap-client (my-file-contents "60_sky_api.el") 2112615)
  (setq sky-color-clock-enable-emoji-icon t))
