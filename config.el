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

(setq
   org_notes (concat (getenv "HOME") "/Dropbox/org/Notes/")
   zot_bib (concat (getenv "HOME") "/Dropbox/org/references.bib")
   org-directory org_notes
   deft-directory org_notes
   org-roam-directory org_notes
   )

(setq
  bibtex-completion-notes-path "/Dropbox/org/Notes/"
  bibtex-completion-bibliography "/Dropbox/org/references.bib"
  bibtex-completion-pdf-field "file"
  bibtex-completion-notes-template-multiple-files
  (concat
 "#+TITLE: ${title}\n"
 "#+ROAM_KEY: cite:${=key=}\n"
 "* TODO Notes\n"
 ":PROPERTIES:\n"
 ":Custom_ID: ${=key=}\n"
 ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
 ":AUTHOR: ${author-abbrev}\n"
 ":JOURNAL: ${journaltitle}\n"
 ":DATE: ${date}\n"
 ":YEAR: ${year}\n"
 ":DOI: ${doi}\n"
 ":URL: ${url}\n"
 ":END:\n\n"
 )
)

(after! org-ref
  (setq
         org-ref-completion-library 'org-ref-ivy-cite
         org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
         org-ref-default-bibliography (list "/Dropbox/org/references.bib")
         org-ref-bibliography-notes "/Dropbox/org/Notes/bibnotes.org"
         org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
         org-ref-notes-directory "/Dropbox/org/notes/"
         org-ref-notes-function 'orb-edit-note
  )
)

(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.rmd" . poly-markdown+R-mode))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))
