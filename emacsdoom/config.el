;;; config/private/config.el -*- lexical-binding: t; -*-

(setenv "PATH" (concat (getenv "PATH") ":/home/sebastian/.nvm/versions/node/v7.4.0/bin"))
(setq exec-path (append exec-path '("/home/sebastian/.nvm/versions/node/v7.4.0/bin")))

(defun +private|load-config ()
  "Loads your private config.el in `+private-config-path'."
  (load (expand-file-name "config.el" +private-config-path)
        'noerror 'nomessage))

(add-hook 'after-init-hook #'+private|load-config)

(defun my-setup-indent (n)
  (setq-default c-basic-offset n)
  (setq-default coffee-tab-width n) ; coffeescript
  (setq-default javascript-indent-level n) ; javascript-mode
  (setq-default js-indent-level n) ; js-mode
  (setq-default default-tab-width 2)
  (setq-default js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-default typescript-indent-level n)
  (setq-default web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-default web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-default web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-default css-indent-offset n) ; css-mode
  )

(my-setup-indent 2)

(setq doom-font (font-spec :family "Source Code Pro" :size 32)
      doom-variable-pitch-font (font-spec :family "DINPro" :size 26)
      doom-big-font (font-spec :family "Source Code Pro" :size 36))

(set-face-font 'variable-pitch "DINPro")

(after! neotree
  (setq neo-theme 'icons)
  (neotree-toggle))

;; Run NeoTree right on startup
;(add-hook 'after-init-hook #'neotree-toggle)

(after! company
  (setq company-idle-delay 0.5))

(after! doom-themes
  (setq doom-neotree-file-icons t))

(after! ivy
  (setq ivy-re-builders-alist
      '((t . ivy--regex-ignore-order))))

(add-hook! elixir-mode
  (flycheck-mode)
  (rainbow-delimiters-mode)
)

(def-package! flycheck-mix
  :after elixir-mode
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-mix-setup))

(def-package! flycheck-credo
  :after elixir-mode
  :config
  (setq flycheck-elixir-credo-strict t)
(add-hook 'flycheck-mode-hook #'flycheck-credo-setup))

(def-package! graphql-mode
:mode "\\.gql$")

(def-package! reason-mode
:mode "\\.re$")

(def-package! alchemist
  :after elixir-mode
  :config
  (defun rm/alchemist-project-toggle-file-and-tests ()
    "Toggle between a file and its tests in the current window."
    (interactive)
    (if (alchemist-utils-test-file-p)
        (alchemist-project-open-file-for-current-tests 'find-file)
      (rm/alchemist-project-open-tests-for-current-file 'find-file)))

  (defun rm/alchemist-project-open-tests-for-current-file (opener)
    "Visit the test file for the current buffer with OPENER."
    (let* ((filename (file-relative-name (buffer-file-name) (alchemist-project-root)))
           (filename (replace-regexp-in-string "^lib/" "test/" filename))
           (filename (replace-regexp-in-string "^web/" "test/" filename))
           (filename (replace-regexp-in-string "^apps/\\(.*\\)/lib/" "apps/\\1/test/" filename))
           (filename (replace-regexp-in-string "\.ex$" "_test\.exs" filename))
           (filename (format "%s/%s" (alchemist-project-root) filename)))
      (if (file-exists-p filename)
          (funcall opener filename)
        (if (y-or-n-p "No test file found; create one now?")
            (alchemist-project--create-test-for-current-file
             filename (current-buffer))
(message "No test file found."))))))

(setq doom-font (font-spec :family "Source Code Pro" :size 32)
      doom-variable-pitch-font (font-spec :family "DINPro" :size 26)
      doom-big-font (font-spec :family "Source Code Pro" :size 36))

(setq +org-dir "~/Dropbox/org")
(setq +org-default-notes-file (concat +org-dir "/notes.org"))
(setq +org-default-todo-file (concat +org-dir "/todo.org"))

(setq projectile-project-root "~/projects")
(setq projectile-require-project-root t)

(add-hook 'after-init-hook 'org-agenda-list)

(def-package! olivetti)
(def-package! prettier-js
  :after (:any typescript-mode javscript-mode js-mode js2-mode rjsx-mode js-jsx-mode js2-jsx-mode)
  )

(fset 'evil-visual-update-x-selection 'ignore)

(setq evil-snipe-scope 'buffer)

(load "~/.config/doom/evil-little-word")

; (add-hook 'org-mode-hook #'turn-off-smartparens-mode)

(map!
 (:leader
   (:desc "Org files ..." :prefix "v"
     :desc "Notes"  :nv "n" (lambda() (interactive) (find-file +org-default-notes-file))
     :desc "Todo" :nv "t" (lambda() (interactive) (find-file +org-default-todo-file))
     )))

(setq org-link-frame-setup (acons 'find-file 'find-file-other-frame));  org-link-frame-setup))

