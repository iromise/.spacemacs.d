(require-package 'company)
(require-package 'company-ghc)


(global-company-mode t)    ;;open the gobal company mode to complete anything

(setq company-idle-delay 0.07              ; delay the menu
      company-minimum-prefix-length 2     ; when you input 2 character, company begin to complete
      company-require-match nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
      company-show-numbers t              ;显示序号
      company-transformers '(company-sort-by-backend-importance)
      company-continue-commands '(not helm-dabbrev)
      )


;; sort the choice by frequency
(setq company-transformers '(company-sort-by-occurrence))



; Use anaconda as python backend compelte
(require-package 'company-anaconda)
(add-to-list 'company-backends '(company-anaconda :with company-yasnippet))

;(require 'company-files)
;(add-to-list 'company-backends company-files)



;;(defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

;;(defun company-mode/backend-with-yas (backend)
;;  (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend) ) )
;;  backend
;;(append (if (consp backend) backend (list backend))
;;        '(:with company-yasnippet))))

;;(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))




(provide 'init-company)
