(setq-default indent-tabs-mode nil)

(setq c-default-style "bsd"
      c-basic-offset 4)

(global-set-key [f1] 'shell)
(global-set-key [f7] 'compile)

;; Automatic ident
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; (global-set-key [f9] 'iwb)

;; Trailing whitespace is unnecessary
(defvar whitespace-cleanup-on-save t)
;; (setq whitespace-cleanup-on-save nil)
(add-hook 'before-save-hook
          (lambda ()
            (if whitespace-cleanup-on-save (whitespace-cleanup))))

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Line-wrapping
(set-default 'fill-column 78)

;; Gotta see matching parens
(show-paren-mode t)

;; Font 18pt
(set-face-attribute 'default nil :height 180)

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; Make sure all backup files only live in one place
;; (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Matchink pairs
(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)

;; Kill backward word
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Kill the UI
;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Extended commands
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; IDO mode for better find file
(ido-mode 1)
