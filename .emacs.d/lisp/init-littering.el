;;; init-littering.el --- Keeping ~/.emacs.d cleaning -*- lexical-binding: t -*-

(setq no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
(setq no-littering-var-directory
      (expand-file-name "data/" user-emacs-directory))
(require 'no-littering)

;; Stop creating #autosave# files
(setq auto-save-default nil)

(provide 'init-littering)
