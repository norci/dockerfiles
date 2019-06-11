;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(async-shell-command-buffer (quote new-buffer))
 '(custom-enabled-themes (quote (tango-dark)))
 '(dired-auto-revert-buffer (quote dired-directory-changed-p))
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-archives
   (quote
    (("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))
 '(shell-command-dont-erase-buffer (quote end-last-out))
 '(show-paren-mode t)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight bold :height 121 :width normal)))))

;;
(put 'upcase-region 'disabled nil)

;; -diff
(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
    (ediff file1 file2)))
(add-to-list 'command-switch-alist '("-diff" . command-line-diff))

;; -merge
(defun command-line-merge (switch)
  (let ((base (pop command-line-args-left))
        (sccs (pop command-line-args-left))
        (mine (pop command-line-args-left))
        (merg (pop command-line-args-left)))
   (ediff-merge-with-ancestor sccs mine base () merg)))
(add-to-list 'command-switch-alist '("-merge" . command-line-merge))
