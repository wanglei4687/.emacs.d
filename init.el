(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("ublt" .  "https://elpa.ubolonton.org/packages/") t)

(package-initialize)
;; always show line number (first-line-number is 1)
;; (global-linum-mode 1)

;; Bootstrap `use-package`
(unless
  (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dashboard comany-lean helm-lean lean-mode yasnippet-snippets yaml-mode ws-butler which-key vterm vertico use-package undo-tree treemacs-tab-bar treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired tree-sitter-langs toml-mode swiper smartparens shut-up rainbow-identifiers rainbow-delimiters racer prodigy multiple-cursors miniedit marginalia magit-libgit lsp-ui loccur json-mode ivy-yasnippet helm-projectile helm-ag goto-line-preview golden-ratio go-mode git-timemachine git-messenger form-feed forge flycheck-rust flycheck-irony fancy-narrow editorconfig doom-themes doom-modeline dockerfile-mode dired-sidebar ctrlf consult company-shell company-prescient company-irony company-emoji company-c-headers color-theme-modern cargo better-shell anzu all-the-icons-ivy-rich all-the-icons-dired ag ace-jump-mode ace-flyspell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
