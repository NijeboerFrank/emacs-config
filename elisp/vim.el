(defun nijemacs/evil-conf ()
  (setq evil-want-C-g-bindings t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-want-abbrev-expand-on-insert-exit nil)
  (setq evil-respect-visual-line-mode t))

;; Evil leader. I set this to <SPC>
(use-package evil-leader
  :ensure t
  :init
  (nijemacs/evil-conf)
  (setq evil-want-keybinding nil)
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "oc" 'org-capture
    "oa" 'org-agenda)

  (evil-leader/set-key
    "bn" 'next-buffer
    "bp" 'previous-buffer
    "bs" 'switch-to-buffer
    "bk" 'kill-current-buffer
    "br" 'rename-buffer))



;; Vim emulation, without this I wouldn't be able to use emacs
(use-package evil
  :ensure t
  :after (undo-tree evil-leader)
  :config
  (nijemacs/evil-conf)
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line))

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

;; Vim commentary in evil mode
(use-package evil-nerd-commenter
  :config
  (evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; Expose this package
(provide 'vim)
;;; vim.el ends here
