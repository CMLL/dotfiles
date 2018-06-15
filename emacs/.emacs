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

;; Disable Tool bar
(tool-bar-mode 0)


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
    "rt" 'counsel-imenu
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
  (setq company-idle-delay 0.01)
  (setq company-minimum-prefix-length 3)
  :bind
  ("C-SPC" . 'company-complete-common))


;; LSP
(use-package lsp-mode
  :ensure t
  :config
  ;; LSP something tries to look into locks, disable them
  (setq create-lockfiles nil)
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  (lsp-define-stdio-client lsp-python
			   "python"
			   (lambda () default-directory)
			   '("pyls"))
  (add-hook 'python-mode-hook
	    #'lsp-python-enable))


;; Company LSP
(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))


;; Elpy
;; (use-package elpy
;;   :ensure t
;;   :config
;;   (elpy-enable)
;;   (add-to-list 'company-backends 'elpy-company-backend))


;; Doom theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (add-hook 'python-mode-hook 'flycheck-mode)
  (setq
   flycheck-highlighting-mode 'lines
   flycheck-check-syntax-automatically '(mode-enabled save)))

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
 '(package-selected-packages
   (quote
    (yasnippet-snippets which-key web-mode use-package treemacs-projectile treemacs-evil spaceline ripgrep pyvenv package-safe-delete evil-magit evil-leader eglot doom-themes counsel-projectile company)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 113 :width normal)))))
