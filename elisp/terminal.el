(use-package term
  :config
  (setq explicit-shell-file-name "zsh"))


(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))


(provide 'terminal)
