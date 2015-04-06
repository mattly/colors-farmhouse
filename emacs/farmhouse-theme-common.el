(defvar farmhouse-color-defs
  '((gray0 "#1D1D29")
    (gray1 "#272b34")
    (gray2 "#495259")
    (gray4 "#7b8383")
    (gray5 "#9c9b95")
    (gray6 "#c0beb9")
    (gray7 "#dedbd7")
    (gray8 "#ede9e7")
    (gray9 "#f6f2f3")
    (red1 "#9e000d")
    (red2 "#c60013")
    (red3 "#ef001b")
    (yellow1 "#b7690a")
    (yellow2 "#d28508")
    (yellow3 "#eea806")
    (green1 "#4a8b0d")
    (green2 "#66a80e")
    (green3 "#8cc610")
    (cyan1 "#2c9f6b")
    (cyan2 "#27be72")
    (cyan3 "#2c9f6b")
    (blue1 "#124cd3")
    (blue2 "#0c68e8")
    (blue3 "#088afb")
    (purple1 "#941458")
    (purple2 "#af3574")
    (purple3 "#cb5791")))

(defun farmhouse-color (n symbol)
  (list n (nth 1 (assoc symbol farmhouse-color-defs))))

(defmacro farmhouse-theme--set-faces (name palette)
  `(let ,(cons '(class '((class color) (min-colors 24))) (mapcar (lambda (colordef) (apply 'farmhouse-color colordef)) palette))
     (custom-theme-set-faces
      ',name
      `(default ((,class (:background ,base6 :foreground ,base1))))
      `(bold ((,class (:weight bold))))

      `(font-lock-builtin-face ((,class (:foreground ,blue1 :weight bold))))
      `(font-lock-comment-face ((,class (:foreground ,base3))))
      `(font-lock-comment-delimiter-face ((,class (:foreground ,base3))))
      `(font-lock-constant-face ((,class (:foreground ,green2 :weight bold))))
      `(font-lock-function-name-face ((,class (:foreground ,cyan1))))
      `(font-lock-keyword-face ((,class (:foreground ,purple1))))
      `(font-lock-negation-char-face ((,class (:foreground ,purple2))))
      `(font-lock-preprocessor-face ((,class (:foreground ,blue2))))
      `(font-lock-regexp-grouping-construct ((,class (:foreground ,cyan2))))
      `(font-lock-regexp-grouping-backslash ((,class (:foreground ,cyan2))))
      `(font-lock-string-face ((,class (:foreground ,green1))))
      `(font-lock-type-face ((,class (:foreground ,red1))))
      `(font-lock-variable-name-face ((,class (:foreground ,yellow1))))
      `(font-lock-warning-face ((,class (:foreground ,purple2))))
      `(error ((,class (:foreground ,red2))))

      `(trailing-whitespace ((,class (:background ,base5))))

      `(match ((,class (:background ,yellow1 :foreground ,base1))))
      `(isearch ((,class (:background ,yellow1 :foreground ,base1 :weight bold))))
      `(isearch-fail ((,class (:background ,red1 :foreground ,base1))))

      `(hi-line ((,class (:background ,base7))))
      `(highlight ((,class (:background ,base7))))
      `(cursor ((,class (:background ,blue2))))
      `(fringe ((,class (:background ,base6))))
      `(border ((,class (:background ,base6))))
      `(linum ((,class (:background ,base6 :foreground ,base3))))
      `(linum-highlight-face ((,class (:inverse-video nil :background ,base3))))
      `(vertical-border ((,class (:foreground ,base4))))

      ;; modeline and powerline
      `(mode-line ((,class (:background ,base7 :foreground ,base1))))
      `(powerline-active1 ((,class (:background ,base5 :foreground ,base2))))
      `(powerline-active2 ((,class (:background ,base5 :foreground ,base2))))

      `(mode-line-inactive ((,class (:inherit mode-line
                                              :foreground ,base2
                                              :background ,base5
                                              :box nil))))
      `(powerline-inactive1 ((,class (:background ,base4 :foreground ,base2))))
      `(powerline-inactive2 ((,class (:background ,base4 :foreground ,base2))))
      )))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'farmhouse-theme-common)
;;; farmhouse-theme-common.el ends here
