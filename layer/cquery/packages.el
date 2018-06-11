;;; packages.el --- cquery layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: 刘保证 <iromise@Freedom>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `cquery-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `cquery/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `cquery/pre-init-PACKAGE' and/or
;;   `cquery/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst cquery-packages
  '(
    (cquery :requires lsp-mode)
    ))

;; See also https://github.com/cquery-project/cquery/wiki/Emacs
(defun cquery/init-cquery ()
  (use-package cquery
    :commands lsp-cquery-enable
    :init (add-hook 'c-mode-common-hook #'cquery//enable)
    :config
    ;; overlay is slow
    ;; Use https://github.com/emacs-mirror/emacs/commits/feature/noverlay
    (setq cquery-sem-highlight-method 'font-lock)
    (cquery-use-default-rainbow-sem-highlight)
    (setq cquery-extra-init-params
          '(:cacheFormat "msgpack" :completion (:detailedLabel t) :xref (:container t)
                         :diagnostics (:frequencyMs 5000)))
    )
    (spacemacs|add-company-backends :backends company-lsp :modes c-mode-common)
  )

;; (defun cquery/init-company-lsp ()
;;   (use-package company-lsp
;;     :defer t
;;     :commands (company-lsp)
;;     :init
;;     (setq
;;      company-transformers nil
;;      company-lsp-async t
;;      company-lsp-cache-candidates nil
;;      )
;;     )
  
;;   )
