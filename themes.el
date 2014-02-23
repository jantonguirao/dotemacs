
(add-to-list 'custom-theme-load-path "~/.emacs.d/dotemacs/themes")

;; marmalade
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(load-theme 'solarized-dark t)
