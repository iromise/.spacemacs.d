(require-package 'flycheck)
(require 'flycheck)
(add-hook 'after-init-hook  #'global-flycheck-mode)

;;----------------------------------------------------------------------------
;; Show flycheck error by popupo.
;;----------------------------------------------------------------------------
(require-package 'flycheck-tip)
(flycheck-tip-use-timer 'verbose)


(provide 'init-flycheck)
