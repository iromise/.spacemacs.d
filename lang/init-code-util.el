;;---------------------------------------------------------------------------------
;; Add spell-checking in comments for all programming language modes except Chinese
;;---------------------------------------------------------------------------------

;; use apsell as ispell backend
(setq-default ispell-program-name "aspell")

;; use American English as ispell default dictionary
(ispell-change-dictionary "american" t)

(if (executable-find "aspell")
    (progn
      (setq ispell-program-name "aspell")
      (setq ispell-extra-args '("--sug-mode=ultra")))
  (setq ispell-program-name "ispell"))

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; on OSX the mouse 2 is tricky
(when *is-a-mac*
  (eval-after-load "flyspell"
    '(progn
       (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
       (define-key flyspell-mouse-map [mouse-3] #'undefined)
       (global-set-key (kbd "<f9>") 'ispell-word)
       (global-set-key (kbd "C-S-<f9>") 'flyspell-mode)
       (global-set-key (kbd "C-M-<f9>") 'flyspell-buffer)
       (global-set-key (kbd "C-<f9>") 'flyspell-check-previous-highlighted-word)
       (defun flyspell-check-next-highlighted-word ()
         "Custom function to spell check next highlighted word"
         (interactive)
         (flyspell-goto-next-error)
         (ispell-word))
       (global-set-key (kbd "M-<f9>") 'flyspell-check-next-highlighted-word))))


;; If you move point on a symbol, it automatically highlights all the symbols 
;; in the current screen. From now on, pressing M-n and M-p will immediately 
;; jump to the next/previous symbols in a buffer.
(require-package 'highlight-symbol)
(require 'highlight-symbol)

(highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))
(add-hook 'org-mode-hook (lambda () (highlight-symbol-mode)))

(setq highlight-symbol-idle-delay 0.2
      highlight-symbol-on-navigation-p t)

(global-set-key [(control shift mouse-1)]
                (lambda (event)
                  (interactive "e")
                  (goto-char (posn-point (event-start event)))
                  (highlight-symbol-at-point)))

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)


;; wait to be done in the future
;;(add-hook 'css-mode-hook 'rainbow-mode)
(provide 'init-code-util)
