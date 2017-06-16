(require 'package)

(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

;; Installing default packages
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
	 nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
       (package-install package)
       package)))
  packages))

;; Make sure to have downloaded archive description
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Install my packages
(ensure-package-installed
 'magit
 'evil
 'projectile
 'railscasts-theme
 'evil-magit
 'flycheck
 'ivy
 'swiper
 'counsel
 'ace-window
 'counsel-projectile
 'vlf
 'ranger
 'web-mode
 'pyvenv
 'elpy
 'package-safe-delete
 )
(package-initialize)

;; Load Evil-Mode by default
(require 'evil)
(evil-mode t)

;; Load evil-magit
(evil-magit-init)

;; Load helm by default
;; (require 'helm-config)
;; (helm-mode t)

;; Helm configuration
;; (require 'helm-config)
;; (require 'helm-misc)
;; (require 'helm-projectile)
;; (require 'helm-locate)
;; (setq helm-quick-update t)
;; (setq helm-bookmark-show-location t)
;; (setq helm-buffers-fuzzy-matching t)


;; (defun helm-all ()
;;   (interactive)
;;   (let ((helm-ff-transformer-show-only-basename nil))
;;     (helm-other-buffer '(helm-source-projectile-files-list
;; 			 helm-source-recentf
;; 		         helm-source-projectile-projects)
;; 		       "*helm-all*")))

;; Elpy
(package-initialize)
(elpy-enable)
(remove-hook 'elpy-modules 'elpy-module-flymake)

;; Ace window
(global-set-key (kbd "M-j") 'split-window-vertically)
(global-set-key (kbd "M-h") 'split-window-horizontally)
(global-set-key (kbd "M-w") 'ace-window)

;; Vlf
(require 'vlf-setup)

;; Ivy configuration
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Search Expr
(global-set-key (kbd "M-i") 'ripgrep-regexp)


;; Company-mode
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "<C-tab>") 'company-complete)

;; Load projectile globally
(projectile-global-mode)

;; Load auto bracket
(electric-pair-mode)

;; Display line numbers
(global-linum-mode 0)
(line-number-mode 0)

;; Color theme
(load-theme 'railscasts t)

;; Autoload js mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

;; Web Mode
(add-hook 'html-mode-hook 'web-mode)

;; Full ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)

;; Ibuffer
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; Flycheck
(global-flycheck-mode)

;;====================================================
;; Define only keybinds remaps from this point onwards.
;;====================================================

;; Ivy keybinds
(global-set-key (kbd "\C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-b") 'ivy-switch-buffer)
(global-set-key (kbd "M-p") 'counsel-projectile)
(global-set-key (kbd "M-f") 'counsel-find-file)

;; Better window navigation
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
     ))

;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)

;; Elpy Keybinds
(global-set-key (kbd "M-d") 'elpy-goto-definition-other-window)

;; Remap virtualenv loading
(define-key global-map (kbd "M-v") 'pyvenv-workon)

;; Set keybinding for magit status
(define-key global-map (kbd "M-g") 'magit-status)

;; Change projectile dired access
(global-set-key (kbd "M-e") 'projectile-dired)

;; Ranger
(global-set-key (kbd "M-r") 'ranger)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(line-number-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
