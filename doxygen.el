;;-------------------------------------------------------------------
;; C/C++ programming
;;-------------------------------------------------------------------
;; insert a nice doxygen function documentation block
(setq user-mail-address "j.anton.guirao@gmail.com")

(defun dg-insert-function-header ()
  (interactive)
  (insert "/*!\n"
          " * \@brief \n"
          " *\n"
          " * \@author " user-mail-address "\n"
          " * \@date " (format-time-string "%m/%d/%Y") "\n"
          " */\n")
  (search-backward "brief")
  (end-of-line))

;; insert a nice doxygen class documentation block
(defun dg-insert-class-header (class-name)
  "Prompts for the name of a new class, then writes suitable Doxygen markup
for the class documentation and inserts lines for the ctor/dtor pair."
  (interactive "sClass Name: ")
  (insert "/*!\n"
          " * \@class " class-name "\n"
          " * \@brief \n"
          " *\n"
          " * \@author " user-mail-address "\n"
          " * \@date " (format-time-string "%m/%d/%Y") "\n"
          " */\n"
          "class " class-name "\n"
          "{\n"
          "public:\n"
          "    " class-name "();\n"
          "    virtual ~" class-name "();\n\n"
          "protected:\n"
          "private:\n"
          "};\n")
  (search-backward "brief")
  (end-of-line))

;; pick out what kind of file we're dealing with and insert an appropriate
;; header block
(defun dg-insert-file-header ()
  "Checks the buffer name to get the filename; If extension is {h,hpp}, inserts
include guards and other header file information.  If extension is {c,cpp,cc},
it only includes basic header information"
  (interactive)
  (let* ((filename (buffer-name))
         (basename (file-name-sans-extension filename))
         (extension (file-name-extension filename)))
    (goto-char (point-min))
    (cond
     ((or (string= extension "h")
          (string= extension "hpp"))
      (dg-insert-header-file-header basename extension))
     ((or (string= extension "cpp")
          (string= extension "cc")
          (string= extension "c++")
          (string= extension "c"))
      (dg-insert-cpp-file-header basename)))))

;; insert a nice doxygen file documentation block and preprocessor template
(defun dg-insert-header-file-header (basename extension)
  (interactive)
  (insert "#ifndef _" (upcase basename) "_" (upcase extension) "_\n"
          "#define _" (upcase basename) "_" (upcase extension) "_\n\n"
          "/*!\n"
          " * \@file " (file-name-nondirectory (buffer-file-name)) "\n"
          " *\n"
          " * \@author " user-mail-address "\n"
          " * \@date " (format-time-string "%m/%d/%Y") "\n"
          " */\n")
  (goto-char (point-max))
  (move-beginning-of-line nil)
  (insert "\n#endif\n")
  (move-beginning-of-line -1))

;; insert a nice doxygen file documentation block
(defun dg-insert-cpp-file-header (basename)
  (interactive)
  (insert "/*!\n"
          " * \@file " (file-name-nondirectory (buffer-file-name)) "\n"
          " *\n"
          " * \@author " user-mail-address "\n"
          " * \@date " (format-time-string "%m/%d/%Y") "\n"
          " */\n"))

;; add useful behaviour to c-mode
;;(add-hook 'c-mode-hook
;;          (lambda ()
;;            (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)))

;; add useful behaviour to c++-mode
;;(add-hook 'c++-mode-hook
;;          (lambda ()
;;            (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
;;            (define-key c++-mode-map "\C-c\C-d" 'dg-insert-file-header)
;;            (define-key c++-mode-map "\C-c\C-f" 'dg-insert-function-header)
;;            (define-key c++-mode-map "\C-c\C-c" 'dg-insert-class-header)))
