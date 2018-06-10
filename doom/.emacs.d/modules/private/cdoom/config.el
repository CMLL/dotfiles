;;; private/cdoom/config.el -*- lexical-binding: t; -*-


;; Company Settings
(add-hook! company-mode
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 3))

;; Load Company Anaconda
(add-hook! python-mode
  (setq tab-width 4))

;; Disable line numbers
(add-hook! nlinum-mode
  (global-nlinum-mode 0))


;; Flycheck configuration
(add-hook! 'flycheck-mode
  (setq flycheck-check-syntax-automatically '(mode-enable save))
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'vue-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'vue-html-mode))


;; Evil Magit
(require 'evil-magit)

;; Load up ripgrep
(require 'ripgrep)
(add-hook! projectile-mode
  (require 'projectile-ripgrep))
