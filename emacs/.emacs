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
 'prodigy
 )
(package-initialize)

;; Load Evil-Mode by default
(require 'evil)
(evil-mode t)

;; Load evil-magit
(evil-magit-init)

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
(global-set-key (kbd "<M-tab>") 'company-complete)

;; Load projectile globally
(projectile-mode)

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

;; Prodigy
(global-set-key (kbd "M-s") 'prodigy)

;;====================================================
;; Define only prodigy service from this point onwards.
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (prodigy package-safe-delete elpy pyvenv web-mode ranger vlf counsel-projectile ace-window counsel swiper ivy flycheck evil-magit railscasts-theme projectile evil magit)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
