;;自动插入匹配的括号
;;C/C++  mode

;; (defun my-c-mode-auto-pair ()
;;   (interactive)
;;   (make-local-variable 'skeleton-pair-alist)
;;   (setq skeleton-pair-alist  '(
;;     (?{ \n > _ \n ?} >)))
;;   (setq skeleton-pair t)
;;   (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;   (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;;   (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;;   (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;   (backward-char))

;;(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
;;(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "K&R")
             (c-toggle-auto-state)
             (c-toggle-auto-hungry-state)
             (c-set-offset 'case-label '+) ;switch/case:  make each case line indent from switch
             (setq tab-width 4)
             (setq c-basic-offset 4)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (c-toggle-auto-state)
             (setq tab-width 4)
             (c-set-offset 'case-label '+) ;switch/case:  make each case line indent from switch
             (c-toggle-auto-hungry-state)))

;; indent switch
;;; set this in all c-based programming modes
(add-hook 'c-mode-common-hook
          (lambda ()
             (c-set-offset 'case-label '+)))


(provide 'init-cpp)
