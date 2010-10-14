;; template toolkit syntax highlighting enabled
(autoload 'tt-mode "tt-mode" "Major mode for template toolkit" t)

(setq auto-mode-alist
      (append
       (list
        '("\\.tt" . tt-mode))
       auto-mode-alist))

