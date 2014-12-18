;; (set-face-attribute 'default nil ;;
;;                     :family "Menlo" ;;font
;;                     :height 130) ;;Font size
;; (set-fontset-font nil 'japanese-jisx0208
;;                   (font-spec :family "Hiragino Mincho Pro")) ;;font
;; (setq face-font-rescale-alist
;;       '((".*Hiragino_Mincho_pro.*". 1.2)));;

(when (memq window-system '(mac ns))
  (global-set-key [s-mouse-1] 'browse-url-at-mouse)
  (let* ((size 13)
         (jpfont "Hiragino Maru Gothic ProN")
         (asciifont "Menlo")
         (h (* size 10)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont))
  (setq face-font-rescale-alist
        '(("^-apple-hiragino.*" . 1.2)
          (".*-Hiragino Maru Gothic ProN-.*" . 1.0)
          (".*osaka-bold.*" . 1.2)
          (".*osaka-medium.*" . 1.2)
          (".*courier-bold-.*-mac-roman" . 1.0)
          (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
          (".*monaco-bold-.*-mac-roman" . 0.9) ;
          ("-cdac$" . 1.3))))           ;

;; (create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
;; (set-fontset-font nil
;;                   'japanese-jisx0208
;;                   (font-spec :family "Hiragino Mincho Pro" :size 16)
;;                   nil
;;                   'append)
;; (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo")) 

;; (setq default-input-method "MacOSX")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")

(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)

(defun toggle-fullscreen ()
  "Toggle full screen on X11 or OSX"
  (interactive)
  (when (or (eq window-system 'x) (eq window-system 'ns))
     (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
(global-set-key [f9] 'toggle-fullscreen)

(setq initial-frame-alist ;; ウィンドウの初期サイズ      
      (append (list         
               '(width . 168)
               '(height . 41)
               )
              initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
