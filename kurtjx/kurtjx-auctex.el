;; some stuff for setting up auctex
;; on ubuntu-ish systems do $ sudo apt-get install auctex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTex LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with emacs latex mode
