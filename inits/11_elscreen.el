;; elscreen
(elscreen-start)

(global-set-key (kbd "M-t") 'elscreen-create)
(global-set-key (kbd "M-T") 'elscreen-clone)
(global-set-key (kbd "M-}") 'elscreen-next)
(global-set-key (kbd "M-{") 'elscreen-previous)
(global-set-key [(C-tab)] 'elscreen-next)
(global-set-key [(C-S-tab)] 'elscreen-previous)

(defmacro elscreen-create-automatically (ad-do-it)
  `(if (not (elscreen-one-screen-p))
       ,ad-do-it
     (elscreen-create)
     (elscreen-notify-screen-modification 'force-immediately)
     (elscreen-message "New screen is automatically created")))
 
(defadvice elscreen-next (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))
 
(defadvice elscreen-previous (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-toggle (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

(defun elscreen-frame-title-update ()
  (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
    (let* ((screen-list (sort (elscreen-get-screen-list) '<))
       (screen-to-name-alist (elscreen-get-screen-to-name-alist))
       (title (mapconcat
           (lambda (screen)
             (format "%d%s %s"
                 screen (elscreen-status-label screen)
                 (get-alist screen screen-to-name-alist)))
           screen-list " ")))
      (if (fboundp 'set-frame-name)
      (set-frame-name title)
    (setq frame-title-format title)))))
 
;; (eval-after-load "elscreen"
;;   '(add-hook 'elscreen-screen-update-hook 'elscreen-frame-title-update))
