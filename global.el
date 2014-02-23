(setq-default indent-tabs-mode nil)

(setq c-default-style "bsd"
          c-basic-offset 4)

(global-set-key [f1] 'shell)
(global-set-key [f7] 'compile)

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
;(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
