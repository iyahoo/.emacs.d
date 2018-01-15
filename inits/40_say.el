(defun MyTeX-speech ()
  "Convert text to audible speech by /usr/bin/say of OSX."
  (interactive)
  (let (b e s
          (block-sep-str "^\*\\|^\\ *%\\|^\\ *\n\\|\\\\item\\|\\\\begin\\|\\\\end"))
    (if (eq (process-status "speech") 'run)
        (delete-process "speech")
      (progn
        (if mark-active
            (setq b (mark) e (point))
          (setq b (save-excursion
                    (progn
                      (re-search-backward block-sep-str (point-min) 1)
                      (point)))
                e (save-excursion
                    (progn
                      (re-search-forward block-sep-str (point-max) 1)
                      (point)))))
        (setq s (buffer-substring-no-properties b e)
              s (replace-regexp-in-string "\\\\%" "percent" s)
              s (replace-regexp-in-string "\\\\item" " " s)
              s (replace-regexp-in-string "\\\\begin" " " s)
              s (replace-regexp-in-string "\\\\end" " " s)
              s (replace-regexp-in-string "%[^\n]*" "" s)
              s (replace-regexp-in-string
                 "\\\\[a-zA-Z]+{\\|[$\\\\_^~(){}`*\n]" " " s)
              s (replace-regexp-in-string "\\ +" " " s))
        (message s)
        (process-kill-without-query
         (start-process-shell-command "speech" nil
                                      "/usr/bin/say" (concat "\"" s "\"" )))))))

(bind-key "M-r" 'MyTeX-speech)
