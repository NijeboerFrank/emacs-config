(use-package evil
  :after (undo-tree)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree)
  (setq evil-want-C-g-bindings t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-u-delete t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-want-abbrev-expand-on-insert-exit nil)
  (setq evil-respect-visual-line-mode t))


(use-package evil-escape
  :init
  (setq evil-escape-excluded-states '(normal visual multiedit emacs motion)
        evil-escape-excluded-major-modes '(neotree-mode treemacs-mode vterm-mode)
        evil-escape-key-sequence "jk"
        evil-escape-delay 0.15)
  (evil-define-key* '(insert replace visual operator) 'global "\C-g" #'evil-escape)
  :config
  (evil-escape-mode +1))

(use-package evil-leader)

(provide 'vim)
