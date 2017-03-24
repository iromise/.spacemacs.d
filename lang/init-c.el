;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style "linux" ; set style to "linux"
      c-basic-offset 4)


;;----------------------------------------------------------------------------
;; Complete  Configuration for company
;;----------------------------------------------------------------------------

;; note that in the configuration for company-mode above, we have to delete company-semantic,
;; otherwise company-complete will use company-semantic instead of company-clang, 
;; because it has higher precedence in company-backends. 

(setq company-backends (delete 'company-semantic company-backends))

;; This package provide auto completion for C/C++ headers using Company
(require-package 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'company-mode)


(provide 'init-c)
