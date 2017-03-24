


(require-package 'auctex)                    ; judge if auxtex has alreadly been loaded, if not, install it and load it.

(require-package 'company-auctex)            ; provides auto-completion for auctex
(company-auctex-init)

(mapc (lambda (mode)
        (add-hook 'LaTeX-mode-hook mode))
      (list 'LaTeX-math-mode                 ; display using math mode, for example, display the mathematical formula as it can be seen
            'turn-on-reftex                  ; open reference mode 
            'TeX-fold-mode                   ; open code fold mode
            'linum-mode                      ; display line number
            ;;'auto-complete-mode              ; open the auto complete function
            'autopair-mode                   ; open the auto pair mode, just like you input (, and it will show ()
            'outline-minor-mode))            ; open the outline mode

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t        ; remove all tabs before saving
                  TeX-engine 'xetex          ; use xelatex default
                  TeX-show-compilation t)    ; display compilation windows defalut
            (TeX-global-PDF-mode t)          ; PDF mode enable, not plain
            (setq TeX-save-query nil)        ; no query before save
            (setq TeX-clean-confirm nil)     ; do not ask before deleting files about latex generated in the middle
            ;;(imenu-add-menubar-index)      ; uncomment it to open the index
            ;;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            ))



;; configuration for TeX-fold-mode
;; add entries you want to be fold, or comment that needn't to be fold.
(setq TeX-fold-env-spec-list
      (quote (("[figure]" ("figure"))
              ("[table]" ("table"))
              ("[itemize]" ("itemize"))
              ("[description]" ("description"))
              ("[tabular]" ("tabular"))
              ("[frame]" ("frame"))
              ("[array]" ("array"))
              ("[code]" ("lstlisting"))
;;              ("[eqnarray]" ("eqnarray"))
              )))


;; configuration for reftex
;; make the toc displayed on the left
(setq reftex-toc-split-windows-horizontally t)
;; adjust the fraction
(setq reftex-toc-split-windows-fraction 0.3)

(provide 'init-auctex)
