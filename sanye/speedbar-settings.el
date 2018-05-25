;;==============================================================================
;;speedbar设置
;;==============================================================================
;; Show all files
(setq speedbar-show-unknown-files t)

(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)

;; switch between main frame and speedbar frame.
;;(global-set-key [(f2)] 'speedbar-get-focus)
;;(;;require 'sr-speedbar)
;;(global-set-key [(f2)] 'sr-speedbar-toggle)
;;(setq speedbar-show-unknown-files t)


;; fix speedbar in left, and set auto raise mode
(add-hook 'speedbar-mode-hook
    (lambda ()
        (auto-raise-mode 1)
        (add-to-list 'speedbar-frame-parameters '(top . 40))
        (add-to-list 'speedbar-frame-parameters '(left . 0))
    )
)

;; inhibit tags grouping and sorting
(setq speedbar-tag-hierarchy-method '(speedbar-simple-group-tag-hierarchy) )

;;最后这个的缺省值是
;;(defcustom speedbar-tag-hierarchy-method '(speedbar-prefix-group-tag-hierarchy speedbar-trim-words-tag-hierarchy))
;;它会将tags排列、提取前缀、并分组。但通常都希望按照 tag出现行号的先后依次排列，就像vim的taglist一样， 所以改成speedbar-simple-group-tag-hierarchy。

(provide 'speedbar-settings)
