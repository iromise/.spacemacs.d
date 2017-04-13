;; link with projectile ,if project changes, the neotree will change, too
(setq projectile-switch-project-action 'neotree-projectile-action)
;; do not show the hidden files, such as .git
(setq neo-show-hidden-files nil)
;; when the neotoggle, find current file, and jump to the node
(setq neo-smart-open t)
;;use f2 to open neotree-toggle
(global-set-key [f2] 'neotree-toggle)
(provide 'init-neotree)
