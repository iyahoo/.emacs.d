(set-face-attribute 'default nil ;;
                    :family "Menlo" ;;font
                    :height 130) ;;Font size
(set-fontset-font nil 'japanese-jisx0208
                  (font-spec :family "Hiragino Mincho Pro")) ;;font
(setq face-font-rescale-alist
      '((".*Hiragino_Mincho_pro.*". 1.2)));;

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

(setq initial-frame-alist ;;ウィンドウの初期サイズ      
      (append (list
               '(width . 168)
               '(height . 41)
               )
              initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
