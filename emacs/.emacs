;;; package --- Summary
;;; Commentary:
(require 'package)

;;; Code:
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

;; Installing default packages
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed.  Packages."
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

;; Bootstrap use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Install my packages
(ensure-package-installed
 'magit
 'projectile
 'flycheck
 'ivy
 'swiper
 'counsel
 'ace-window
 'counsel-projectile
 'ranger
 'web-mode
 'pyvenv
 ;; 'elpy
 'package-safe-delete
 'prodigy
 'logview
 'company
 'evil
 'evil-magit
 'evil-nerd-commenter
 'org-evil
 'evil-matchit
 'evil-leader
 'vlf
 'pytest
 'spaceline
 'ripgrep
 'doom-themes
 'php-mode
 )
(package-initialize)

;; Tool bar
(tool-bar-mode -1)

;; Scroll bar
(scroll-bar-mode -1)

;; Evil Leader
(global-evil-leader-mode)

;; Evil mode
(require 'evil)
(evil-mode 1)

;; Evil Magit
(use-package evil-magit)

;; ;; ;; Elpy
;; (use-package elpy
;;   :ensure t
;;   :config
;;   (elpy-enable)
;;   (remove-hook 'elpy-modules 'elpy-module-flymake)
;;   (remove-hook 'elpy-modules 'elpy-module-highlight-indentation)
;;   )

;; Electric Pair
(electric-pair-mode)

;; Vlf
(use-package vlf)

;; Yasnippet
(yas-global-mode)

;; Ivy configuration
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Company-mode
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "C-.") 'company-complete)
  )

;; Load projectile globally
(projectile-mode)
(setq projectile-completion-system 'ivy)

;; Display line numbers
(global-linum-mode 0)
(line-number-mode 0)

;; Color theme
(load-theme 'railscasts t)

;; Autoload js mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$". web-mode))
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-indentation t)
(setq web-mode-enable-auto-expanding t)

;; Ibuffer
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; Flycheck
(global-flycheck-mode)

;; Ripgrep
(use-package ripgrep)

;; Evil Commenter
(evilnc-default-hotkeys)

;; Org Evil
(use-package org-evil)

;; Spaceline
;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)

;; Pytest
(use-package pytest)
(setq pytest-cmd-flags "")

;; Php Mode
(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Vue
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))

;;====================================================
;; Define only keybinds remaps from this point onwards.
;;====================================================

;; Evil Leader
(evil-leader/set-key
  "f" 'counsel-projectile
  "b" 'ivy-switch-buffer
  "p" 'projectile-switch-project
  "w" 'ace-window
  "x" 'ace-delete-window
  "g" 'magit-status
  "e" 'ranger
  "i" 'ripgrep-regexp
  "s" 'prodigy
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator
  "t" 'pytest-module
  "T" 'pytest-directory
  )

