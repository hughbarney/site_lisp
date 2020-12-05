(deftheme my-solarized
  "Created 2020-10-01.")

(custom-theme-set-variables
 'my-solarized
 '(ansi-color-names-vector ["#01323d" "#ec423a" "#93a61a" "#c49619" "#3c98e0" "#e2468f" "#3cafa5" "#60767e"])
 '(cua-normal-cursor-color "#8d9fa1")
 '(cua-read-only-cursor-color "#93a61a")
 '(cua-global-mark-cursor-color "#3cafa5")
 '(cua-overwrite-cursor-color "#c49619"))

(custom-theme-set-faces
 'my-solarized
 '(button ((t (:underline t))))
 '(cursor ((((class color) (min-colors 89)) (:foreground "#002732" :background "#8d9fa1" :inverse-video t))))
 '(error ((((class color) (min-colors 89)) (:foreground "#db5823"))))
 '(escape-glyph ((((class color) (min-colors 89)) (:foreground "#7a7ed2"))))
 '(fringe ((((class color) (min-colors 89)) (:foreground "#62787f" :background "#002732"))))
 '(header-line ((((class color) (min-colors 89)) (:inverse-video unspecified :overline nil :underline "#01323d" :foreground "#8d9fa1" :background "#002732" :box (:line-width 2 :color "#002732" :style unspecified)))))
 '(highlight ((((class color) (min-colors 89)) (:background "#01323d"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:foreground "#002732" :background "#c49619" :weight normal))))
 '(link ((((class color) (min-colors 89)) (:foreground "#c49619" :underline t :weight bold))))
 '(link-visited ((((class color) (min-colors 89)) (:foreground "#c49619" :underline t :weight normal))))
 '(match ((((class color) (min-colors 89)) (:background "#01323d" :foreground "#9eacac" :weight bold))))
 '(menu ((((class color) (min-colors 89)) (:foreground "#8d9fa1" :background "#002732"))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:foreground "#8d9fa1"))))
 '(mode-line ((((class color) (min-colors 89)) (:inverse-video unspecified :overline "#01323d" :underline "#284b54" :foreground "#8d9fa1" :background "#01323d" :box (:line-width 1 :color "#01323d" :style unspecified)))))
 '(mode-line-buffer-id ((((class color) (min-colors 89)) (:foreground "#9eacac" :weight bold))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:inverse-video unspecified :overline "#01323d" :underline "#284b54" :foreground "#62787f" :background "#002732" :box (:line-width 1 :color "#002732" :style unspecified)))))
 '(region ((((class color) (min-colors 89)) (:foreground "#002732" :background "#9eacac"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:background "#01323d"))))
 '(shadow ((((class color) (min-colors 89)) (:foreground "#62787f"))))
 '(success ((((class color) (min-colors 89)) (:foreground "#93a61a"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) (:background "#ec423a"))))
 '(vertical-border ((((class color) (min-colors 89)) (:foreground "#284b54"))))
 '(warning ((((class color) (min-colors 89)) (:foreground "#c49619"))))
 '(completions-annotations ((t (:foreground "#62787f"))))
 '(cua-global-mark ((((class color) (min-colors 89)) (:background "#c49619" :foreground "#002732"))))
 '(cua-rectangle ((((class color) (min-colors 89)) (:inherit region :background "#e2468f" :foreground "#002732"))))
 '(cua-rectangle-noselect ((((class color) (min-colors 89)) (:inherit region :background "#01323d" :foreground "#62787f"))))
 '(isearch ((((class color) (min-colors 89)) (:foreground "#002732" :background "#e2468f" :weight normal))))
 '(isearch-fail ((((class color) (min-colors 89)) (:foreground "#ec423a" :background "#002732" :bold t))))
 '(widget-field ((((class color) (min-colors 89)) (:background "#01323d"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#8d9fa1" :weight bold :slant normal))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 89)) (:foreground "#62787f" :slant normal))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#62787f"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#3c98e0" :weight bold))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "#3cafa5" :slant normal))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#3c98e0"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#93a61a" :weight bold))))
 '(font-lock-negation-char-face ((((class color) (min-colors 89)) (:foreground "#c49619" :weight bold))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 89)) (:foreground "#3c98e0"))))
 '(font-lock-regexp-grouping-construct ((((class color) (min-colors 89)) (:foreground "#c49619" :weight bold))))
 '(font-lock-regexp-grouping-backslash ((((class color) (min-colors 89)) (:foreground "#93a61a" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#3cafa5"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#c49619"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#3c98e0"))))
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:inherit error :weight bold))))
 '(c-annotation-face ((((class color) (min-colors 89)) (:inherit font-lock-constant-face))))
 '(custom-face-tag ((((class color) (min-colors 89)) (:inherit variable-pitch :height 1.2 :foreground "#7a7ed2" :weight normal))))
 '(custom-variable-tag ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#3cafa5" :height 1.2))))
 '(custom-comment-tag ((((class color) (min-colors 89)) (:foreground "#62787f"))))
 '(custom-group-tag ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#3c98e0" :height 1.2))))
 '(custom-group-tag-1 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#ec423a" :height 1.2))))
 '(custom-state ((((class color) (min-colors 89)) (:foreground "#93a61a"))))
 '(custom-button ((((class color) (min-colors 89)) (:background "#01323d" :foreground "#9eacac" :box (:line-width 2 :style released-button)))))
 '(custom-button-mouse ((((class color) (min-colors 89)) (:background "#62787f" :foreground "#01323d" :box (:line-width 2 :style released-button)))))
 '(custom-button-pressed ((((class color) (min-colors 89)) (:background "#62787f" :foreground "#9eacac" :box (:line-width 2 :style pressed-button)))))
 '(custom-button-unraised ((((class color) (min-colors 89)) (:inherit underline))))
 '(custom-button-pressed-unraised ((((class color) (min-colors 89)) (:inherit custom-button-unraised :foreground "#e2468f"))))
 '(diff-added ((((class color) (min-colors 89)) (:background "#1e3531" :foreground "#97a54d"))))
 '(diff-changed ((t nil)))
 '(diff-removed ((((class color) (min-colors 89)) (:background "#2f2c31" :foreground "#dc6a5a"))))
 '(diff-refine-added ((((class color) (min-colors 89)) (:background "#354725" :foreground "#9eaa66"))))
 '(diff-refine-changed ((((class color) (min-colors 89)) (:background "#004363" :foreground "#78a3cb"))))
 '(diff-refine-removed ((((class color) (min-colors 89)) (:background "#582b29" :foreground "#d77e6f"))))
 '(diff-header ((t (:background "#01323d"))))
 '(diff-file-header ((((class color) (min-colors 89)) (:background "#002732" :foreground "#8d9fa1" :weight bold))))
 '(diff-context ((((class color) (min-colors 89)) :foreground "#8d9fa1")))
 '(diff-indicator-added ((t (:foreground "#93a61a"))))
 '(diff-indicator-changed ((t (:foreground "#3c98e0"))))
 '(diff-indicator-removed ((t (:foreground "#ec423a"))))
 '(info-title-1 ((((class color) (min-colors 89)) (:foreground "#9eacac" :weight bold))))
 '(info-title-2 ((((class color) (min-colors 89)) (:foreground "#9eacac" :weight bold))))
 '(info-title-3 ((((class color) (min-colors 89)) (:weight bold))))
 '(info-title-4 ((((class color) (min-colors 89)) (:weight bold))))
 '(info-node ((((class color) (min-colors 89)) (:foreground "#9eacac" :slant italic :weight bold))))
 '(info-header-node ((((class color) (min-colors 89)) (:inherit info-node))))
 '(info-header-xref ((((class color) (min-colors 89)) (:inherit info-xref))))
 '(info-index-match ((((class color) (min-colors 89)) (:inherit match))))
 '(info-menu-header ((((class color) (min-colors 89)) (:inherit variable-pitch :weight bold))))
 '(info-menu-star ((((class color) (min-colors 89)) (:foreground "#db5823"))))
 '(info-xref ((((class color) (min-colors 89)) (:inherit link))))
 '(info-xref-visited ((((class color) (min-colors 89)) (:inherit (link-visited info-xref)))))
 '(line-number ((((class color) (min-colors 89)) (:weight thin :underline nil :foreground "#62787f" :background "#002732"))))
 '(show-paren-match ((((class color) (min-colors 89)) (:foreground "#e2468f" :background unspecified :weight bold))))
 '(show-paren-mismatch ((((class color) (min-colors 89)) (:foreground "#01323d" :background "#ec423a" :weight bold))))
 '(tooltip ((((class color) (min-colors 89)) (:background "#273430" :foreground "#bb9a4c" :inherit variable-pitch))))
 '(window-divider ((((class color) (min-colors 89)) (:foreground "#01323d"))))
 '(window-divider-first-pixel ((((class color) (min-colors 89)) (:foreground "#01323d"))))
 '(window-divider-last-pixel ((((class color) (min-colors 89)) (:foreground "#01323d"))))
 '(default ((((class color) (min-colors 89)) (:foreground "#8d9fa1" :background "#002732")))))

(provide-theme 'my-solarized)