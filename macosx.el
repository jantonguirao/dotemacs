;;osx keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'alt)

; Key modifiers for Mac OS X Emacs.app in spanish MBP keyboard
(global-set-key (kbd "A-1") "|")
(global-set-key (kbd "A-2") "@")
(global-set-key (kbd "A-3") "#")
(global-set-key (kbd "A-º") "\\")
(global-set-key (kbd "A-ç") "}")
(global-set-key (kbd "A-+") "]")

(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'none))
