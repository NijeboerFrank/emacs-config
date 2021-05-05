;; (use-package nord-theme
;;   :defer t
;;   :init
;;   (load-theme 'nord t))

(use-package doom-themes
  :config
  (load-theme 'doom-nord t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(provide 'theme)