;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Ivy keybinds
(global-set-key (kbd "\C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-b") 'ivy-switch-buffer)
(global-set-key (kbd "M-f") 'counsel-projectile)
(global-set-key (kbd "M-p") 'projectile-switch-project)

;; Ace window
(global-set-key (kbd "M-j") 'split-window-vertically)
(global-set-key (kbd "M-h") 'split-window-horizontally)
(global-set-key (kbd "M-w") 'ace-window)

;; ;; ;; Elpy Keybinds
;; (global-set-key (kbd "M-d") 'elpy-goto-definition-other-window)

;; Remap virtualenv loading
(define-key global-map (kbd "M-v") 'pyvenv-workon)

;; Set keybinding for magit status
(define-key global-map (kbd "M-g") 'magit-status)

;; Change projectile dired access
(global-set-key (kbd "M-e") 'projectile-dired)

;; Search Expr
(global-set-key (kbd "M-i") 'ripgrep-regexp)

;; Prodigy Keybinds
(define-key evil-normal-state-map (kbd "M-s") 'prodigy)
(add-to-list 'evil-emacs-state-modes 'prodigy-mode)

;; Evil Commnenter
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; PyTest
(define-key evil-normal-state-map (kbd "M-t") 'pytest-module)
(define-key evil-normal-state-map (kbd "M-T") 'pytest-directory)

;; Ctags
(setq path-to-ctags "/usr/bin/ctags-exuberant")
(defun create-tags (dir-name)
  "Create tags file"
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e --force-language=Python -R %s" path-to-ctags (directory-file-name dir-name)))
  )


;;====================================================
;; define only prodigy service from this point onwards.
;;====================================================

(setq pythonpath '(("PYTHONPATH" "/home/cllamach/Panopta/classic/src/")))

;; Prodigy Services Configuration
(prodigy-define-service
  :name "Controlpanel"
  :command "python"
  :args '("start-ControlPanel.py" "controlpanel.cfg")
  :cwd "/home/cllamach/Panopta/classic/src/controlpanel"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "controlpanel"))
  )

(prodigy-define-service
  :name "CP uWSGI"
  :command "uwsgi"
  :args '("--http-socket" ":8000" "-w" "cpwsgi" "--buffer-size" "65535")
  :cwd "/home/cllamach/Panopta/classic/src/controlpanel"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "controlpanel"))
  )

(prodigy-define-service
  :name "WidgetEngine"
  :command "python"
  :args '("WidgetEngine.py" "-c" "widgets_engine.cfg")
  :cwd "/home/cllamach/Panopta/classic/src/dashboards_v2/widgets_handler"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "widget_engine"))
  )

(prodigy-define-service
  :name "DisplayEngine"
  :command "python"
  :args '("DisplayEngine.py" "-c" "display_engine.cfg")
  :cwd "/home/cllamach/Panopta/classic/src/dashboards_v2/dashboard_piper"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "display_engine"))
  )

(prodigy-define-service
  :name "ResultHarvester"
  :command "python"
  :args '("ResultHarvester.py" "-c" "harvester.conf")
  :cwd "/home/cllamach/Panopta/classic/src/resultharvester"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "controlpanel"))
  )

(prodigy-define-service
  :name "Checker"
  :command "python"
  :args '("Checker.py" "-c" "checker.conf")
  :cwd "/home/cllamach/Panopta/classic/src/checker"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "checker279"))
  )
(prodigy-define-service
  :name "Checker1"
  :command "python"
  :args '("Checker.py" "-c" "checker_1.conf")
  :cwd "/home/cllamach/Panopta/classic/src/checker"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "checker279"))
  )
(prodigy-define-service
  :name "Checker2"
  :command "python"
  :args '("Checker.py" "-c" "checker_2.conf")
  :cwd "/home/cllamach/Panopta/classic/src/checker"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "checker279"))
  )
(prodigy-define-service
  :name "Checker3"
  :command "python"
  :args '("Checker.py" "-c" "checker_3.conf")
  :cwd "/home/cllamach/Panopta/classic/src/checker"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "checker279"))
  )

(prodigy-define-service
  :name "NotifyEngine"
  :command "python"
  :args '("NotifyEngine.py" "-c" "notifyengine2.conf")
  :cwd "/home/cllamach/Panopta/classic/src/notifyengine2"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "notify-env")))

(prodigy-define-service
  :name "Aggregator"
  :command "python"
  :args '("aggregator.py" "-c" "aggregator_config.py")
  :cwd "/home/cllamach/Panopta/classic/src/aggregator"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "aggregator-env")))

(prodigy-define-service
  :name "JS Compile Watcher"
  :command "watchify"
  :args '("-vde" "src/assets/scripts/main.js" "-o" "/home/cllamach/Panopta/classic/src/controlpanel/ControlPanel/static/assets/newux/scripts/app.js")
  :cwd "/home/cllamach/Panopta/classic/src/controlpanel/ControlPanel/static/ui-components"
  :stop-signal 'sigkill)

(prodigy-define-service
  :name "Python Dev Agent"
  :command "python"
  :args '("run_agent.py")
  :cwd "/home/cllamach/Panopta/agent/src/linux"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "agent")))

(prodigy-define-service
  :name "Status Pages"
  :command "python"
  :args '("application.py")
  :cwd "/home/cllamach/Panopta/classic/src/reports"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "aggregator-env")))

(prodigy-define-service
  :name "Sync engine"
  :command "python"
  :args '("SyncEngine.py" "-c" "sync.cfg")
  :cwd "/home/cllamach/Panopta/appliance/src/sync/"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "appliance")))

(prodigy-define-service
  :name "Discovert Engine"
  :command "python"
  :args '("DiscoveryEngine.py" "-c" "discovery.cfg")
  :cwd "/home/cllamach/Panopta/appliance/src/discovery/"
  :stop-signal 'sigkill
  :env pythonpath
  :init (lambda () (pyvenv-workon "appliance")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(electric-pair-mode t)
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (doom-themes company-jedi vue-mode evil-leader pytest org-evil evil-matchit spaceline evil-nerd-commenter vlf ripgrep use-package logview prodigy package-safe-delete pyvenv web-mode ranger counsel-projectile ace-window counsel swiper ivy flycheck evil-magit projectile evil magit)))
 '(show-paren-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.

 ;; If there is more than one, they won't work right.
 )
