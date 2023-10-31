;; -*- coding: utf-8 -*-
(setq cursor-type 'bar)
(setq default-cursor-type 'bar)
(setq evil-insert-state-cursor '("green" bar))
(setq evil-emacs-state-cursor '("green" bar))
(xclip-mode 1)
;; keeping ~/.emacs.d clean
(setq no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
(setq no-littering-var-directory
      (expand-file-name "data/" user-emacs-directory))
(require 'no-littering)
(require 'recentf)
(add-to-list 'recentf-exclude
             (recentf-expand-file-name no-littering-var-directory))
(add-to-list 'recentf-exclude
             (recentf-expand-file-name no-littering-etc-directory))
;; (require 'treemacs-nerd-icons)
;; (treemacs-load-theme "nerd-icons")
(setq org-src-window-setup 'split-window-below)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dap-mode lsp-docker bui zonokai-emacs zenburn-theme zen-and-art-theme yasnippet-snippets yaml-mode ws-butler writeroom-mode winum white-sand-theme which-key web-mode web-beautify volatile-highlights vmd-mode vim-powerline vi-tilde-fringe uuidgen unfill undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-persp treemacs-nerd-icons treemacs-magit treemacs-icons-dired treemacs-evil treemacs-all-the-icons toxi-theme toml-mode toc-org terminal-here term-cursor tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline spacegray-theme space-doc soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rustic ron-mode reverse-theme restart-emacs request rebecca-theme rainbow-delimiters railscasts-theme quickrun purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el password-generator paradox ox-hugo overseer orgit-forge organic-green-theme org-superstar org-rich-yank org-projectile org-present org-pomodoro org-mime org-download org-contrib org-cliplink open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme no-littering naquadah-theme nameless mwim mustang-theme multi-vterm multi-term multi-line monokai-theme monochrome-theme molokai-theme moe-theme modus-themes mmm-mode minimal-theme material-theme markdown-toc majapahit-themes madhat2r-theme macrostep lush-theme lsp-ui lsp-treemacs lsp-origami lorem-ipsum link-hint light-soap-theme kaolin-themes jbeans-theme jazz-theme ir-black-theme inspector inkpot-theme info+ indent-guide impatient-mode hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link gh-md gandalf-theme fuzzy flycheck-pos-tip flycheck-package flycheck-elsa flx-ido flatui-theme flatland-theme farmhouse-themes fancy-battery eziam-themes eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emr emmet-mode elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dracula-theme dotenv-mode doom-themes django-theme dired-quick-sort diminish devdocs define-word darktooth-theme darkokai-theme darkmine-theme dakrone-theme cyberpunk-theme cue-mode company-web company-go column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode chocolate-theme cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
