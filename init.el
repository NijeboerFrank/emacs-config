;; Load the 'elisp' directory
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

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

;; LSP
(require 'lang)
;;; init.el ends here
