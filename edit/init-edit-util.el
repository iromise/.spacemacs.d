


;; dimish minor mode name to save mode line space
(require-package 'diminish)

;;----------------------------------------------------------------------------
;;  Coding System
;;----------------------------------------------------------------------------
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; default to 4 visible spaces to display a tab
(setq-default tab-width 4)

;;----------------------------------------------------------------------------
;;  Move
;;----------------------------------------------------------------------------

(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key (kbd "C-a") 'prelude-move-beginning-of-line)


;;----------------------------------------------------------------------------
;;  Mark
;;----------------------------------------------------------------------------

;;   Rebind the Mark Command
;;      The defalut set mark command is C-@ or C-SPC,
;;   	the previous is hard to press(Ctrl-Shitf-2),
;;   	while the later is conflict with input method,
;;   	so I rebind withe M-SPC which will be easy.
;;      M-SPC may be conflict with the system short cut key.
(global-unset-key (kbd "C-@"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

;;----------------------------------------------------------------------------
;;  Ring
;;----------------------------------------------------------------------------

(setq global-mark-ring-max 5000     ; increase mark ring to contains 5000 entries
      mark-ring-max 5000            ; increase kill ring to contains 5000 entries
      mode-require-final-newline t  ; add a new line to the end of the file 
      )  


;;----------------------------------------------------------------------------
;;   Paste
;;----------------------------------------------------------------------------

;;----------------------------------------------------------------------------
;;   Delete
;;----------------------------------------------------------------------------


;;----------------------------------------------------------------------------
;;   Copy
;;----------------------------------------------------------------------------



;;----------------------------------------------------------------------------
;;   Kill
;;----------------------------------------------------------------------------


;;----------------------------------------------------------------------------
;;   Search
;;----------------------------------------------------------------------------


;;我们可以通过C-t加上指定字符向后查找指定字符，或者C-u C-t向前查找指定字符
(defun my-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `my-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (let ((case-fold-search nil))
    (if (eq n 1)
        (progn                            ; forward
          (search-forward (string char) nil nil n)
          (backward-char)
          (while (equal (read-key)
                        char)
            (forward-char)
            (search-forward (string char) nil nil n)
            (backward-char)))
      (progn                              ; backward
        (search-backward (string char) nil nil )
        (while (equal (read-key)
                      char)
          (search-backward (string char) nil nil )))))
  (setq unread-command-events (list last-input-event)))
(global-set-key (kbd "C-t") 'my-go-to-char)





;; some default value
(setq-default
 blink-cursor-delay 0.5
 blink-cursor-interval 0.4
 buffers-menu-max-size 20
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 scroll-step 1
 scroll-margin 3
 scroll-conservatively 10000
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
)

(tool-bar-mode 0)


;; auto-revert
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose t)

;; enable auto-pairing
(require 'init-autopair)
(diminish 'autopair-mode)

;; some personal key bindings
(global-set-key (kbd "C-c r") 'replace-string)

;; newline behavior
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

;; change yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)


;; visual line
(global-visual-line-mode t)
;; (diminish 'global-visual-line-mode)
(diminish 'visual-line-mode)

;; expand-region
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; enable uppercase and lowercase transform for region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; whole-line-or-region-mode
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

;; enable cua mode without prefix key
(cua-selection-mode t)

;; use page-break-line to handle the ^L page-breaking symbol
(require-package 'page-break-lines)
(global-page-break-lines-mode)
(diminish 'page-break-lines-mode)



;; switch-window
(require 'init-switch-window)
;; Set "C-x p" to select the previous window
(defun other-window-backward (&optional n)
  "Select the Nth previous window"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))
(global-set-key "\C-xp" 'other-window-backward)



(diminish 'undo-tree-mode)

;; outline-minor-mode
(require 'init-outl-minor)

;; use C-u C-u C-s/r to trigger the flexible search action
(require 'init-flex-isearch)

;; set some compilation shortcuts
(require 'init-compile)

(provide 'init-editing-utils)
