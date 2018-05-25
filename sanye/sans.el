(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default-font "微软雅黑Monaco-14")

;; 下面两行是为了elisp的时候自动补全
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

;;下面四行是为了处理分割之后窗体的大小
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(defun sans-switch-to-other-buffer ()
  "Switch to other buffer"
  (interactive)
  (switch-to-buffer (other-buffer)))

(global-set-key (kbd "\C-c'") 'sans-switch-to-other-buffer)

(defun sans-unline ()
  (interactive)
  (modify-syntax-entry ?_ "w"))            ;让下划线不成为单词的一部分

(defun sans-asm-comma ()
  (interactive)
  (setq-default gas-comment-char ?\;)
  )

(defun sans-asm-hash ()
  (interactive)
  (setq-default gas-comment-char ?\#)
  )

(defun sans-replace-quote ()
  (interactive)
  (beginning-of-buffer)
  (replace-string "“" "\"")
  (beginning-of-buffer)
  (replace-string "”" "\"")
  )

(provide 'sans)
