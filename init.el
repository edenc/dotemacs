;;; -*- lexical-binding: t -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(defun my-append-env-var (var-name value)
  "Append VALUE to the beginning of current value of env variable VAR-NAME."
  (setenv var-name (if (getenv var-name)
                       (format "%s:%s" value (getenv var-name))
                     value)))

(let ((gccjitpath "/opt/homebrew/lib/gcc/14:/opt/homebrew/lib"))
  (mapc (lambda (var-name) (my-append-env-var var-name gccjitpath))
        '("LIBRARY_PATH" "LD_LIBRARY_PATH" "PATH")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af"
     "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf"
     "53a4efdca4c9fb870c3f92e4cfca0fbb638bb29b168a26a363298f9b1d9b9bcf"
     default))
 '(org-babel-load-languages '((emacs-lisp . t) (shell . t) (perl . t) (sql . t)))
 '(org-media-note-interface 'pretty-hydra)
 '(org-persist-default-expiry nil)
 '(package-selected-packages
   '(0blayout all-the-icons all-the-icons-gnus company
	      exec-path-from-shell flycheck-aspell helm helm-roam
	      helm-spotify-plus lsp-haskell lsp-java lsp-mode magit
	      mpv nerd-icons org org-contrib org-dotemacs
	      org-media-note org-pomodoro org-roam org-roam-ui
	      org-tidy prettier pretty-hydra quelpa-use-package
	      shackle spaceline spacemacs-theme theme-changer
	      typescript-mode))
 '(safe-local-variable-values '((org-confirm-babel-evaluate))))

(package-initialize)

(require 'ob-tangle)
(org-babel-tangle-file "~/.emacs.d/dotemacs.org" "~/.emacs.d/dotemacs.el")
(load "~/.emacs.d/dotemacs.el")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
