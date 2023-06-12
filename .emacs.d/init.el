;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))





;; Fist things first
(setq inhibit-startup-message t)
(tool-bar-mode -1)    ;;  Remove tool bar C-x u undo | C-w cut | M-w copy | C-y paste
(menu-bar-mode -1) ;; Remove menus
(scroll-bar-mode -1) ;; Remove scroll bar
(global-hl-line-mode t) ;; Show current line
(global-prettify-symbols-mode t) ;; Prettify symbols mode
(set-face-attribute 'default nil :height 105) ;; Font size
(show-paren-mode 1) ;; Show parent parentesis
(setq visible-bell t) ;; Visible bell
;;(setq-default header-line-format mode-line-format)
(setq-default mode-line-format nil)
(setq-default header-line-format nil)

;; Show time and date on the mode line
(setq display-time-day-and-date t)
(setq display-time-format "%a %b %F %R")
(display-time-mode 1)

;; Frame tansparency
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Line numbers
(global-linum-mode t)
(column-number-mode 1) ;; Colummns numeration
(setq linum-format "%2d \u2502")
(dolist (mode '(org-mode-hook
				        term-mode-hook
				        shell-mode-hook
				        treemacs-mode-hook
				        eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Border
(setq frame-resize-pixelwise t)
(set-frame-parameter nil 'fullscreen 'fullboth)

;; Keep all backup and auto-save files in one directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Identation:
(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq c-basic-offset tab-width)
(setq-default electric-indent-inhibit t)
(setq-default indent-tabs-mode nil)
(setq backward-delete-char-untabify-method 'nil)

;; Enable bracket pair-matching
(setq electric-pair-pairs '(
							(?\{ . ?\})
							(?\( . ?\))
							(?\[ . ?\])
							(?\" . ?\")
							))
(electric-pair-mode t)


;;; Mude o foco p/ novas janelas
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))


;; Alias
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'open 'find-file-other-window)
(defalias 'clean 'eshell/clear-scrollback)
(defalias 'list-buffers 'ibuffer)




(global-unset-key (kbd "C-z")) ;; Unbind C-z
(global-unset-key (kbd "C-Z")) ;; Unbind C-Z
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)	
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-<f5>") #'terminal-here-launch)
(global-set-key (kbd "C-<f6>") #'terminal-here-project-launch)
(global-set-key (kbd "C-S-p") 'tabbar-backward-group)
(global-set-key (kbd "C-S-n") 'tabbar-forward-group)
(global-set-key (kbd "C-<") 'tabbar-backward)
(global-set-key (kbd "C->") 'tabbar-forward) ;; tabbar.el, put all the buffers on the tabs.



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(deeper-blue)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
