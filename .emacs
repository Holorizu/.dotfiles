;; Remove bloat bars
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)


;; Enable Interactive Do
(require 'ido)
(ido-mode t)


;; LSP and Snippets
(yas-global-mode 1)
(global-company-mode 1)
(require 'eglot)


;; Enable MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


;; Enable Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)



;; Enable UndoTreeUndo Fu
(global-undo-tree-mode)
(setq undo-tree-auto-save-history 1)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))


;; Eglot Lsp
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
	       '(quickshell-mode . ("quickshell-language-server" "--stdio"))))


;; Frame Design or sum
(defun my/c-style-setup ()
  (c-set-style "bsd")
  (setq c-basic-offset 4))

(add-hook 'c-mode-hook 'my/c-style-setup)
(setq c-ts-mode-indent-style 'bsd)
(add-hook 'c++-mode-hook (lambda () (c-set-style "bsd")))
(setq c-default-style '((c-mode . "bsd") (other . "gnu")))
(setq-default c-default-style "bsd")
(setq lsp-enable-on-type-formatting nil)
(setq lsp-enable-indentation nil)

(add-to-list 'default-frame-alist' (font . "Cascadia Mono-17"))


(add-to-list 'eglot-ignored-server-capabilities :documentOnTypeFormattingProvider)

(add-to-list 'eglot-ignored-server-capabilities :documentFormattingProvider)
(add-to-list 'eglot-ignored-server-capabilities :documentRangeFormattingProvider)




;; Random Shit Emacs adds whenever i install sumthi
;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(display-line-numbers 'relative)
 '(package-selected-packages
   '(0blayout cargo-mode company darkman eglot eldoc eldoc-mouse
	      gruber-darker-ayu-theme gruber-darker-theme
	      impatient-mode js2-mode koishi-theme lsp-java lsp-mode
	      lsp-pyright magit multiple-cursors
	      phoenix-dark-pink-theme pink-bliss-uwu-theme
	      play-crystal rust-mode simple-httpd skewer-mode
	      sourcerer-theme spacemacs-theme tree-sitter
	      tree-sitter-langs undo-tree web-mode yasnippet
	      yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
