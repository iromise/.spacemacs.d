;;---------------------------------------------------------------------------------
;; Personal Configuration for Python 
;;---------------------------------------------------------------------------------

;;(when (executable-find "ipython") ; if there is ipython then use it.
;;    (elpy-use-ipython))

;;(require-package 'py-autopep8)     		;check py-autopep8, if not exist, then install
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-python)
