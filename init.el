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

;; Completion stuff
(require 'completion)
