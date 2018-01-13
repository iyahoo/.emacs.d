(when macp
  (defun ns-popup-dictionary ()
    (interactive)
    (let ((word (substring-no-properties (thing-at-point 'word)))
          (old-buf (current-buffer))
          (dict-buf (get-buffer-create "*dictionary.app*"))
          (view-mode-p)
          (dict))
      (set-buffer dict-buf)
      (erase-buffer)
      (call-process "~/.emacs.d/dict/commandline-dictionary-app/src/dict"
                    nil "*dictionary.app*" t word
                    "Japanese-English" "Japanese" "Japanese Synonyms")
      (setq dict (buffer-string))
      (set-buffer old-buf)
      (when view-mode
        (view-mode)
        (setq view-mode-p t))
      (popup-tip dict)
      (when view-mode-p
        (view-mode))))
  (bind-key "C-c d" 'ns-popup-dictionary))
