;; flycheck syntax checker
(use-package flycheck
  :init (global-flycheck-mode))

;; LSP
(use-package lsp-mode
  :commands (lsp lsp-deferred lsp-install-server)
  :config
  (evil-leader/set-key "l" lsp-command-map)
  (lsp-enable-which-key-integration t))


(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;;Optional - provides snippet support.

;; (use-package yasnippet
;;   :commands yas-minor-mode
;;   :hook (
;;          (go-mode . yas-minor-mode)
;;          (python-mode . yas-minor-mode)
;;          ))

(setq lsp-ui-doc-enable t
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)

;; DAP
;; (use-package dap-mode
;;   ;; Uncomment the config below if you want all UI panes to be hidden by default!
;;   ;; :custom
;;   ;; (lsp-enable-dap-auto-configure nil)
;;   ;; :config
;;   ;; (dap-ui-mode 1)
;;   :commands dap-debug
;;   :config
;;   ;; Set up Node debugging
;;   (require 'dap-node)
;;   (dap-node-setup) ;; Automatically installs Node debug adapter if needed
;;   (require 'dap-go)
;;   (dap-go-setup)
;;   (require 'dap-hydra)
;;   (require 'dap-gdb-lldb)
;;   (dap-gdb-lldb-setup)

;;   ;; Bind `C-c l d` to `dap-hydra` for easy access
;;   (general-define-key
;;     :keymaps 'lsp-mode-map
;;     :prefix lsp-keymap-prefix
;;     "d" '(dap-hydra t :wk "debugger")))


;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; Import all other languages and lsp stuff here
(require 'lang-json)
(require 'lang-python)
(require 'lang-yaml)
(require 'lang-go)

;; base lang
(provide 'lang)
