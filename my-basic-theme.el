;;
;; my-basic-theme.el, place in ~/site_list
;; (load-theme "my-basic")
;;

(deftheme my-basic
  "Hugh's light theme")

(let ((class '((class color) (min-colors 89))))
  
  (custom-theme-set-faces
    'my-basic
    `(default ((((class color) (min-colors 4096))
		 (:background "white" :foreground "gray22"))
		(,class
		  (:background "white" :foreground "gray22"))))
    `(cursor ((,class (:background "black"))))
;;    `(fringe ((,class (:background "#2e3748"))))
    `(highlight ((,class (:background "darkseagreen2" :foreground "gray22"))))
    `(region ((,class (:background "lightgoldenrod2" :foreground "gray22"))))
    `(isearch ((,class (:background "magneta4" :foreground "lightskyblue1"))))
    `(lazy-highlight ((,class (:background "aliceblue"))))
    `(trailing-whitespace ((,class (:background "red"))))
    `(mode-line ((,class (:background "grey60" :foreground "black"))))
    `(mode-line-inactive   ((,class (:background "grey90" :foreground "black"))))
    `(header-line ((,class (:background "grey90" :foreground "grey20"))))
    `(minibuffer-prompt ((,class (:foreground "blue" :weight bold))))
;;    `(minibuffer-prompt ((,class (:foreground "blue"))))
    `(font-lock-builtin-face ((,class (:foreground "orchid"))))
    `(font-lock-comment-face ((,class (:foreground "green3" :slant oblique))))
    `(font-lock-constant-face ((,class (:foreground "blue"))))
    `(font-lock-function-name-face ((,class (:foreground "magenta4"))))
    `(font-lock-keyword-face ((,class (:foreground "blue" :weight bold))))
    `(font-lock-string-face ((,class (:foreground "rosybrown"))))
    `(font-lock-type-face ((,class (:foreground "blue"))))
    `(font-lock-variable-name-face ((,class (:foreground "magenta4"))))
    `(font-lock-warning-face ((,class (:foreground "pink"))))
    `(button ((,class (:underline t))))
;;    `(link ((,class (:foreground "#59e9ff" :underline t))))
;;    `(link-visited ((,class (:foreground "#ed74cd" :underline t))))
    ))

(provide-theme 'my-basic)

