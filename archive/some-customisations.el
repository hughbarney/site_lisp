;;  Some Customisations you may not be able to live without :-)
;; -*-lisp-*-

;; just have to be able to see selected lines
(setq transient-mark-mode t)

;; want matching () {} to be highlighted when I move around
(setq show-paren-mode t)



;;
;; toggle display of vertical scroll bars
;;
(scroll-bar-mode())

;;
;; toggle display of menu bar
;;
(menu-bar-mode())

;;
;; toggle display of toolbar
;;
(tool-bar-mode())


;; unbind f1 and f2 keys so we can use them

(global-unset-key [f1])
(global-unset-key [f2])

;;
;;  Setup Functions keys to emulate other editors style of searching
;;
;;  f1 - search forward
;;  f2 - repeat search forward
;;  f3 - search backwards
;;  f4 - repeat search backwards
(global-set-key [f1] 'nonincremental-search-forward)
(global-set-key [f2] 'nonincremental-repeat-search-forward)
(global-set-key [f3] 'nonincremental-search-backward)
(global-set-key [f4] 'nonincremental-repeat-search-backward)

