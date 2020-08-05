;;; config.el -*- lexical-binding: t; -*-

(setq
 doom-font (font-spec :family "Fira Mono" :size 16)
 doom-big-font (font-spec :family "Fira Mono" :size 36)
 doom-variable-pitch-font (font-spec :family "Overpass" :size 14))

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.rmd" . poly-markdown+R-mode))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))
