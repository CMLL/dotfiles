;;; private/cdoom/config.el -*- lexical-binding: t; -*-

;; Company Settings
(add-hook! company-mode
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 3))

;; Load Company Anaconda
(add-hook! python-mode
  (setq tab-width 4)
  (setq company-backends '(company-anaconda company-capf company-dabbrev company-yasnippet)))


;; Flycheck configuration
(after! flycheck-mode
  (setq flycheck-check-syntax-automatically '(mode-enable save))
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'vue-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'vue-html-mode))

;; Set extra python paths
(after! anaconda-mode
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/agent/src/linux/library")
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/agent/src/linux/plugins")
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/models")
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/thirdparty")
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/controlpanel")
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/aggregator")
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/metricpoller")
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/dashboards_v2")
  (add-to-list 'python-shell-extra-pythonpaths "/home/cllamach/Panopta/classic/src/tasks"))
