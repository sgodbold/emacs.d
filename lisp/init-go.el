;;; init-go.el --- Golang editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'go-mode)

  ;; Use goimports instead of gofmt
  (setq gofmt-command "goimports")

  ;; Format on save
  ;; (add-hook 'before-save-hook #'gofmt-before-save)
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook #'gofmt-before-save nil t)))

  ;; Organize imports on save
  (setq lsp-go-format-tool "goimports")

  ;; LSP setup
  (add-hook 'go-mode-hook #'eglot-ensure)

  ;; Optional: flycheck integration
  (when (maybe-require-package 'flycheck)
    (add-hook 'go-mode-hook #'flycheck-mode))

  ;; go requires tabs not spaces
  (setq tab-width 4)
  (setq indent-tabs-mode t)

  (add-hook 'go-mode-hook
            (lambda ()
              (evil-define-key 'normal (current-local-map)
                (kbd "M-.") #'xref-find-definitions
                (kbd "M-?") #'xref-find-references)))

  (use-package dap-mode
    :after go-mode
    :config
    (dap-auto-configure-mode)
    (require 'dap-dlv-go))
  )

(provide 'init-go)
;;; init-go.el ends here
