;;; init-toml.el --- Lsp config -*- lexical-binding: t -*-
(when (maybe-require-package 'toml-mode)
  (add-hook 'toml-mode-hook 'goto-address-prog-mode))

(provide 'init-toml)
