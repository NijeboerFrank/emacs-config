(use-package treemacs
  :after (evil-leader)
  :ensure t
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (evil-leader/set-key "e" 'treemacs))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(provide 'tree)
;;; tree.el ends here
