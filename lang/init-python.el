;;---------------------------------------------------------------------------------
;; Personal Configuration for Python 
;;---------------------------------------------------------------------------------

(when (executable-find "ipython") ; if there is ipython then use it.
    (elpy-use-ipython))


(provide 'init-python)
