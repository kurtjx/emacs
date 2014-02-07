;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org.txt$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done 'time)

;; (setq org-mobile-directory "/scpc:fishnchips@webdav.kurtisrandom.com:webdav.kurtisrandom.com/org/")
(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/personal.org"))
