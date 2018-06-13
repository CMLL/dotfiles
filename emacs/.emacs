;; Package init
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Evil
(use-package evil
  :ensure t
  :init
  (global-evil-leader-mode)
  :config
  (evil-mode 1))

;; Evil Leader
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    ;; Files
    "bf" 'counsel-find-file
    "br" 'counsel-recentf
    "bd" 'dired
    "bb" 'ivy-switch-buffer
    "bt" 'treemacs
    ;; Projectile
    "pp" 'projectile-switch-project
    "pf" 'counsel-projectile
    ;; Windows
    "ww" 'ace-window
    "wx" 'ace-delete-window
    "ws" 'split-window-below
    "wh" 'split-window-horizontally
    ;; Git
    "gs" 'magit-status
    "gb" 'magit-blame
    ;; Search
    "rr" 'ripgrep-regexp
    "rs" 'swiper
    ;; Comment
    "ci" 'evilnc-comment-or-uncomment-lines
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cc" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line
    ;; Virtualenv
    "vw" 'pyvenv-workon
    "va" 'pyvenv-activate
    ;; Code
    ".d" 'xref-find-definitions
    ".r" 'xref-find-references
    ))

;; Magit
(use-package magit
  :ensure t)

;; Evil-Magit
(use-package evil-magit
  :ensure t)

;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy
	projectie-switch-project-action #'projectile-commander
	projectile-mode-line
	'(:eval (format " Projectile[%s]"
			(projectile-project-name)))))

;; Counsel Projectile
(use-package counsel-projectile
  :ensure t)

;; Ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t))

;; Swiper
(use-package swiper
  :ensure t)

;; Counsel
(use-package counsel
  :ensure t)

;; Ace Window
(use-package ace-window

  :ensure t
  :bind
  ("M-w" . ace-window))

;; Ripgrep
(use-package ripgrep
  :ensure t)

;; Company
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0.5)
  (setq company-minimum-prefix-length 3)
  :bind
  ("C-SPC" . 'company-complete-common))


;; LSP
;; (use-package lsp-mode
;;   :ensure t
;;   :config
;;   (require 'lsp-imenu)
;;   (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
;;   (lsp-define-stdio-client lsp-python "python"
;; 			   #'projectile-project-root
;; 			   '("pyls"))
;;   (add-hook 'python-mode-hook
;; 	    (lambda ()
;; 	      (lsp-python-enable))))

;; LSP UI is pretty slow
;; ;; LSP UI
;; (use-package lsp-ui
;; 	     :ensure t
;; 	     :config
;; 	     (setq ls-ui-sideline-ignore-duplicate t)
;; 	     (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; Company LSP
;; (use-package company-lsp
;;   :ensure t
;;   :config
;;   (push 'company-lsp company-backends))

(use-package eglot
  :ensure t
  :config
  (add-hook 'python-mode-hook 'eglot))

;; Doom theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(mode-enabled save)))

;; Which key
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0)
  (which-key-declare-prefixes "SPC b" "Files")
  (which-key-declare-prefixes "SPC g" "Git")
  (which-key-declare-prefixes "SPC p" "Project")
  (which-key-declare-prefixes "SPC r" "Search")
  (which-key-declare-prefixes "SPC c" "Comment")
  (which-key-declare-prefixes "SPC w" "Windows"))

;; Pyvenv
(use-package pyvenv
  :ensure t)

;; Spaceline
(use-package spaceline
  :ensure t
  :config
  (spaceline-spacemacs-theme))

;; Safe delete
(use-package package-safe-delete
  :ensure t)

;; Yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))
(use-package yasnippet-snippets
  :ensure t)

;; Web-Mode
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-file-event-delay           5000
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-no-png-images              nil
          treemacs-project-follow-cleanup     nil
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      35)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))
(use-package treemacs-evil
  :after treemacs evil
  :ensure t)
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Savehist
(setq history-length 100)
(put 'minibuffer-history 'history-length 50)
(put 'evil-ex-history 'history-length 50)
(put 'kill-ring 'history-length 25)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-company-mode t)
 '(package-selected-packages
   (quote
    (web-mode yasnippet-snippets treemacs-projectile treemacs-evil treemacs spaceline-all-the-icons spaceline pyvenv dired counsel-projectile which-key doom-themes company ripgrep counsel swiper use-package ivy evil-nerd-commenter evil-magit evil-leader)))
 '(savehist-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 97 :width normal)))))
