(setq kill-whole-line t)

(setq delete-auto-save-files t)

(setq visible-bell t) ;;stop bell
(setq ring-bell-function nil)

(savehist-mode)

(ffap-bindings)

(iswitchb-mode t)

(setq read-buffer-function 'iswitchb-read-buffer)

(defadvice abort-recursive-edit (before minibuffer-save)
  (when (when (eq (selected-window) (active-minibuffer-window))
          (add-to-history minibuffer-history-variable (minibuffer-contents)))))

(defun my-window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
                -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
                -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
      (progn
       (split-window-vertically
        (- (window-height) (/ (window-height) num_wins)))
       (split-window-vertically-n (- num_wins 1)))))

(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
      (progn
       (split-window-horizontally
        (- (window-width) (/ (window-width) num_wins)))
       (split-window-horizontally-n (- num_wins 1)))))

(global-set-key "\C-x@" '(lambda ()
                           (interactive)
                           (split-window-vertically-n 3)))

(global-set-key "\C-x#" '(lambda ()
                           (interactive)
                           (split-window-horizontally-n 3)))

;;; 選択範囲をisearch
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
       (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
       (deactivate-mark)
       ad-do-it
       (if (not forward)
           (isearch-repeat-backward)
           (goto-char (mark))
           (isearch-repeat-forward)))
      ad-do-it))
