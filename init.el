;; Load the 'elisp' directory
(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(add-to-list 'load-path (concat user-emacs-directory "exwm"))

;; Base settings
(require 'base)

;; Theme
(require 'theme)

;; Vim keybindings (evil mode)
(require 'vim)

;; Project management
(require 'projects)

;; Tree
(require 'tree)

;; Completion stuff
(require 'completion)

;; Org mode
(require 'notes)

;; Dired configuration
(require 'directories)

;; Terminal
(require 'terminal)

;; PDF in emacs
(require 'pdf)

;; LSP
(require 'lang)

;; Window Manager in Emacs
;; (require 'window)
;;; init.el ends here
