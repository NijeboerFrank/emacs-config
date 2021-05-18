(use-package term
  :config
  (setq explicit-shell-file-name "zsh"))


(use-package vterm
  :commands vterm
  :init
  (setq vterm-keymap-exceptions
	'("C-c" "C-x" "C-u" "C-g" "C-h" "C-l" "C-M-j" "M-x" "M-o" "C-v" "M-v" "C-y" "M-y"))
  :config
  (setq vterm-max-scrollback 10000))


(provide 'terminal)
