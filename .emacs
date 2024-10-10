(require 'package)
(require 'no-littering)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

					;(pdf-tools-install)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(auth-source-save-behavior nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(spolsky))
 '(custom-safe-themes
   '("c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" default))
 '(global-linum-mode t)
 '(global-visual-line-mode t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode 'both nil (ido))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(rjsx-mode web-mode yaml-mode exec-path-from-shell pdf-tools no-littering go-mode parseclj cider clojure-mode sublime-themes tramp-theme adaptive-wrap))
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(sentence-end-double-space nil)
 '(server-mode t)
 '(tool-bar-mode nil)
 '(warning-suppress-types '((auto-save))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [General]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Adaptive-wrap globally
(define-globalized-minor-mode global-adaptive-wrap-prefix-mode adaptive-wrap-prefix-mode
  (lambda () (adaptive-wrap-prefix-mode 1)))
(global-adaptive-wrap-prefix-mode 1)

;; Global linum-mode with exceptions for pdf view modes
(setq linum-mode-inhibit-modes-list '(pdf-view-mode))
(defadvice linum-on (around linum-on-inhibit-for-modes)
  "Stop the load of linum-mode for some major modes."
  (unless (member major-mode linum-mode-inhibit-modes-list)
    ad-do-it))
(ad-activate 'linum-on)
(eval-after-load "linum"
  '(set-face-attribute 'linum nil :height 125))

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/home/paul/bin")

(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t))) 

(set-face-attribute 'default nil :font "Source Code Pro" :height 120)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [Theme]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'spolsky t)
;; List of themes copied from old .spacemacs
;; '(monokai
;;   spolsky
;;   zenburn
;;   wombat
;;   misterioso
;;   spacemacs-dark
;;   spacemacs-light)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [Golang setup]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;('go-mode-hook (add-hook 'before-save-hook 'gofmt-before-save))
;; thanks to http://tleyden.github.io/blog/2014/05/27/configure-emacs-as-a-go-editor-from-scratch-part-2/
(setq gofmt-command "gofmt")
(add-hook 'before-save-hook 'gofmt-before-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [web-mode]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun web-mode-init-hook ()
  (setq web-mode-markup-indent-offset 2))  
(add-hook 'web-mode-hook  'web-mode-init-hook)
