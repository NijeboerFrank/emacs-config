;; Best github package ever
(use-package magit
  :init
  (evil-leader/set-key "g" 'magit-status))

;; Manage projects
(use-package projectile
  :diminish projectile-mode
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-global-mode)
  :init
  (setq projectile-project-search-path '("~/workspace/development/"))
  (setq projectile-switch-project-action #'projectile-dired)
  (evil-leader/set-key "p" 'projectile-command-map))


;; Combine projectile with counsel
(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-mode))

;; Expose this file
(provide 'projects)
