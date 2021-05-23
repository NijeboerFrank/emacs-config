;; General org mode setup
(defun nijemacs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))
;; Font stuff
(defun nijemacs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

  ;; Font size and variable pitched font
  (let* ((variable-tuple
          (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.05))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.10))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.25))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))))

(use-package org
  :hook (org-mode . nijemacs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
	org-hide-emphasis-markers t)

  ;; (setq org-agenda-start-with-log-mode t)
  ;; (setq org-log-done 'time)
  ;; (setq org-log-into-drawer t)
  (setq org-capture-templates '(("t" "Todo [inbox]" entry
				 (file+headline "~/Dropbox/GTD/inbox.org" "Tasks")
				 "* TODO %i%?")
				("T" "Tickler" entry
				 (file+headline "~/Dropbox/GTD/tickler.org" "Tickler")
				 "* %i%? \n %U")))

  (setq org-refile-targets '(("~/Dropbox/GTD/gtd.org" :maxlevel . 3)
                             ("~/Dropbox/GTD/someday.org" :level . 1)
                             ("~/Dropbox/GTD/tickler.org" :maxlevel . 2)))

  ;; Quick tags list
  (setq org-tag-alist
      '((:startgroup)
       ; Put mutually exclusive tags here
	(:endgroup)
	("@errand" . ?E)
	("@home" . ?H)
	("@work" . ?W)
	("@travel" . ?T)))

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  ;; Setup agenda files
  (setq org-agenda-files
	'("~/Dropbox/GTD"))

  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  (nijemacs/org-font-setup))


(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; We need this to use the source code blocks
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)))

(push '("conf-unix" . conf-unix) org-src-lang-modes)

;; Stuff for quickly writing org code blocks

;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(provide 'notes)
