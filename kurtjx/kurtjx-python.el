;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python mode customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flymake pyflakes 
;; http://plope.com/Members/chrism/flymake-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (when (load "flymake" t) 
;;          (defun flymake-pyflakes-init () 
;;            (let* ((temp-file (flymake-init-create-temp-buffer-copy 
;;                               'flymake-create-temp-inplace)) 
;;               (local-file (file-relative-name 
;;                            temp-file 
;;                            (file-name-directory buffer-file-name)))) 
;;              (list "pyflakes" (list local-file)))) 

;;          (add-to-list 'flymake-allowed-file-name-masks 
;;                   '("\\.py\\'" flymake-pyflakes-init))) 

;;    (add-hook 'find-file-hook 'flymake-find-file-hook)

;;;;;;;;;;;;;;;;;;;
;; ipython stuff ;;
;;;;;;;;;;;;;;;;;;;

;; (setq ipython-command "/usr/bin/ipython")

;; (require 'cl)
;; (require 'shell)
;; (require 'executable)
;; (require 'ansi-color)

;; (defcustom ipython-command "ipython"
;;   "*Shell command used to start ipython."
;;   :type 'string
;;   :group 'python)

;; ;; Users can set this to nil
;; (defvar py-shell-initial-switch-buffers t
;;   "If nil, don't switch to the *Python* buffer on the first call to
;;   `py-shell'.")

;; (defvar ipython-backup-of-py-python-command nil
;;   "HACK")


;; (defvar ipython-de-input-prompt-regexp "\\(?:
;; In \\[[0-9]+\\]: *.*
;; ----+> \\(.*
;; \\)[\n]?\\)\\|\\(?:
;; In \\[[0-9]+\\]: *\\(.*
;; \\)\\)\\|^[ ]\\{3\\}[.]\\{3,\\}: *\\(.*
;; \\)"
;;   "A regular expression to match the IPython input prompt and the python
;; command after it. The first match group is for a command that is rewritten,
;; the second for a 'normal' command, and the third for a multiline command.")
;; (defvar ipython-de-output-prompt-regexp "^Out\\[[0-9]+\\]: "
;;   "A regular expression to match the output prompt of IPython.")


;; (if (not (executable-find ipython-command))
;;     (message (format "Can't find executable %s - ipython.el *NOT* activated!!!"
;;                      ipython-command))
;;     ;; XXX load python-mode, so that we can screw around with its variables
;;     ;; this has the disadvantage that python-mode is loaded even if no
;;     ;; python-file is ever edited etc. but it means that `py-shell' works
;;     ;; without loading a python-file first. Obviously screwing around with
;;     ;; python-mode's variables like this is a mess, but well.
;;     (require 'python-mode)
;;     ;; turn on ansi colors for ipython and activate completion
;;     (defun ipython-shell-hook ()
;;       ;; the following is to synchronize dir-changes
;;       (make-local-variable 'shell-dirstack)
;;       (setq shell-dirstack nil)
;;       (make-local-variable 'shell-last-dir)
;;       (setq shell-last-dir nil)
;;       (make-local-variable 'shell-dirtrackp)
;;       (setq shell-dirtrackp t)
;;       (add-hook 'comint-input-filter-functions 'shell-directory-tracker nil t)

;;       (ansi-color-for-comint-mode-on)
;;       (define-key py-shell-map [tab] 'ipython-complete)
;;       ;; Add this so that tab-completion works both in X11 frames and inside
;;       ;; terminals (such as when emacs is called with -nw).
;;       (define-key py-shell-map "\t" 'ipython-complete)
;;       ;;XXX this is really just a cheap hack, it only completes symbols in the
;;       ;;interactive session -- useful nonetheless.
;;       (define-key py-mode-map [(meta tab)] 'ipython-complete)

;;       )
;;     (add-hook 'py-shell-hook 'ipython-shell-hook)
;;     ;; Regular expression that describes tracebacks for IPython in context and
;;     ;; verbose mode.

;;     ;;Adapt python-mode settings for ipython.
;;     ;; (this works for %xmode 'verbose' or 'context')

;;     ;; XXX putative regexps for syntax errors; unfortunately the
;;     ;;     current python-mode traceback-line-re scheme is too primitive,
;;     ;;     so it's either matching syntax errors, *or* everything else
;;     ;;     (XXX: should ask Fernando for a change)
;;     ;;"^   File \"\\(.*?\\)\", line \\([0-9]+\\).*\n.*\n.*\nSyntaxError:"
;;     ;;^   File \"\\(.*?\\)\", line \\([0-9]+\\)"

;;     (setq py-traceback-line-re
;;           "\\(^[^\t >].+?\\.py\\).*\n   +[0-9]+[^\00]*?\n-+> \\([0-9]+\\)+")


;;     ;; Recognize the ipython pdb, whose prompt is 'ipdb>' or  'ipydb>'
;;     ;;instead of '(Pdb)'
;;     (setq py-pdbtrack-input-prompt "\n[(<]*[Ii]?[Pp]y?db[>)]+ ")
;;     (setq pydb-pydbtrack-input-prompt "\n[(]*ipydb[>)]+ ")

;;     (setq py-shell-input-prompt-1-regexp "^In \\[[0-9]+\\]: *"
;;           py-shell-input-prompt-2-regexp "^   [.][.][.]+: *" )
;;     ;; select a suitable color-scheme
;;     (unless (member "-colors" py-python-command-args)
;;       (setq py-python-command-args
;;             (nconc py-python-command-args
;;                    (list "-colors"
;;                          (cond
;;                            ((eq frame-background-mode 'dark)
;;                             "Linux")
;;                            ((eq frame-background-mode 'light)
;;                             "LightBG")
;;                            (t ; default (backg-mode isn't always set by XEmacs)
;;                             "LightBG"))))))
;;     (unless (equal ipython-backup-of-py-python-command py-python-command)
;;       (setq ipython-backup-of-py-python-command py-python-command))
;;     (setq py-python-command ipython-command))


;; (defadvice py-shell (around py-shell-with-history)
;;   "Add persistent command-history support (in
;; $PYTHONHISTORY (or \"~/.ipython/history\", if we use IPython)). Also, if
;; `py-shell-initial-switch-buffers' is nil, it only switches to *Python* if that
;; buffer already exists."
;;   (if (comint-check-proc "*Python*")
;;       ad-do-it
;;     (setq comint-input-ring-file-name
;;           (if (string-equal py-python-command ipython-command)
;;               (concat (or (getenv "IPYTHONDIR") "~/.ipython") "/history")
;;             (or (getenv "PYTHONHISTORY") "~/.python-history.py")))
;;     (comint-read-input-ring t)
;;     (let ((buf (current-buffer)))
;;       ad-do-it
;;       (unless py-shell-initial-switch-buffers
;;         (switch-to-buffer-other-window buf)))))
;; (ad-activate 'py-shell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; end ipython shenanigans ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;There are TWO python modes
; 1) Tim Peter's python-mode.el -- this is the standard/legacy way
; 2) Dave Love's python.el -- this is when Dave Love got frustrated
;                             that python-mode wasn't accepting his patches
;
;The following directory has a .nosearch file in it therefore it not in
;the current load-path and the default python-mode will be used instead
;The following loads Dave Love's python mode:
;(add-to-list 'load-path "~/.emacs.d/dave-loves-python-mode")
(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
	    interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
		    (set-variable 'py-indent-offset 4)
		    (set-variable 'py-smart-indentation nil)
		    (set-variable 'indent-tabs-mode nil) 
		    ;;(highlight-beyond-fill-column)
                    (define-key python-mode-map "\C-m" 'newline-and-indent)
		    ;(pabbrev-mode)
		    ;(abbrev-mode)
	 )
      )
)

;; Autofill inside of comments

;; (defun python-auto-fill-comments-only ()
;;   (auto-fill-mode 1)
;;   (set (make-local-variable 'fill-nobreak-predicate)
;;        (lambda ()
;;          (not (python-in-string/comment)))))
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (python-auto-fill-comments-only)))

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Auto-completion
;;;  Integrates:
;;;   1) Rope
;;;   2) Yasnippet
;;;   all with AutoComplete.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
      (setq value (cons (format "%s%s" prefix element) value))))))
(defvar ac-source-rope
  '((candidates
     . (lambda ()
         (prefix-list-elements (rope-completions) ac-target))))
  "Source for Rope")
(defun ac-python-find ()
  "Python `ac-find-function'."
  (require 'thingatpt)
  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
    (if (null symbol)
        (if (string= "." (buffer-substring (- (point) 1) (point)))
            (point)
          nil)
      symbol)))
(defun ac-python-candidate ()
  "Python `ac-candidates-function'"
  (let (candidates)
    (dolist (source ac-sources)
      (if (symbolp source)
          (setq source (symbol-value source)))
      (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
             (requires (cdr-safe (assq 'requires source)))
             cand)
        (if (or (null requires)
                (>= (length ac-target) requires))
            (setq cand
                  (delq nil
                        (mapcar (lambda (candidate)
                                  (propertize candidate 'source source))
                                (funcall (cdr (assq 'candidates source)))))))
        (if (and (> ac-limit 1)
                 (> (length cand) ac-limit))
            (setcdr (nthcdr (1- ac-limit) cand) nil))
        (setq candidates (append candidates cand))))
    (delete-dups candidates)))
(add-hook 'python-mode-hook
          (lambda ()
                 (auto-complete-mode 1)
                 (set (make-local-variable 'ac-sources)
                      (append ac-sources '(ac-source-rope)))
                 (set (make-local-variable 'ac-find-function) 'ac-python-find)
                 (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
                 (set (make-local-variable 'ac-auto-start) nil)))

;;Ryan's python specific tab completion
  ; Try the following in order:
  ; 1) Try a yasnippet expansion without autocomplete
  ; 2) If at the beginning of the line, indent
  ; 3) If at the end of the line, try to autocomplete
  ; 4) If the char after point is not alpha-numerical, try autocomplete
  ; 5) Try to do a regular python indent.
  ; 6) If at the end of a word, try autocomplete.
(define-key python-mode-map "\t" 'yas/expand)
(add-hook 'python-mode-hook
          (lambda ()
            (set (make-local-variable 'yas/trigger-fallback) 'ryan-python-expand-after-yasnippet)))
(defun ryan-indent ()
  "Runs indent-for-tab-command but returns t if it actually did an indent; nil otherwise"
  (let ((prev-point (point)))
    (indent-for-tab-command)
    (if (eql (point) prev-point)
        nil
      t)))
(defun ryan-python-expand-after-yasnippet ()
  (interactive)
  ;;2) Try indent at beginning of the line
  (let ((prev-point (point))
        (beginning-of-line nil))
    (save-excursion
      (move-beginning-of-line nil)
      (if (eql 0 (string-match "\\W*$" (buffer-substring (point) prev-point)))
          (setq beginning-of-line t)))
    (if beginning-of-line
        (ryan-indent)))
  ;;3) Try autocomplete if at the end of a line, or
  ;;4) Try autocomplete if the next char is not alpha-numerical
  (if (or (string-match "\n" (buffer-substring (point) (+ (point) 1)))
          (not (string-match "[a-zA-Z0-9]" (buffer-substring (point) (+ (point) 1)))))
      (ac-start)
    ;;5) Try a regular indent
    (if (not (ryan-indent))
        ;;6) Try autocomplete at the end of a word
        (if (string-match "\\W" (buffer-substring (point) (+ (point) 1)))
            (ac-start)))))

;; End Tab completion


;;Workaround so that Autocomplete is by default is only invoked explicitly,
;;but still automatically updates as you type while attempting to complete.
(defadvice ac-start (before advice-turn-on-auto-start activate)
  (set (make-local-variable 'ac-auto-start) t))
(defadvice ac-cleanup (after advice-turn-off-auto-start activate)
  (set (make-local-variable 'ac-auto-start) nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; End Auto Completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flymake with Pylint stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (load "flymake" t)
      (defun flymake-pylint-init ()
        (let* ((temp-file (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
          (list "epylint" (list local-file))))
    
      (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init))
      (define-key python-mode-map (kbd "C-c e") 'flymake-display-err-menu-for-current-line)
      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Flymake with Pyflakes
;;(require 'flymake)
;; (load-library "flymake-cursor")
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (custom-set-faces
;;  '(flymake-errline ((((class color)) (:background "DarkRed"))))
;;  '(flymake-warnline ((((class color)) (:background "DarkBlue")))))


;;Autofill comments
;;TODO: make this work for docstrings too.
;;      but docstrings just use font-lock-string-face unfortunately
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (auto-fill-mode 1)
;;             (set (make-local-variable 'fill-nobreak-predicate)
;;                  (lambda ()
;;                    (not (eq (get-text-property (point) 'face)
;;                             'font-lock-comment-face))))))

;; (brm-init)
;; (require 'pycomplete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UNUSED?
;; Put the following in your .emacs so that the
;; abbrev table is set correctly in all modes.
;; (Not just for java)
;;
;; (add-hook 'pre-abbrev-expand-hook 'abbrev-table-change)
;; (defun abbrev-table-change (&optional args)
;;   (setq local-abbrev-table
;; 	(if (eq major-mode 'jde-mode)
;; 	    (if (jde-parse-comment-or-quoted-p)
;; 		text-mode-abbrev-table
;; 	      java-mode-abbrev-table)
;; 	  (if (eq major-mode 'python-mode)
;; 	      (if (inside-comment-p)
;; 		  text-mode-abbrev-table
;; 		python-mode-abbrev-table
;; 		))))
;;   )
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

