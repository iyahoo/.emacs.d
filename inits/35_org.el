
;; (setq
;;  org-export-taskjuggler-target-version 3.0
;;  org-export-preprocess-before-selecting-backend-code-hook '(org-beamer-select-beamer-code)
;;  org-tab-first-hook '(org-hide-block-toggle-maybe org-src-native-tab-command-maybe
;;                       org-babel-hide-result-toggle-maybe org-babel-header-arg-expand) 
;;  org-speed-command-hook '(org-speed-command-default-hook org-babel-speed-command-hook)  
;;  org-occur-hook '(org-first-headline-recenter)
;;  org-metaup-hook '(org-babel-load-in-session-maybe)
;;  org-log-done 'time
;;  org-protocol-protocol-alist '(("outlook" :protocol "outlook" :function org-protocol-outlook
;; :kill-client t))
;;  org-confirm-shell-link-function 'yes-or-no-p
;;  org-finalize-agenda-hook '(my-org-agenda-to-appt)
;;  org-export-latex-final-hook '(org-beamer-amend-header org-beamer-fix-toc org-beamer-auto-fragile-frames
;;                                org-beamer-place-default-actions-for-lists)
;;  org-agenda-sticky t
;;  org-export-date-timestamp-format "%Y-%m-%d"
;;  org-todo-setup-filter-hook '(org-choose-setup-filter)
;;  org-export-latex-after-initial-vars-hook '(org-beamer-after-initial-vars)
;;  org-agenda-skip-scheduled-if-done t
;;  org-font-lock-hook '(org-eval-handle-snippets)
;;  org-velocity-search-method 'regexp
;;  org-agenda-custom-commands '(("r" "Recurring Items" tags-tree
;;                                "+isearch|+it|+to|TODO={TO_SCHEDULE\\|WAIT\\|TOMONITOR}|+refill")
;;                               ("n" "Next Items" tags-tree "TODO={NEXT}") ("w" . "work + custom search")
;;                               ("wa" agenda "Work agenda all" (quote (org-agenda-filter-preset (list "+hittite"))))
;;                               ("wt" agenda "Today" (quote (org-agenda-filter-preset (list "+hittite" "+today"))))
;;                               ("wf" agenda "Focus" (quote (org-agenda-filter-preset (list "+hittite" "-farhad")))
;;                                (quote
;;                                 (org-agenda-skip-function
;;                                  (and (equal "J" (org-entry-get nil "PRIORITY")) (point-at-eol)))
;;                                 )
;;                                )
;;                               ("wF" agenda "Farhad" (quote (org-agenda-filter-preset (list "+hittite" "+farhad"))))
;;                               ("wd" "SMSC docs" tags-tree "+smsc_docs") ("h" . "home + custom search")
;;                               ("ha" agenda "Home agenda all"
;;                                (quote (org-agenda-filter-preset (list "-hittite" "-smsc" "+personnal")))
;;                                ("~/Dropbox/tasks/home.ics"))
;;                               ("hb" tags "+tobuy") ("ht" tags "TODO=\"TOBUY\"+chandlery") ("hc" tags-todo "+ct")
;;                               ("hs" "Sorted ct"
;;                                ((tags "+ct+cuisine+TODO=\"TOBUY\"") (tags "+ct+char+TODO=\"TOBUY\"")
;;                                 (tags "+ct+boat+TODO=\"TOBUY\"") (tags "+ct+camping+TODO=\"TOBUY\"")
;;                                 (tags "+ct+elect+TODO=\"TOBUY\"") (tags "+ct+peinture+TODO=\"TOBUY\"")
;;                                 (tags "+ct+plomberie+TODO=\"TOBUY\"") (tags "+ct+tools+TODO=\"TOBUY\"")
;;                                 (tags "+ct+saison+TODO=\"TOBUY\"")
;;                                 (tags
;;                                  "+ct-tools-cuisine-char-boat-camping-elect-peinture-plomberie-saison+TODO=\"TOBUY\"")
;;                                 )
;;                                nil ("~/Dropbox/tasks/tobuy_ct.txt"))
;;                               ("hi" "Sorted Ikea"
;;                                ((tags-todo "+ikea+cuisine") (tags-todo "+ikea+elect") (tags-todo "+ikea+curtains")
;;                                 (tags-todo "+ikea+rangement") (tags-todo "+ikea-cuisine-elect-curtains-rangement"))
;;                                )
;;                               ("hr" "Reno tobuy" tags "+reno+TODO=\"TOBUY\"")
;;                               ("hf" "Fast work" tags-tree
;;                                "+personnal+Effort>\"0\"+Effort<=\"1:00\"+TODO={INPROGRESS\\|TODO\\|TO_SCHEDULE\\|NEXT}+DEADLINE<\"<+1m>\"")
;;                               ("hm" "Mac work" tags-tree
;;                                "+mac+TODO={INPROGRESS\\|TODO\\|TOBUY}+DEADLINE<\"<+3m>\"")
;;                               ("hT" "Travaux Maison" tags-tree
;;                                "+maison+TODO={INPROGRESS\\|TODO\\|TOMONITOR\\|TOBUY\\|NEXT}")
;;                               ("hw" tags-todo "+wm"))
;;  org-todo-get-default-hook '(org-choose-get-default-mark)
;;  org-latex-format-headline-function 'org-latex-format-headline-default-function
;;  org-expiry-handler-function 'org-toggle-archive-tag
;;  org-default-notes-file "/home/gcharron/Dropbox/backup/notes.org"
;;  org-after-todo-state-change-hook '(org-clock-out-if-current org-checklist)
;;  org-from-is-user-regexp "\\<Gilles Charron\\>"
;;  org-loop-over-headlines-in-active-region t
;;  org-src-mode-hook '(org-src-babel-configure-edit-buffer org-src-mode-configure-edit-buffer)
;;  org-agenda-before-write-hook '(org-agenda-add-entry-text)
;;  org-babel-pre-tangle-hook '(save-buffer)
;;  org-table-use-standard-references t
;;  org-export-copy-to-kill-ring t
;;  org-trigger-hook '(org-choose-keep-sensible org-depend-trigger-todo)
;;  org-mode-hook '(org-drill-add-cloze-fontification
;;                  #[nil "\300\301\302\303\304$\207" [org-add-hook before-save-hook org-encrypt-entries nil t] 5]
;;                  org-column-view-uses-fixed-width-face
;;                  (lambda nil (make-variable-buffer-local (quote yas/trigger-key)) (setq yas/trigger-key [tab])
;;                   (add-to-list (quote org-tab-first-hook) (quote yas/org-very-safe-expand))
;;                   (define-key yas/keymap [tab] (quote yas/next-field)))
;;                  #[nil "\300\301\302\303\304$\207"
;;                    [org-add-hook change-major-mode-hook org-show-block-all append local] 5]
;;                  #[nil "\300\301\302\303\304$\207"
;;                    [org-add-hook change-major-mode-hook org-babel-show-result-all append local] 5]
;;                  org-babel-result-hide-spec org-babel-hide-all-hashes)
;;  org-agenda-follow-indirect t
;;  org-refile-targets '((org-agenda-files :maxlevel . 5))
;;  org-outline-path-complete-in-steps nil
;;  org-export-with-tags 'not-in-toc
;;  org-use-speed-commands t
;;  org-ctrl-c-ctrl-c-hook '(org-babel-hash-at-point org-babel-execute-safely-maybe)
;;  org-refile-use-outline-path t
;;  org-directory "~/lib"
;;  org-enforce-todo-dependencies t
;;  org-cycle-hook '(org-cycle-hide-archived-subtrees org-cycle-hide-drawers org-cycle-hide-inline-tasks
;;                   org-cycle-show-empty-lines org-optimize-window-after-visibility-change)
;;  org-tags-exclude-from-inheritance '("crypt")
;;  org-export-latex-format-toc-function 'org-export-latex-format-toc-default
;;  org-export-taskjuggler-default-project-duration 460
;;  org-export-first-hook '(org-beamer-initialize-open-trackers)
;;  org-export-preprocess-hook '(org-eval-replace-snippts)
;;  org-agenda-skip-timestamp-if-deadline-is-shown t
;;  org-agenda-finalize-hook '(my-org-agenda-to-appt)
;;  org-refile-use-cache t
;;  org-agenda-add-entry-text-maxlines 50
;;  org-crypt-key "A81C65B5"
;;  org-export-with-drawers nil
;;  org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(p!)" "NEXT(n)" "WAIT(w <at> /!)" "TOTEST(o!)" "TOMONITOR(m! <at> )"
;;                       "TOREPORT(r <at> )" "TOREVIEW(R <at> )" "DEBUG(g! <at> )" "TOBUY(b)" "TO_SCHEDULE(s!)" "CHOOSE(C)" "|"
;;                       "DONE(d!)" "CANCELED(c <at> !)" "NOTE(e!)")
;;                      )
;;  org-modules '(org-bbdb org-bibtex org-crypt org-docview org-gnus org-info org-jsinfo org-habit
;; org-irc org-mew
;;                org-mhe org-rmail org-vm org-wl org-w3m org-drill org-eval org-expiry org-git-link org-secretary)
;;  org-babel-tangle-lang-exts '(("tcl" . "tcl") ("perl" . "pl") ("python" . "py") ("emacs-lisp" . "el"))
;;  org-confirm-elisp-link-function 'yes-or-no-p
;;  org-refile-active-region-within-subtree t
;;  org-metadown-hook '(org-babel-pop-to-session-maybe)
;;  org-checklist-export-function 'org-export-as-ascii
;;  org-export-taskjuggler-default-reports '("include \"reports.tji\"")
;;  org-blocker-hook '(org-block-todo-from-children-or-siblings-or-parent org-depend-block-todo)
;;  org-completion-use-ido t
;;  org-babel-load-languages '((sh . t) (python . t) (perl . t) (dot . t) (ledger . t) (gnuplot . t) (octave . t)
;;                             (R . t) (tcl . t) (calc . t))
;;  org-reveal-start-hook '(org-decrypt-entry)
;;  org-agenda-files '("~/Dropbox/backup/personnal.org" "~/Dropbox/backup/work.org" "~/Dropbox/backup/tasks.org")
;;  org-clock-out-hook '(org-clock-remove-empty-clock-drawer)
;;  org-confirm-babel-evaluate nil
;;  org-agenda-skip-scheduled-if-deadline-is-shown t
;;  )
;; ;; org ------------------------------------------------------------

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

