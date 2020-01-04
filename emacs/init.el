;; reference:
;; book.emacs-china.org

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
                      ;; --- Auto-completion ---
                      company
                      ;; --- Better Editor ---
                      hungry-delete
                      swiper
                      counsel
                      smartparens
                      ;; --- Major Mode ---
                      js2-mode
                      racket-mode
                      ;; --- Minor Mode ---
                      nodejs-repl
                      exec-path-from-shell
                      paredit
                      rainbow-delimiters
                      ;; --- Themes ---
                      monokai-theme
                      ;; solarized-theme
                      ) "Default packages")


(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; find executable path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; highlight brace match
(show-paren-mode 1)

;; highlight current line
(global-hl-line-mode 1)

;; theme
(load-theme 'monokai 1)

;; hide tool bar, menu bar and scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; show number line
(global-linum-mode 1)

;; change font size 16pt
(set-face-attribute 'default nil :height 130)

;; quickly open custom file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; open global company completation
(global-company-mode 1)

;; turn off backfile
(setq make-backup-files nil)

;; change answer yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; make the mark region can be deleted like normal editor
(delete-selection-mode 1)

;; racket mode settings
(require 'racket-mode)
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "C-x C-j") 'racket-run)))
(setq tab-always-indent 'complete)

;; paredit mode settings
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)

;; rainbow delimiters settings
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; recent files		       
(require 'recentf)	       
(recentf-mode 1)	       
(setq recentf-max-menu-item 10)

;; major mode blinding
(setq auto-mode-list
      (append
        '(("\\.js\'" . js2-mode))
        auto-mode-alist))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(custom-safe-themes
     (quote
       ("a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
