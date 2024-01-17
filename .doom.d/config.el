;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-dracula)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq packages-archives
      '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ;; to solve the problem of Org-contrib is unavailable
        ;; ref: https://github.com/syl20bnr/spacemacs/issues/14948
        ("nongnu"   . "https://elpa.nongnu.org/nongnu/")))

;; Style
(use-package! doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  ;; (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-dracula") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")


;; fonts
(setq doom-font (font-spec :family "Rec Mono Duotone" :size 24)
      doom-variable-pitch-font (font-spec :family "MesloLGS Nerd Font Mono" :size 24)
      doom-symbol-font (font-spec :family "Rec Mono Duotone")
      doom-big-font (font-spec :family "Rec Mono Duotone" :size 26)
      )

;; italics in themes: https://github.com/doomemacs/themes/issues/248
(set-face-attribute 'font-lock-comment-face nil :foreground "#5B6268" :slant 'italic)
(set-face-attribute 'font-lock-function-name-face nil :foreground "#c678dd" :slant 'italic)
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#dcaeea" :slant 'italic)

;; Maximize the window on startup.
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq-default cache-long-scans nil)

(setq
 confirm-kill-emacs nil ;; do not confirm while quit he emacs

 scroll-margin 5 ;; auto-hscroll-mode 'current-line


 ;; enable auto save
 auto-save-default t
 make-backup-files t

 ;; localleader keys
 evil-snipe-override-evil-repeat-keys nil
 doom-localleader-key ","
 doom-localleader-alt-key "M-,"

 ;; whichkey
 which-key-idle-delay 0.2

 ;; visiting a symbolink
 find-file-visit-truename t
 )

;; Doom modeline
(after! doom-modeline-mode
  (setq
   doom-modeline-enable-word-count t

   doom-modeline-buffer-file-name-style 'truncate-nil

   doom-modeline-icon t)
  )

;; Doom modeline settings.
;; (after!Source Code Pro for Powerline doom-modeline
;;   (setq doom-modeline-enable-word-count t
;;         ;doom-modeline-header-line nil
;;         ;doom-modeline-hud niHack Nerd Font Monol
;;         doom-themes-padded-modeline t
;;         doom-flatwhite-brighter-modeline nil
;;         doom-plain-brighter-modeline nil)
;;   (doom-modeline-def-modeline 'main
;;     '(bar matches buffer-info vcs word-count)
;;     '(buffer-position misc-info major-mode)))
;; (add-hook! 'doom-modeline-mode-hook
;;   (progn
;;     (set-face-attribute 'header-line nil
;;                         :background (face-background 'mode-line)
;;                         :foreground (face-foreground 'mode-line))
;;    ))

;; Treemacs
;; pretty treemacs
;; (add-hook! 'after-init-hook #'treemacs)
(after! treemacs
  (add-hook! 'treemacs-mode-hook (setq window-divider-mode -1
                                       variable-pitch-mode 1
                                       treemacs-follow-mode 1)))

;; Lang:org
(after! org
  (setq org-startup-indented nil))

;; Lang:go
;; organize imports
(after! go-mode
  (add-hook 'go-mode-hook #'lsp-deferred)
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  )
;; analyzers
(after! lsp-mode
  (setq lsp-go-analyses '((fieldalignment . t) ;; find structs that would use less memory if their fields were sorted
                          (nilness . t) ;; check for redundant or impossible nil comparisons
                          (shadow . t) ;; check for possible unintended shadowing of variables
                          (unusedparams . t) ;; check for unused parameters of functions
                          (unusedwrite . t) ;; checks for unused writes
                          (useany . t) ;; check for constraints that could be simplifed to `any`
                          (unusedvariable . t) ;; check for unused variables
                          ))
  )

;; hybrid evil and emacs keybindigs
(setq evil-disable-insert-state-bindings t)
(defalias 'evil-insert-state 'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "<escape>") 'evil-normal-state)

;; Lang:sh
(add-to-list 'auto-mode-alist '("\\.*aliases\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.privaterc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.cheat\\'" . sh-mode))

;; Shortcuts
(map!
 ;; selection
 :v "v" #'er/expand-region

 :leader
 :desc "Buffers" "SPC" #'helm-buffers-list

 ;; override the Eval-expression shortcut cuz didn't use it frequently
 (:prefix-map (";" . "regular")
  :desc "Buffers" "b" #'helm-buffers-list)
 )

(turn-on-pbcopy) ;; enable copy to system clipboard