;; (let ((org-dir (file-name-directory (locate-library "org"))))
;;   (message "Org mode version %s (org @ %s)" (org-version) org-dir))

;; (unless (string-match "^8" (org-version))
;;   (message "This version of Org mode is no longer supported")
;;   (if (yes-or-no-p (format "Install package `%s'? " 'org))
;;       (ignore-errors
;;         (package-install 'org))
;;     (setq debug-on-error nil)
;;     (error "Please upgrade to 8 or later")))

(setq
 org-export-taskjuggler-target-version 3.0
 org-export-preprocess-before-selecting-backend-code-hook '(org-beamer-select-beamer-code)
 org-tab-first-hook '(org-hide-block-toggle-maybe org-src-native-tab-command-maybe
                      org-babel-hide-result-toggle-maybe org-babel-header-arg-expand))

;; latex
;; (require 'org-latex)
;; (add-to-list 'org-export-latex-classes
;; 						 '("jsarticle"
;; 							 "\\documentclass[a4paper, 11pt]{jsarticle}
;; 							 \\usepackage[dvipdfm]{graphicx,color}
;; \\usepackage{hyperref}
;; [NO-DEFAULT-PACKAGES]"
;; ("\\section{%s}"				. "\\section{%s}")
;; ("\\subsection{%s}"			. "\\subsection{%s}")
;; ("\\subsubsection{%s}"	. "\\subsubsection{%s}")
;; ("\\paragraph{%s}"			. "\\paragraph{%s}")
;; ("\\subparagraph{%s}"		. "\\subparagraph{%s}")))

