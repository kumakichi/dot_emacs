(add-to-list 'load-path "~/.emacs.d/sanye")
(require 'sans)
(require 'smex)

;; for window quick change
(require 'window-number)
(window-number-mode 1) ;; C-x C-j arg

;; operate like vim
;;(add-to-list 'load-path "~/.emacs.d/sanye/evil")
;;(require 'evil)
;;(evil-mode 1)

(setq multi-term-program "bin/bash")
(require 'multi-term)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;下面5行是为了使用org-mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/.things.org"))

;; color theme
(require 'color-theme)
;;(if window-system
;;    (color-theme-bharadwaj));;(color-theme-bharadwaj-slate))

;;(require 'color-theme-tango)
;;(if window-system
;;    (color-theme-tango))
(require 'color-theme-molokai)
;;(if window-system
;;    (color-theme-molokai))
(color-theme-molokai)

;; use system clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; for auto encoding
(require 'unicad)

;; for relative line number
(require 'linum-relative)
;;(global-linum-mode t)

;;为了emacs -daemon,然后emacsclient -c(图形化) / -t (terminal) xxoo 快速编辑文件
(setq window-system-default-frame-alist
      '(
        ;; if frame created on x display
        (x
	 (menu-bar-lines . 0)
	 (tool-bar-lines . 0)
	 ;; mouse
	 (mouse-wheel-mode . 1)
	 (mouse-wheel-follow-mouse . t)
	 (mouse-avoidance-mode . 'exile)
	 ;; face
	 (font . "微软雅黑Monaco-14")
	)
        ;; if on term
        (nil
	 (menu-bar-lines . 0)
	 (tool-bar-lines . 0)
	 ;;(background-color . "black")
	 ;;(foreground-color . "white")
	 )
	)
      )

(add-to-list 'load-path "~/.emacs.d/install")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/install/ac-dict")
(ac-config-default)

;;sr-speedbar: 让speedbar和emacs在一个frame里头,而不是独立的窗体
(setq sr-speedbar-right-side nil) ;;让speedbar在左侧
(setq sr-speedbar-auto-refresh t)
(define-key global-map "\C-cu" 'speedbar-update-contents) ;; 定义C-c u 为更新speedbar的快捷键

(require 'sr-speedbar)
(require 'speedbar-settings)

;;highlight current line
(global-hl-line-mode 1)

;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; cedet
;;(add-to-list 'load-path "/home/san/xtemp/oth_src/cedet/lisp/cedet")
;;(load-file "/home/san/xtemp/oth_src/cedet/lisp/cedet/cedet.el")
;;(require 'semantic-ia);;; smart complitions setup
;;(require 'semantic-gcc);;; gcc setup
;;(require 'cedet)
(load-file "/home/san/xtemp/oth_src/cedet/cedet-devel-load.el")

(global-ede-mode t) ;; Enable EDE (Project Management) features
 
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
 
(global-srecode-minor-mode 1) ;; Enable SRecode (Template management) minor-mode.


;;; 快捷键
(defun my-cedet-hook()
(local-set-key [(control return)] 'semantic-ia-complete-symbol)

(local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
(local-set-key (kbd "M-n") 'semantic-ia-complete-symbol-menu)

(local-set-key "\C-c>" 'semantic-complete-analyze-inline)
(local-set-key (kbd "M-/") 'semantic-complete-analyze-inline)

(local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
(local-set-key "\C-cd" 'semantic-ia-fast-jump)
(local-set-key "\C-cr" 'semantic-symref-symbol)
(local-set-key "\C-cR" 'semantic-symref)

(local-set-key (kbd "\C-c;") 'semantic-add-system-include)

;;; c/c++ setting
(local-set-key "." 'semantic-complete-self-insert)
(local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;; semantic-add-system-include 可以添加非标准路径的头引用，方便补全

;;html高亮,org-mode输出的html也会从这里受益
(require 'htmlize)

;; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期
(display-time-mode 1)

(column-number-mode t) ;显示列号
(setq frame-title-format "san@%b") ; 显示当前编辑的文档

;;grep word under cursor
(require 'grep-o-matic)

;;高亮匹配的括号,但是好像需要将光标移到括号的后一个字符
(show-paren-mode 1)
;; 多层级括号分层高亮
(require 'highlight-parentheses)

;;(add-hook 'c-mode-hook
;;	  '(lambda ()
;;	     (c-set-style "cc-mode") ;; cc-mode or linux,其实开始的时候，进入emacs，不要打开任何文件,M-x c-set-style 然后tab，就会看到很多了
;;	     ))

;; c indent,from Emacs的C语言排版 -- gamesun's blog -- http://www.cnblogs.com/gamesun/archive/2012/12/23/2830417.html
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(defun my-c-mode-hook ()
  (setq c-basic-offset 4          ;; 基本缩进宽度
;;        indent-tabs-mode t        ;; 禁止空格替换Tab
        default-tab-width 4))     ;; 默认Tab宽度
(add-hook 'c-mode-hook 'my-c-mode-hook)

;; for sbcl
(add-to-list 'load-path "/home/san/xtemp/oth_src/slime")
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(slime-setup '(slime-fancy))

(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
      (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))
;;
;;
;; fuck semantic jump back
;;

(defvar semantic-tags-location-ring (make-ring 20))

(defun semantic-goto-definition (point)
  "Goto definition using semantic-ia-fast-jump   
save the pointer marker if tag is found"
  (interactive "d")
  (condition-case err
      (progn                            
        (ring-insert semantic-tags-location-ring (point-marker))  
        (semantic-ia-fast-jump point))
    (error
     ;;if not found remove the tag saved in the ring  
     (set-marker (ring-remove semantic-tags-location-ring 0) nil nil)
     (signal (car err) (cdr err)))))

(defun semantic-pop-tag-mark ()             
  "popup the tag save by semantic-goto-definition"   
  (interactive)                                                    
  (if (ring-empty-p semantic-tags-location-ring)                   
      (message "%s" "No more tags available")                      
    (let* ((marker (ring-remove semantic-tags-location-ring 0))    
              (buff (marker-buffer marker))                        
                 (pos (marker-position marker)))                   
      (if (not buff)                                               
            (message "Buffer has been deleted")                    
        (switch-to-buffer buff)                                    
        (goto-char pos))                                           
      (set-marker marker nil nil))))
(global-set-key (kbd "C-c C-]") 'semantic-goto-definition)
(global-set-key (kbd "\C-co") 'semantic-pop-tag-mark)
(global-set-key (kbd "\C-c\C-g") 'goto-line)
