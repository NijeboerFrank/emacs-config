;; I used this before. Keep it for reference
;; (use-package ivy
;;   :bind
;;   ("C-x s" . swiper)
;;   ("C-x C-r" . ivy-resume)
;;   :config
;;   (ivy-mode 1)
;;   (setq ivy-use-virtual-buffers nil)
;;   (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;;   (setq ivy-re-builders-alist
;;       '((swiper . regexp-quote)
;;         (t      . ivy--regex-fuzzy))))

;; ;; Install flx to help with fuzzy stuff
;; (use-package flx)

;; (use-package counsel
;;   :bind
;;   ("M-x" . counsel-M-x)
;;   ("C-x C-m" . counsel-M-x)
;;   ("C-x C-f" . counsel-find-file)
;;   ("C-x c k" . counsel-yank-pop))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (setq ivy-re-builders-alist
	'((t . ivy--regex-fuzzy)))
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1))

;; Install flx to help with fuzzy stuff
(use-package flx)

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(provide 'completion)
