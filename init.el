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
(setq package-check-signature nil)
(package-refresh-contents)

;;load config
;; basic config
(org-babel-load-file (expand-file-name "~/.emacs.d/config/config.org"))
;; theme (doom doom-line)
(org-babel-load-file (expand-file-name "~/.emacs.d/config/theme.org"))
;; common config
(org-babel-load-file (expand-file-name "~/.emacs.d/config/common.org"))
;; editor config
(org-babel-load-file (expand-file-name "~/.emacs.d/config/editor.org"))
;; org config
(org-babel-load-file (expand-file-name "~/.emacs.d/config/orgmode.org"))
;; program config (rust go yaml toml ....)
(org-babel-load-file (expand-file-name "~/.emacs.d/config/program.org"))
;; web config (typescript)
(org-babel-load-file (expand-file-name "~/.emacs.d/config/web.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dap-mode yasnippet-snippets yaml-mode ws-butler which-key websocket vterm vertico undo-tree typescript-mode treesit-auto treemacs-tab-bar treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toml-mode swiper smartparens simple-httpd shut-up rjsx-mode rainbow-identifiers rainbow-delimiters racer prodigy org-roam orderless nlinum multiple-cursors miniedit marginalia lsp-ui loccur json-mode ivy-yasnippet helm-projectile helm-ag goto-line-preview golden-ratio go-mode git-timemachine git-messenger form-feed forge flycheck-rust flycheck-irony fancy-narrow editorconfig doom-themes doom-modeline dockerfile-mode dired-sidebar dashboard ctrlf consult company-shell company-prescient company-irony company-emoji company-c-headers color-theme-modern cargo better-shell apheleia anzu all-the-icons-ivy-rich all-the-icons-dired ag ace-jump-mode ace-flyspell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
