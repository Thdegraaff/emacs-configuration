;;; config.el -*- lexical-binding: t; -*-

(display-time-mode 1)                             ; Enable time in the mode-line

(setq doom-theme 'doom-vibrant)
(delq! t custom-theme-load-path)
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

(setq
 doom-font (font-spec :family "Fira Mono" :size 16)
 doom-big-font (font-spec :family "Fira Mono" :size 36)
 doom-variable-pitch-font (font-spec :family "Overpass" :size 16))

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.rmd" . poly-markdown+R-mode))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))
