;; (use-package nord-theme
;;   :defer t
;;   :init
;;   (load-theme 'nord t))

(use-package doom-themes
  :config
  (load-theme 'doom-nord t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config))


(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15))
  :config
  (display-time-mode 1)
  (setq display-time-24hr-format t)
  (display-battery-mode 1))



(provide 'theme)
