(require-package 'undo-tree)

(global-set-key (kbd "C-x u") 'undo-tree-visualize)
(global-undo-tree-mode t)

(provide 'init-undo-tree)
