(require 'iimage)

;;(add-hook 'info-mode-hook 'iimage-mode)
(add-hook 'markdown-mode-hook 'iimage-mode)
;;(add-hook 'markdown-mode-hook '(lambda()
;;               (define-key markdown-mode-map
;;                 (kbd "<f12>") 'turn-on-iimage-mode)))

(setq iimage-mode-image-search-path '(list "." ".."))

; match: {% img xxx %}
(add-to-list 'iimage-mode-image-regex-alist 
       (cons (concat "{% img /?\\("
             iimage-mode-image-filename-regex
             "\\) %}") 1))
; match: ![xxx](/xxx)
(add-to-list 'iimage-mode-image-regex-alist 
       (cons (concat "!\\[.*?\\](/\\("
             iimage-mode-image-filename-regex
             "\\))") 1))
;; 
(if (configuration-layer/package-usedp 'Markdown)
    (progn
      (global-set-key (kbd "C-1") 'markdown-insert-header-atx-1)
      (global-set-key (kbd "C-2") 'markdown-insert-header-atx-2)
      (global-set-key (kbd "C-3") 'markdown-insert-header-atx-3)
      (global-set-key (kbd "C-4") 'markdown-insert-header-atx-4)
      (global-set-key (kbd "C-5") 'markdown-insert-header-atx-5)
      (global-set-key (kbd "C-6") 'markdown-insert-header-atx-6) ))
(provide 'init-markdown)
