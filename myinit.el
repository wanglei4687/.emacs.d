;; [[file:myinit.org::*Repos][Repos:1]]
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; Repos:1 ends here

;; [[file:myinit.org::*Interface tweaks][Interface tweaks:1]]
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
;; Interface tweaks:1 ends here

;; [[file:myinit.org::*Themes and Modeline][Themes and  Modeline:1]]
(use-package color-theme-modern
:ensure t)
(use-package doom-themes
:ensure t)
(use-package doom-modeline
:ensure t)

(require 'doom-modeline)
(doom-modeline-init)

(load-theme 'doom-monokai-classic  t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree (all-the-icons must be installed!)
;; (doom-themes-neotree-config)

;; or for treemacs users
(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
(doom-themes-treemacs-config)

;; corrects (and improves) org-mode's native fontification
(doom-themes-org-config)
;; Themes and  Modeline:1 ends here

;; [[file:myinit.org::*Org-mode][Org-mode:1]]
(use-package org
:ensure t
:pin org)

;; this config for linux
;; (setenv "BROWSER" "chromium-browser")
(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; this config for linux
;; (setq org-file-apps (append '(
;; ("\\.pdf\\'" . "evince %s")
;; ("\\.x?html?\\'" . "/usr/bin/chromium-browser %s")
;; ) org-file-apps ))`


(setq org-agenda-files (list "~/Dropbox/Org/schedule.org"
			     "~/.emacs.d/org/course.org"
			     "~/.emacs.d/org/exercise.org"
			     "~/.emacs.d/org/gtd.org"
			     "~/.emacs.d/org/social.org"
			     "~/.emacs.d/org/project.org"))

;; Multiple keyword sets in one file
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAIT" "|" "DONE")
    (sequencee "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED")
    (sequence "|" "CANCELED")))

(setq org-todo-keyword-faces 
  '(("TODO" . (:foreground "orange" :weight bold)) 
    ("REPORT" . (:foreground "orange" :weight bold))
    ("IN-PROGRESS" . "cyan")
    ("BUG" . "cyan")
    ("KNOWNCAUSE" . "cyan")
    ("DONE" . "green")
    ("FIXED" . "green")
    ("CANCELED" . (:foreground "blue" :weight bold))))

(setq org-tag-alist '((:startgroup . nil)
		      ("@work" . ?w)
		      ("@home" . ?h)
		      ("@course" . ?c)
		      ("@social" . ?s)
		      (:endgroup . nil)
		      ("laptop" . ?l)
		      ("pc" . ?p)))
;; Org-mode:1 ends here

;; [[file:myinit.org::*Treemacs][Treemacs:1]]
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
	  treemacs-deferred-git-apply-delay      0.5
	  treemacs-directory-name-transformer    #'identity
	  treemacs-display-in-side-window        t
	  treemacs-eldoc-display                 t
	  treemacs-file-event-delay              5000
	  treemacs-file-extension-regex          treemacs-last-period-regex-value
	  treemacs-file-follow-delay             0.2
	  treemacs-file-name-transformer         #'identity
	  treemacs-follow-after-init             t
	  treemacs-git-command-pipe              ""
	  treemacs-goto-tag-strategy             'refetch-index
	  treemacs-indentation                   2
	  treemacs-indentation-string            " "
	  treemacs-is-never-other-window         nil
	  treemacs-max-git-entries               5000
	  treemacs-missing-project-action        'ask
	  treemacs-no-png-images                 nil
	  treemacs-no-delete-other-windows       t
	  treemacs-project-follow-cleanup        nil
	  treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
	  treemacs-position                      'left
	  treemacs-recenter-distance             0.1
	  treemacs-recenter-after-file-follow    nil
	  treemacs-recenter-after-tag-follow     nil
	  treemacs-recenter-after-project-jump   'always
	  treemacs-recenter-after-project-expand 'on-distance
	  treemacs-show-cursor                   nil
	  treemacs-show-hidden-files             t
	  treemacs-silent-filewatch              nil
	  treemacs-silent-refresh                nil
	  treemacs-sorting                       'alphabetic-asc
	  treemacs-space-between-root-nodes      t
	  treemacs-tag-follow-cleanup            t
	  treemacs-tag-follow-delay              1.5
	  treemacs-user-mode-line-format         nil
	  treemacs-width                         20)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
		 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))

  (treemacs-create-theme "Default"
  :icon-directory (f-join treemacs-dir "icons/default")
  :config
  (progn
    (treemacs-create-icon :file "root.png"   :fallback ""            :extensions (root))
    (treemacs-create-icon :file "emacs.png"  :fallback "🗏 "          :extensions ("el" "elc"))
    (treemacs-create-icon :file "readme.png" :fallback "🗏 "          :extensions ("readme.md"))
    (treemacs-create-icon :icon (all-the-icons-icon-for-file "yaml") :extensions ("yml" "yaml"))))

  :bind
  (:map global-map
	("M-0"       . treemacs-select-window)
	("C-x t 1"   . treemacs-delete-other-windows)
	("C-x t t"   . treemacs)
	("C-x t B"   . treemacs-bookmark)
	("C-x t C-t" . treemacs-find-file)
	("C-x t M-t" . treemacs-find-tag)))


(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package hl-line
  :ensure t
  :config
  (global-hl-line-mode t))
;; Treemacs:1 ends here

;; [[file:myinit.org::*Undo tree][Undo tree:1]]
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode 1)
  (global-set-key (kbd "C-z") 'undo))
;; Undo tree:1 ends here

;; [[file:myinit.org::*Ace windows][Ace windows:1]]
(use-package ace-window
  :ensure t
  :init 
  (progn 
    (setq aw-scope 'frame)
    (setq aw-background nil)
    (global-set-key (kbd "M-o") 'ace-window)
    (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )
)
;; Ace windows:1 ends here

;; [[file:myinit.org::*Which key][Which key:1]]
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
;; Which key:1 ends here

;; [[file:myinit.org::*Ibuffer][Ibuffer:1]]
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq ibuffer-saved-filter-groups
  (quote (("defullt"
    ("dired" (mode . dired-mode))
    ("org" (mode . "^.*org$"))
    ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
    ("programming" (or
    (mode . c++-mode)))
    ("emacs" (or
      (mode . "^\\*scratch\\*$")
      (mode . "^\\*Message\\*$")))
))))

(add-hook 'ibuffer-mode-hook
  (lambda()
    (ibuffer-auto-mode 1)
    (ibuffer-switch-to-saved-filter-groups "default")))

;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)
;; Ibuffer:1 ends here

;; [[file:myinit.org::*Swiper/Ivy/Counsel][Swiper/Ivy/Counsel:1]]
(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
  :map ivy-minibuffer-map
  ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure t
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))
;; Swiper/Ivy/Counsel:1 ends here

;; [[file:myinit.org::*Better shell][Better shell:1]]
(use-package better-shell
:ensure t
:bind (("C-c s" . better-shell-shell) 
       ("C-c r" . better-shell-remote-open)))
;; Better shell:1 ends here

;; [[file:myinit.org::*Origami][Origami:1]]
(use-package origami
:ensure t
:bind (
  ("C-c o s" . origami-mode)
  ("C-c o t" . origame-origami-toggle-node)
  ("C-c o c" . origami-close-node)
  ("C-c o o" . origami-open-node)
  ("C-c o u" . origami-undo)
  ("C-c o g" . origami-open-all-nodes)
  ("C-c o r" . origami-close-all-nodes) 
))
;; Origami:1 ends here

;; [[file:myinit.org::*Linum][Linum:1]]
(use-package linum
:ensure t
:config
:bind (("C-c l" . linum-mode))
)
;; Linum:1 ends here

;; [[file:myinit.org::*Goto][Goto:1]]
(use-package goto-chg
:ensure t
:bind (("C-c g c" .  goto-last-change)
       ("C-c g r" . goto-last-chanage-reverse)))

(use-package goto-line-preview
:ensure t
:bind (("C-c g p". goto-line-preview)))
;; Goto:1 ends here

;; [[file:myinit.org::*Company][Company:1]]
(use-package company
:ensure t
:config
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)
(global-company-mode t))

(use-package company-irony
:ensure t)
;; Company:1 ends here

;; [[file:myinit.org::*Flycheck][Flycheck:1]]
(use-package flycheck
:ensure t
:init 
:config
;; Disable the error indicator on the fringe
(setq flycheck-indication-mode nil)

;; Disable automatic syntax check on new line
(setq flycheck-syntax-automatically '(save 
idle-change 
mode-enable))

;; Immediate syntax checking quite annoying. Slow it down a bit.
(setq flycheck-idle-change-delay 2.0)

;; Customize faces (Colors are copied from solarized definitions

(set-face-attribute 'flycheck-warning nil
:background "#b58900"
:foreground "#262626"
:underline nil)

(set-face-attribute 'flycheck-error nil
:background "dc322f"
:foreground "#262626"
:underline nil)

(global-flycheck-mode t))

(use-package flycheck-irony
:ensure t)
;; Flycheck:1 ends here

;; [[file:myinit.org::*Yasnippet][Yasnippet:1]]
(use-package yasnippet
:ensure t
:init
(bind-key "C-c y" 'yas-about)
:config
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1))

;; a collection of yasnippet snippets for many languages
(use-package yasnippet-snippets
:ensure t)
;; Yasnippet:1 ends here

;; [[file:myinit.org::*Elpy][Elpy:1]]
(use-package elpy
:ensure t
:init
(setq python-indent-guess-indent-offset-verbose nil)
(setq python-shell-interpreter "python3.7"
      python-shell-interpreter-args "-i")
(setq elpy-rpc-python-command "python3")
(elpy-enable))
;; Elpy:1 ends here

;; [[file:myinit.org::*Go mode][Go mode:1]]
(use-package go-mode
:ensure t)
;; Go mode:1 ends here

;; [[file:myinit.org::*Magit][Magit:1]]
(use-package magit
:ensure t
:bind (
  ("C-c m c" . magit-commit)
  ("C-c m p" . magit-push)
  ("C-c m l" . magit-log)
  ("C-c m n" . magit-clone)
  ("C-c m b" . magit-branch-create)
  ("C-c m d" . magit-branch-delete)
  ("C-c m r" . magit-branch-reset)
  ("C-c m o" . magit-checkout)
  ("C-c m s" . magit-stash)
  ("C-c m g" . magit-status)
))
;; Magit:1 ends here

;; [[file:myinit.org::*Rust][Rust:1]]
(use-package rust-mode
:ensure t
:config
(setq tab-width 4))

(use-package racer
:ensure t)
;; Rust:1 ends here

;; [[file:myinit.org::*Yaml mode][Yaml mode:1]]
(use-package yaml-mode
:ensure t)
;; Yaml mode:1 ends here

;; [[file:myinit.org::*Web mode][Web mode:1]]
(use-package web-mode
:ensure t
:config
(progn
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(setq web-mode-ac-sources-alist
  '(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
    ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
    ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

(add-hook 'web-mode-before-auto-complete-hooks
	  '(lambda ()
	     (let ((web-mode-cur-language
		    (web-mode-language-at-pos)))
	       (if (string= web-mode-cur-language "php")
		   (yas-activate-extra-mode 'php-mode)
		 (yas-deactivate-extra-mode 'php-mode))
	       (if (string= web-mode-cur-language "css")
		   (setq emmet-use-css-transform t)
		 (setq emment-use-css-transform nil)))))
))
;; Web mode:1 ends here

;; [[file:myinit.org::*Markdown mode][Markdown mode:1]]
;; Should install pandoc first
;; For mac, brew install pandoc
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))
;; Markdown mode:1 ends here

;; [[file:myinit.org::*Auctex][Auctex:1]]
(use-package tex-site
:defer t
:ensure auctex
:config
(setq TeX-auto-save t)

)
;; Auctex:1 ends here

;; [[file:myinit.org::*Irony][Irony:1]]
(use-package irony
:ensure t
:config
(progn
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
))

(use-package flycheck-irony
:ensure t)
;; Irony:1 ends here

;; [[file:myinit.org::*Meghanada mode][Meghanada mode:1]]
(use-package meghanada
:ensure t
:config
(progn
  (add-hook 'java-mode-hook
    (lambda ()
      ;; meghanada-mode on
      (meghanada-mode t)
      ;; enable telemetry
      (meghanada-telemetry-enable t)
      (flycheck-mode +1)
      (setq c-basic-offset 2)
      ;; use code format
      (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
))
;; Meghanada mode:1 ends here

;; [[file:myinit.org::*Php mode][Php mode:1]]
(use-package php-mode
:ensure t
:config
(progn 
  (setq tab-width 4)
  (add-hook 'php-mode-hook 'php-enable-default-coding-style)
  (add-hook 'php-mode-hook (lambda () (subword-mode 1)))
  (with-eval-after-load 'php-mode
    (define-key php-mode-map (kbd "C-c C--") 'php-current-class)
    (define-key php-mode-map (kbd "C-c C-=") 'php-current-namespace))
))
;; Php mode:1 ends here

;; [[file:myinit.org::*Docker][Docker:1]]
(use-package docker
:ensure t
:bind ("C-c d" . docker))

(use-package dockerfile-mode
:ensure t
:config
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
)
;; Docker:1 ends here

;; [[file:myinit.org::*helm][helm:1]]
(use-package helm
:ensure t)
;; helm:1 ends here

;; [[file:myinit.org::*multiple-cursors][multiple-cursors:1]]
(defun gpolonkai/no-blink-matching-paren ()
  (customize-set-variable 'blink-matching-paren nil))

(defun gpolonkai/blink-matching-paren ()
  (customize-set-variable 'blink-matching-paren t))

(use-package multiple-cursors
  :init
  (defvar gpolonkai/mc-prefix-map (make-sparse-keymap)
    "Prefix keymap for multiple-cursors")
  (define-prefix-command 'gpolonkai/mc-prefix-map)
  (define-key global-map (kbd "C-c m") 'gpolonkai/mc-prefix-map)
  :hook
  (multiple-cursors-mode-enabled . gpolonkai/no-blink-matching-paren)
  (multiple-cursors-mode-disabled . gpolonkai/blink-matching-paren)
  :bind
  (:map gpolonkai/mc-prefix-map
   ("t" . mc/mark-all-like-this)
   ("m" . mc/mark-all-like-this-dwim)
   ("l" . mc/edit-lines)
   ("e" . mc/edit-ends-of-lines)
   ("a" . mc/edit-beginnings-of-lines)
   ("n" . mc/mark-next-like-this)
   ("p" . mc/mark-previous-like-this)
   ("s" . mc/mark-sgml-tag-pair)
   ("d" . mc/mark-all-like-this-in-defun)
   ("M-<mouse-1>" . mc/add-cursor-on-click)))
;; multiple-cursors:1 ends here
