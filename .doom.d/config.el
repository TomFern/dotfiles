;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; theme setup
(require 'doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(doom-themes-visual-bell-config)
(doom-themes-org-config)
(doom-themes-neotree-config)

;; hooks
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
(add-hook 'org-mode-hook #'typo-mode)
(remove-hook 'org-mode-hook #'auto-fill-mode)
(add-hook 'markdown-mode-hook #'typo-mode)
(remove-hook 'markdown-mode-hook #'auto-fill-mode)
(add-hook 'find-file-hook
          (lambda ()
            (when (string= (file-name-extension buffer-file-name) "org")
              (typo-mode +1)
              (visual-line-mode +1))
            (when (string= (file-name-extension buffer-file-name) "md")
              (typo-mode +1)
              (visual-line-mode +1))))

;; customizations
(setq display-line-numbers-type nil)
(setq avy-all-windows t)

(org-add-link-type "lid" 'endless/open-id-link 'endless/export-id-link)

(defun endless/open-id-link (path)
  "Follow an ID link to PATH."
  (browse-url (endless/find-id-link path)))

(defun endless/export-id-link (path desc format)
  "Create the export version of an ID link specified by PATH and DESC.
FORMATs understood are 'latex and 'html."
  (setq path (endless/find-id-link path))
  (cond
   ((eq format 'html) (format "<a href=\"%s\">%s</a>" path desc))
   ((eq format 'latex) (format "\\href{%s}{%s}" path desc))
   (t desc)))


;; keybinds
(map! :leader
      (:prefix-map ("t" . "toggle")
       :desc "Writeroom mode"   "w"  #'writeroom-mode
       :desc "Dark theme"       "o" (λ! (load-theme 'doom-one t))
       :desc "Light theme"      "c" (λ! (load-theme 'doom-one-light t))))
