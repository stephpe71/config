;; ===================================================================================
;; Micro minimal 'classical' Emacs configuration for Emacs 29 on GhostBSD
;;
;; My other conf is dw-emacs based:
;;    https://github.com/daviwil/emacs-from-scratch/tree/3075158cae210060888001c0d76a58a4178f6a00
;; ET (pour avoir le contenu des modules)
;;    https://github.com/daviwil/dotfiles/tree/master
;;  
;; Author:	Stephane Perrot
;; Date:	December 2024
;; ===================================================================================
(setq make-backup-files		nil)

;; for ansible
(add-to-list 'load-path	"/home/sperrot/devel/lisp/elisp/")
(require 'yaml-mode)

(require 'package)
(add-to-list 'package-archives	'("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;(boundp 'fish-mode-map)

;; NO !
;;(keymap-global-set "<tab>" 'dabbrev-expand)
;;(add-hook 'fish-mode-hook (lambda () (keymap-set-local "<tab>"  'dabbrev-expand)))
(server-start)

;; demo files have a '.dem' suffix in gnuplot source repository
(add-to-list 'auto-mode-alist '("\\.\\(gp\\|dem\\)" . gnuplot-mode))


;; ====================================================================================

;; This sect0ion automatically added by Emacs...
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a4a27ae839c9e6333c26c6ee82b4a9695eebb5690f0974656c53855661541c4a" default))
 '(package-selected-packages '(ansible gnuplot fish-mode)))

;;'(default ((t (:family "DejaVu Sans" :foundry "PfEd" :slant normal :weight regular :height 151 :width normal))))

;; pas mal, mais un peu gras et pas aligné ...
;; '(default ((t (:family "Droid Sans" :foundry "1ASC" :slant normal :weight bold :height 143 :width normal))))

;; Monospace Bold est pas trop mal non plus
;; "DejaVu Sans Mono" est pas mal non plus
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight regular :height 151 :width normal))))
 '(font-lock-comment-face ((t (:foreground "sea green")))))




