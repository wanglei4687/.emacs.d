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
