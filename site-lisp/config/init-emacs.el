;;;###autoload
(defun +evan/find-emacs-config()
  (interactive)
  (counsel-find-file (expand-file-name "~/.emacs.d/site-lisp/config")))

;;;###autoload
(defun +evan/reload-load-path ()
  (interactive)
  (add-subdirs-to-load-path "~/.emacs.d/"))

(defun +evan/find-emacs-config-2()
  (interactive)
  (read-file-name "init file" (expand-file-name "~/.emacs.d/site-lisp/config")))

;;;###autoload
(defun +clean-theme()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))


;;;###autoload
(defun +evan/toggle-proxy ()
  (interactive)
  (if (null url-proxy-services)
      (progn
        (setq url-proxy-services
              '(("http" . "127.0.0.1:8889")
                ("https" . "127.0.0.1:8889")))
        (message "代理已开启."))
    (setq url-proxy-services nil)
    (message "代理已关闭.")))

(defun +evan/yank-buffer-file-name ()
  (interactive)
  (push buffer-file-name kill-ring))

;;;###autoload
(defun +evan/toggle-transparent ()
  (interactive)
  (if (eq (frame-parameter (selected-frame) 'alpha-background) 100)
      (set-frame-parameter (selected-frame) 'alpha-background 50)
    (set-frame-parameter (selected-frame) 'alpha-background 100)))


;; (add-to-list 'default-frame-alist '(alpha-background . 50))

;;;###autoload
(defun +evan/byte-compile-pkg ()
  ;; TODO 实现将第三方包进行字节编译优化的函数
  (interactive)
  (byte-recompile-directory "~/.emacs.d/site-lisp/pkg" 0 nil))

;; (toggle-frame-fullscreen)
(provide 'init-emacs)
