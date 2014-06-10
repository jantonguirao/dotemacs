(defun create-tags (dir-name)
     "Create tags file."
     (interactive "DDirectory: ")
     (eshell-command
      (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))


;for cscope
(require 'xcscope)
(setq cscope-do-not-update-database t)


(global-set-key (kbd "<f9>") 'cscope-find-global-definition)
(global-set-key (kbd "<f10>") 'cscope-find-this-symbol)
(global-set-key (kbd "<f11>") 'cscope-find-this-file)
(global-set-key (kbd "<f12>") 'cscope-find-this-text-string)

(global-set-key (kbd "M-n") 'cscope-next-symbol)
(global-set-key (kbd "M-p") 'cscope-prev-symbol)

;cscope settings end here
