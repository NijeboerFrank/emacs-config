;; User name and email
(setq user-full-name "NijeboerFrank"
      user-mail-address "frank.nijeboer@gmail.com")

;; Disable audible beep
(setq visible-bell 1)

;; Set default font size
(defvar nijemacs/default-font-size 140)
(set-face-attribute 'default nil :height nijemacs/default-font-size)

;; Custom file
(defvar nijemacs/custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Package repositories
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)

;; Refresh packages
(package-initialize)

;; Refresh packages
(when (not package-archive-contents)
  (package-refresh-contents))


(defun install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))


;; Emacs customizations
(setq custom-file                        nijemacs/custom-file
      make-backup-files                  nil
      display-line-numbers-type          'relative
      ; inhibit-startup-message            t
      use-package-always-ensure          t)

;; Keep buffers automatically up to date
(global-auto-revert-mode t)

;; Display line number
(global-display-line-numbers-mode 1)
(global-hl-line-mode +1)
(line-number-mode +1)
(column-number-mode t)
(size-indication-mode t)

;; Show matching parentheses
(show-paren-mode 1)

;; Need to load custom file to avoid being overwritten
;; more at https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
(if (file-exists-p nijemacs/custom-file)
  (load custom-file))

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Enable loading larger files
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

;; Remove unneccesary stuff such as tool bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

;; Don't use the default start screen
;; Start with scratch buffer instead
(setq inhibit-startup-screen t)

;; Install undo tree
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(provide 'base)
