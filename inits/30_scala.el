(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

(use-package scala-mode :ensure t
 :config
 (defun my/file-exists-p (file)
   "Search file recursively until home directory"
   (let* ((filename (concat "./" file))
          (home   "~/")
          (home-p (lambda (dir1 filename)
                    (equal
                     (expand-file-name dir1)
                     (expand-file-name
                      (file-name-directory filename))))))
     (while (not (or (file-exists-p filename)
                     (funcall home-p home filename)))
       (setq filename (concat "../" filename)))
     (when (file-exists-p filename)
       (expand-file-name filename))))
 (setq ensime-auto-connect 'always)
 (add-hook 'scala-mode-hook '(lambda ()
                               (when (my/file-exists-p ".ensime")
                                 (ensime-scala-mode-hook)))))

(use-package ensime :ensure t :pin melpa-stable
   :config
   (defun scala/enable-eldoc ()
     "Show error message or type name at point by Eldoc."
     (setq-local eldoc-documentation-function
                 #'(lambda ()
                     (when (ensime-connected-p)
                       (let ((err (ensime-print-errors-at-point)))
                         (or (and err (not (string= err "")) err)
                             (ensime-print-type-at-point))))))
     (eldoc-mode +1))
   
   (defun scala/completing-dot-company ()
     (cond (company-backend
            (company-complete-selection)
            (scala/completing-dot))
           (t
            (insert ".")
            (company-complete))))
   
   (defun scala/completing-dot ()
     "Insert a period and show company completions."
     (interactive "*")
     (eval-and-compile (require 'ensime))
     (eval-and-compile (require 's))
     (when (s-matches? (rx (+ (not space)))
                       (buffer-substring (line-beginning-position) (point)))
       (delete-horizontal-space t))
     (cond ((not (and (ensime-connected-p) ensime-completion-style))
            (insert "."))
           ((eq ensime-completion-style 'company)
            (scala/completing-dot-company))
           ((eq ensime-completion-style 'auto-complete)
            (scala/completing-dot-ac))))
   (define-key scala-mode-map (kbd ".") 'scala/completing-dot)
   ;; 補完には company を使用する
   (setq ensime-completion-style 'company)
   (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
   (add-hook 'ensime-mode-hook #'scala/enable-eldoc))
