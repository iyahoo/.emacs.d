;; org ------------------------------------------------------------

;; (require 'org-install)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-remember)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(define-key org-mode-map [(control tab)] 'elscreen-next)
(define-key org-mode-map [(control shift tab)] 'elscreen-previous)
(define-key org-mode-map (kbd "M-h") 'backward-kill-word)
(define-key org-mode-map (kbd "M-p") 'auto-complete)


(add-hook 'org-mode-hook 'turn-on-font-lock)
;; (setw org-hide-leading-stars t)
(setq org-directory "~/Dropbox/org/todo")
;; (setw org-default-notes-file "notes.org")
(setq org-todo-keywords
	  '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
(setq org-log-done t)

;; アジェンダ表示の対象ファイル
(setq org-agenda-files (list org-directory))
;; ;; アジェンダ表示で下線を用いる
;; (add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
;; (setq hl-line-face 'underline)
;; 標準の祝日を利用しない
(setq calendar-holidays nil)

;; latex
(require 'org-latex)
(add-to-list 'org-export-latex-classes
						 '("jsarticle"
							 "\\documentclass[a4paper, 11pt]{jsarticle}
							 \\usepackage[dvipdfm]{graphicx,color}
\\usepackage{hyperref}
[NO-DEFAULT-PACKAGES]"
("\\section{%s}"				. "\\section{%s}")
("\\subsection{%s}"			. "\\subsection{%s}")
("\\subsubsection{%s}"	. "\\subsubsection{%s}")
("\\paragraph{%s}"			. "\\paragraph{%s}")
("\\subparagraph{%s}"		. "\\subparagraph{%s}")))

