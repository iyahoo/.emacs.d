(defun mc/edit-lines-or-string-rectangle (s e)
  "C-x r tで同じ桁の場合にmc/edit-lines (C-u M-x mc/mark-all-dwim)"
  (interactive "r")
  (if (eq (save-excursion (goto-char s) (current-column))
          (save-excursion (goto-char e) (current-column)))
      (call-interactively 'mc/edit-lines)
    (call-interactively 'string-rectangle)))

(defun mc/mark-all-dwim-or-mark-sexp (arg)
  "C-u C-M-SPCでmc/mark-all-dwim, C-u C-u C-M-SPCでC-u M-x mc/mark-all-dwim"
  (interactive "p")
  (cl-case arg
    (16 (mc/mark-all-dwim t))
    (4 (mc/mark-all-dwim nil))
    (1 (mark-sexp 1))))

(use-package multiple-cursors
  :bind (("C-x r t" . mc/edit-lines-or-string-rectangle)
         ("C-M-SPC" . mc/mark-all-dwim-or-mark-sexp)))
