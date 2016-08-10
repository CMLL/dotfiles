;; Window switching
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
     )
  )

;; Magit
(define-key global-map (kbd "M-g") 'magit-status)

;; pytest
(define-key global-map (kbd "M-a") 'elpy-test-pytest-runner)

;; check
(define-key global-map (kbd "M-c") 'elpy-check)

;; workon
(define-key global-map (kbd "M-v") 'pyvenv-workon)

;; moving indetation levels
(defun identing-python ()
  (local-set-key (kbd "<C-S-right>") 'elpy-nav-indent-shift-right)
  (local-set-key (kbd "<C-S-left>") 'elpy-nav-indent-shift-left)
  )

(add-hook 'elpy-mode-hook 'identing-python)
