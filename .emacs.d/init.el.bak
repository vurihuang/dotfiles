;; -*- coding: utf-8 -*-

(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
        ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package avy
  :ensure t
  :bind("M-s" . avy-goto-char))

(use-package go-mode
  :ensure t)

;;(use-package solarized-theme
;;  :ensure t
;;  :config (load-theme 'solarized-light t))
(use-package zenburn-theme
	:ensure t
	:config (load-theme 'zenburn t))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :bind(("C-s" . swiper)
		("C-r" . swiper)
		("C-c C-r" . ivy-resume)
		("M-x" . counsel-M-x)
		("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
	(setq ivy-use-virtual-buffers t)
	(setq ivy-display-style 'fancy)
	(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
	(setq enable-recursive-minibuffers t)
	))

(use-package auto-complete
  :ensure t
  :init
  (progn
	(ac-config-default)
	(global-auto-complete-mode t)))

;; set font
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline"))
(set-frame-font "Monaco for Powerline-13" nil t)

(menu-bar-mode -1)
(tool-bar-mode -1)

;; open buffer list in new buffer
(defalias 'list-buffers 'ibuffer)
;; open buffer list in mini buffer
;; (defalias 'list-buffers 'ibuffer-other-window)

;; stop creating backup~ files
(setq make-backup-files nil)
;; stop creating #autosave# files
(setq auto-save-default nil)

;; auto insert closing bracket
(electric-pair-mode 1)

;; make typing delete/overwrites selected text
(delete-selection-mode 1)
(show-paren-mode 1)

;; utf-8 as default coding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; always show line numbers
(global-linum-mode 1)

;; keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)

;; make indentation commands use space only
(progn
  (setq-default indent-tabs-mode t)
  (setq-default tab-always-indent t)
  )
;; set default tab char's display with to 2 spaces
(setq-default tab-width 2)

;; make tab key call indent command or insert tab character,
;; depending on cursor position
(setq-default tab-always-indent nil)

(defun my-insert-tab-char ()
  "insert a tab char, (ASCII 9, \t)"
  (interactive)
  (insert "\t"))

(global-set-key (kbd "TAB") 'my-insert-tab-char) ;; same as ctrl+i

;; make return key also do indent
(electric-indent-mode 1)

;; make lines soft-wrap
(global-visual-line-mode 1)

;; type y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; set minibuffer height
(setq max-mini-window-height 0.3)

;; make cursor not blink
(blink-cursor-mode 0)

;; kill other buffers except current buffer
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; turn off alarms completely
(setq ring-bell-function 'ignore)

(add-hook 'go-mode-hook
          (lambda()
            (add-hook 'before-save-hook 'gofmt-before-))
          (setq tab-width 4)
          (setq indent-tabs-mode 1))

;; prevent auto-save-list dir auto created
(setq auto-save-list-file-prefix nil)

(setq js-indent-level 2)

(set-scroll-bar-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "eecacf3fb8efc90e6f7478f6143fd168342bbfa261654a754c7d47761cec07c8" default)))
 '(package-selected-packages
	 (quote
		(zenburn-theme zenburn auto-org-md swiper go-autocomplete go-mode solarized-theme dracula-theme ace-window org-bullets which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
