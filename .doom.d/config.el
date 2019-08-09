;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; theme
(require 'doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'adwaita t)
(doom-themes-visual-bell-config)
(doom-themes-org-config)
(doom-themes-neotree-config)

;; modes
(add-to-list 'auto-mode-alist '("\\.org\\'" . typo-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . visual-line-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . typo-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . visual-line-mode))
(add-to-list 'auto-mode-alist '("\\.gitignore$" . sh-mode))

;; customize
(setq display-line-numbers-type nil)

;; keybinds
(map! :leader
      (:prefix-map ("t" . "toggle")
       :desc "Writeroom mode"   "w"  #'writeroom-mode))
