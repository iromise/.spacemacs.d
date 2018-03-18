(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t        ; remove all tabs before saving
                  TeX-engine 'xetex          ; use xetex default, so as to support chinese
                  TeX-show-compilation nil)    ; display compilation windows defalut
            (TeX-global-PDF-mode t)          ; PDF mode enable, not plain
            (setq TeX-save-query nil)        ; no query before save
            (setq TeX-clean-confirm nil)     ; do not ask before deleting files about latex generated in the middle
            ))
(provide 'init-latex)
