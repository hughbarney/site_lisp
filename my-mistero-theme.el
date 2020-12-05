;;
;; my-mistero-theme
;; put in ~/site_lisp/my-mistero-theme
;; (load-theme 'my-mistero)
;;

(deftheme my-mistero
  "Predominantly blue/cyan faces on a dark cyan background.")

(let ((class '((class color) (min-colors 89))))
  
  (custom-theme-set-faces
    'my-mistero
    ;; Ensure sufficient contrast on 256-color xterms.
    `(default ((((class color) (min-colors 4096))
		 (:background "#2d3743" :foreground "#e1e1e0"))
		(,class
		  (:background "#3a3a3a" :foreground "#e1e1e0"))))
    `(cursor ((,class (:background "#415160"))))
    ;; Highlighting faces
    `(fringe ((,class (:background "#2e3748"))))
    `(highlight ((,class (:background "#338f86" :foreground "#e1e1e0"))))
    `(region ((,class (:background "#2d4948" :foreground "#e1e1e0"))))
    `(isearch ((,class (:background "#fcffad" :foreground "#000000"))))
    `(lazy-highlight ((,class (:background "#338f86"))))
    `(trailing-whitespace ((,class (:background "#ff4242"))))
    ;; Mode line faces
    `(mode-line ((,class (:background "#212931" :foreground "#eeeeec"))))
    `(mode-line-inactive
       ((,class (:background "#878787" :foreground "#eeeeec"))))
    `(header-line ((,class (:background "#e5e5e5" :foreground "#333333"))))
    ;; Escape and prompt faces
    `(minibuffer-prompt ((,class (:foreground "#729fcf" :weight bold))))
    ;; Font lock faces
    `(font-lock-builtin-face ((,class (:foreground "#23d7d7"))))
    `(font-lock-comment-face ((,class (:foreground "#74af68"))))
    `(font-lock-constant-face ((,class (:foreground "#008b8b"))))
;;    `(font-lock-function-name-face ((,class (:foreground "#00ede1" :weight bold))))
    `(font-lock-function-name-face ((,class (:foreground "#00ede1"))))
;;    `(font-lock-keyword-face ((,class (:foreground "#ffad29" :weight bold))))
    `(font-lock-keyword-face ((,class (:foreground "#ffad29"))))
    `(font-lock-string-face ((,class (:foreground "#e67128"))))
    `(font-lock-type-face ((,class (:foreground "#34cae2"))))
    `(font-lock-variable-name-face ((,class (:foreground "#dbdb95"))))
    `(font-lock-warning-face ((,class (:foreground "#ff4242" :weight bold))))
    ;; Buttons and links
    `(button ((,class (:underline t))))
    `(link ((,class (:foreground "#59e9ff" :underline t))))
    `(link-visited ((,class (:foreground "#ed74cd" :underline t))))
    ))

(custom-theme-set-variables
 'my-mistero
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95"
			    "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"]))


(provide-theme 'my-mistero)
