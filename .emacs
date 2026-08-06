;; Remove bloat bars
(scroll-bar-mode 0)
(menu-bar-mode)
(tool-bar-mode 0)


;; Enable Interactive Do
(require 'ido)
(ido-mode t)


;; LSP and Snippets
(yas-global-mode 1)
(global-company-mode 1)
(require 'eglot)



;; Enable Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)



;; Enable UndoTree Undo Fu





;; Frame Design or sum
(add-to-list 'default-frame-alist' (font . "Cascadia Mono-17"))



;; Random Shit Emacs adds whenever i install sumthi
;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(manoj-dark))
 '(display-line-numbers 'relative)
 '(package-selected-packages
   '(company eglot eldoc eldoc-mouse multiple-cursors undo-tree yasnippet
	     yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
