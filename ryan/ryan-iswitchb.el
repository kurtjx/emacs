;I usually have a LOT of buffers open,
;this keeps the size of iswitchb minibuffer more manageable.
(add-hook 'iswitchb-minibuffer-setup-hook
	  '(lambda () (set (make-local-variable 'max-mini-window-height) 3)))

(defun iswitchb-local-keys ()
      (mapc (lambda (K) 
	      (let* ((key (car K)) (fun (cdr K)))
    	        (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match)
	      ("<up>"    . ignore             )
	      ("<down>"  . ignore             ))))

(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)