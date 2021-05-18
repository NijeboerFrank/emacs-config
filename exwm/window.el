
(defun nijemacs/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun nijemacs/exwm-init-hook ()
  ;; Make workspace 1 be the one where we land at startup
  (exwm-workspace-switch-create 1))

(use-package exwm
  :config

  ;; Set the number of workspaces
  (setq exwm-workspace-number 8)

  ;; When window "class" updates, use it to set the buffer name
  (add-hook 'exwm-update-class-hook #'nijemacs/exwm-update-class)

  ;; Call C-q to use the next input as a 'regular' keystroke
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; When EXWM starts up, do some extra confifuration
  (add-hook 'exwm-init-hook #'nijemacs/exwm-init-hook)

  ;; Move windows automatically based on the program
  (defun nijemacs/configure-window-by-class ()
    (interactive)
    (pcase exwm-class-name
      ("firefox" (exwm-workspace-move-window 2))
      ("Sol" (exwm-workspace-move-window 3))
      ("mpv" (exwm-floating-toggle-floating)
       (exwm-layout-toggle-mode-line))))

  ;; Configure windows as they're created
  (add-hook 'exwm-manage-finish-hook #'nijemacs/configure-window-by-class)

  ;; These keys should always pass through to Emacs
  (setq exwm-input-prefix-keys
    '(?\C-x
      ?\C-u
      ?\C-h
      ?\M-x
      ?\M-`
      ?\M-&
      ?\M-:
      ?\C-\M-j  ;; Buffer list
      ?\C-\ ))  ;; Ctrl+Space

  ;; Set up global key bindings.  These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.
  (setq exwm-input-global-keys
        `(
          ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
          ([?\s-r] . exwm-reset)

          ;; Move between windows
          ([?\s-h] . windmove-left)
          ([?\s-l] . windmove-right)
          ([?\s-k] . windmove-up)
          ([?\s-j] . windmove-down)

          ;; Launch applications via shell command
          ([?\s-p] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))

          ;; Switch workspace
          ([?\s-w] . exwm-workspace-switch)
          ([?\s-`] . (lambda () (interactive) (exwm-workspace-switch-create 0)))



          ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9))))

  (exwm-enable))


(provide 'window)
