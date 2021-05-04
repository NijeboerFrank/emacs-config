(use-package magit
  :bind (("C-M-g" . magit-status)))

(use-package projectile
  :diminish projectile-mode
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-global-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-project-search-path '("~/workspace/development/"))
  (setq projectile-switch-project-action #'projectile-dired))

;; Combine projectile with counsel
(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-mode))

(provide 'projects)
