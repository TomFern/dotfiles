;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; theme setup
(require 'doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(doom-themes-visual-bell-config)
(doom-themes-org-config)
(doom-themes-neotree-config)
(load-theme 'doom-one-light t)
(setq doom-font (font-spec :family "Fira Mono" :size 24))
(setq doom-big-font (font-spec :family "Fira Mono" :size 14))
(setq display-line-numbers-type nil)
(setq avy-all-windows t)
(smartparens-global-mode -1)


;; hooks
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
(add-hook 'org-mode-hook #'typo-mode)
(add-hook 'org-mode-hook #'write-or-die-mode)
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


;; custom modules
(load-file (expand-file-name ".doom.d/custom/write-or-die.el"))
(load-file (expand-file-name ".doom.d/custom/title-capitalization.el"))

;; keybinds
(map! (:g "M-q" #'unfill-paragraph))
(map! (:g "M-c" #'title-capitalization))
(map! :leader
      (:prefix-map ("t" . "toggle")
       :desc "Write or die"    "k" (λ! (if (= 0 write-or-die-state)
                                            (progn
                                                  (message "Write or Die!")
                                                  (write-or-die-go))
                                            (progn
                                                  (message "Write normally")
                                                  (write-or-die-stop))))
       :desc "Writeroom mode"   "w"  #'writeroom-mode
       :desc "Dark theme"       "o" (λ! (load-theme 'doom-one t))
       :desc "Light theme"      "c" (λ! (load-theme 'doom-one-light t))
       ))

