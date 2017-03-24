(require-package 'markdown-mode)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)

;; to make Emacs recognize the markdown
(setq auto-mode-alist
      (cons '("\\.\\(md\\|markdown\\)\\'" . markdown-mode) auto-mode-alist))

(set 'markdown-command
     "pandoc -f markdown -t html -s --mathjax --highlight-style pygments")
(provide 'init-markdown)
