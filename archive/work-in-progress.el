;; -*- mode: lisp-interaction -*-

;; toggle CUA-mode key bindings
(define-key my-map-f12 "\C-c" 'my-toggle-cua-mode) ; F12-C-c

(defun my-toggle-cua-mode()
  "toggle cua-mode and report status"
  (interactive)
  (CUA-mode)
  (if CUA-mode
	(progn (message "CUA-mode active"))
	(progn (message "CUA-mode de-activated"))
	) ;; if
  )


(global-set-key [(alt m)] `my-set-mark-command)           ; C-SPACE

(defun my-set-mark-command()
  "call set-mark-command, warn if CUA-mode is active"
  (interactive)
  (set-mark-command 'nil)
  (if CUA-mode
	(progn (message "WARNING CUA-mode is active"))
	) ;; if
  )

(define-key my-map-f12 "z" 'my-insert-back-slash)
(define-key my-map-f12 "." 'my-insert-forward-slash)

(defun my-insert-back-slash()
  "insert a \ character"
  (interactive)
  (insert-string "\\")
  )

(defun my-insert-forward-slash()
  "insert a / character"
  (interactive)
  (insert-string "/")
  )


(define-key my-map-f12 "\C-t" 'my-insert-try-catch)


(defun my-insert-try-catch()
  "insert a java try-catch-block"
  (interactive)
  (insert-string "\ttry\n")
  (insert-string "\t{\n")
  (insert-string "\t\n")
  (insert-string "\t}\n")
  (insert-string "\tcatch (Exception e)\n")
  (insert-string "\t{\n")
  (insert-string "\t\tif (e instanceof VSCException)\n")
  (insert-string "\t\t{\n")
  (insert-string "\t\t\tthrow (VSCException)e;\n")
  (insert-string "\t\t}\n")
  (insert-string "\t\telse\n")
  (insert-string "\t\t{\n")
  (insert-string "\t\t\tthrow new VSCException(e);\n")
  (insert-string "\t\t}\n")
  (insert-string "\t}\n")
  )



