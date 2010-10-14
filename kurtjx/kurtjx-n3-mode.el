;;
;; n3 mode
;;
(autoload 'n3-mode "n3-mode" "Major mode for OWL or N3 files" t)

;; Turn on font lock when in n3 mode
(add-hook 'n3-mode-hook
          'turn-on-font-lock)

(setq auto-mode-alist
      (append
       (list
        '("\\.n3" . n3-mode)
	'("\\.ttl" . n3-mode)
        '("\\.owl" . n3-mode))
       auto-mode-alist))
