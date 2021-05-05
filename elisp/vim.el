;; Evil leader. I set this to <SPC>
(use-package evil-leader
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "<SPC>"))


;; Vim emulation, without this I wouldn't be able to use emacs
(use-package evil
  :ensure t
  :after (undo-tree evil-leader)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree)
  (setq evil-want-C-g-bindings t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-u-delete t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-want-abbrev-expand-on-insert-exit nil)
  (setq evil-respect-visual-line-mode t))

;; Enable ESC and jk to exit insert mode and other stuff
(use-package evil-escape
  :init
  (setq evil-escape-excluded-states '(normal visual multiedit emacs motion)
        evil-escape-excluded-major-modes '(neotree-mode treemacs-mode vterm-mode)
        evil-escape-key-sequence "jk"
        evil-escape-delay 0.15)
  (evil-define-key* '(insert replace visual operator) 'global "\C-g" #'evil-escape)
  :config
  (evil-escape-mode +1))

;; Enable evil bindings in other modes
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Expose this package
(provide 'vim)
