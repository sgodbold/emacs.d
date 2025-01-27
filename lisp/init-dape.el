;;; init-dape.el --- Debug Adapter Protocol -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'dape)
  (with-eval-after-load 'dape
    (add-to-list 'dape-configs '(dlv-test
	modes (go-mode go-ts-mode)
	ensure dape-ensure-command
	command "dlv"
	command-args ("dap" "--listen" "127.0.0.1::autoport")
	command-cwd dape-command-cwd
	command-insert-stderr t
	port :autoport
	:request "test"
	:type "debug"
	:cwd "."
	:program "."))))


(provide 'init-dape)
;;; init-dape.el ends here
