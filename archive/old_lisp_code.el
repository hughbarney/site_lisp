;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; stuff removed from .emacs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;;  specific for GNU emacs / Xemacs
;;
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))
(if (equal running-xemacs nil)
  ;;
  ;; GNU emacs setup
  ;;
  (progn
    (toggle-scroll-bar 0)
    (menu-bar-mode())
    (column-number-mode t)
    (add-hook 'mail-setup-hook 'mail-abbrevs-setup);; expand mail aliases as typed
    (global-set-key [delete] `delete-char)
    (my-set-default-font)

    ;; only if not win32 or -nw
    (if (and window-system (not (eq window-system 'w32)) (not (eq window-system 'win32)))
      (progn
        ;;(set-default-font "9x15")      ;; best done through .Xdefaults
        ;;(set-foreground-color "pink")  ;; grey95 also works well
        ;;(set-foreground-color "grey")
        (set-foreground-color "black")
		;;(server-start)
		) ;; progn
      )
    ) ;; progn GNU emacs

  ;;
  ;; XEmacs/Lucid Emacs specific setup
  ;;
  (progn
	(line-number-mode())
	(load-library "delbackspace")

	;; default settings for VM (xemacs mailer)
	(setq vm-primary-inbox "/home/hughb/mail/inbox")
	(setq vm-crash-box "/home/hughb/mail/inbox.crash")
	(setq vm-reply-subject-prefix "Re: ")
	(setq vm-confirm-new-folder 't)
	(setq vm-folder-directory "~/mail")
	(setq vm-preview-lines nil)
	(define-key global-map 'stop 'vm)

	;; setup the correct email response addresses.
	(if (string= (user-real-login-name) "hughb")
	  (progn
		(defconst vm-mail-header-from (format "%s <%s>" (user-full-name) user-mail-address))
		(defconst mail-default-reply-to vm-mail-header-from)
		(defconst ange-ftp-generate-anonymous-password user-mail-address)
		)
	  )

	;; so we can put tabs in comments
	;; this setting doesn't work in GNU emacs
	(define-key global-map '(shift tab) 'self-insert-command)
	;;(gnuserv-start)
	(setq url-gateway-program 'program)
	)
  )






;;
;; specific files 
;;
(defvar my-notes-file "c:/documents and settings/600699468/My Documents/Sync/Notes/scratch-notes.txt")
(defvar my-notes-dir  "c:/documents and settings/600699468/My Documents/Sync/Notes")
(defvar my-project-filelist-win "d:/SAAS_DEVELOPMENT/filelist.txt")
(defvar my-project-filelist-unix "~/.emacs_lisp/filelist.txt")




;;
;; AIX specifics
;;
(if (eq system-type 'aix)
  (progn
	(setq compile-command "build.sh")
    (tool-bar-mode)      ;; turn off tool bar (Graphics can be slow over VPN etc)
    (tooltip-mode nil)   ;; turn off those tooltip on mouse etc, they pop up when iconised
	;; fix wheely mouse on AIX
	(global-set-key [mouse-5] 'my-next-line-4)
	(global-set-key [mouse-4] 'my-prev-line-4)
	;; so we can determine which user login we are using when running more than 1 emacs
	(setq frame-title-format (concat "[ " (user-real-login-name) "@" system-name " ]"))
	);; progn
);; if




;; for use with wheely mouse
(defun my-next-line-4()
  "move 4 next lines"
  (interactive)
  (next-line 4)
) 

;; for use with wheely mouse
(defun my-prev-line-4()
  "move 4 previous lines"
  (interactive)
  (previous-line 4)
)


;;
;; global var used to record current buffer just before we switch
;; when running my-load-project-file
(defvar my-source-file-buffer "")

(defun my-goto-end-imports()
  "select my source buffer and find end of import statements"
  (interactive)
  (switch-to-buffer my-source-file-buffer)
  ;;(goto-end-imports)
  (beginning-of-buffer)
  (search-forward "<<imports>>")
  (search-forward "END OF ")
  (previous-line 1)
  )

;;
;; no longer called as we use this style by default
;; but will leave this code in as an example
;;
(defun my-sql-mode-hook()
 "hgb hooks for when sql file is loaded"
 (interactive)
  (custom-set-faces
	'(font-lock-keyword-face ((t (:foreground "Blue" :weight unspecified :family unspecified)))))
)

;; used to record state for toggling bold ketwords on/off
(defvar my-bold-keyword t)

(defun my-bold-keyword-toggle()
 "hgb hooks for when sql file is loaded"
 (interactive)
  (if my-bold-keyword
	(progn
	  (setq my-bold-keyword nil)
	  (custom-set-faces
		'(font-lock-keyword-face ((t (:foreground "Blue" :weight unspecified :family unspecified)))))
	  )
	(progn
	  (setq my-bold-keyword t)
	  (custom-set-faces
		'(font-lock-keyword-face ((t (:bold t :foreground "Blue" :weight semi-bold :family "outline-verdana")))))
	  )
	);; if
)



;;
;; this version pre GNU Emacs 23
;;
(defun my-toggle-cua-mode-pre23()
  "toggle cua-mode and report status"
  (interactive)
  (if (fboundp 'CUA-mode)
	;; if CUA-mode loaded, toggle it
	(progn
	  (CUA-mode)
	  ) ;; progn
	;; else: CUA-mode not loaded - so load it
	(progn
	  (require 'cua)
	  (CUA-mode t)
	  ) ;; progn
	) ;; if fbound

  ;;
  ;; now show status of CUA mode
  ;;
  (if CUA-mode
	(progn (message "CUA-mode active"))
	(progn (message "CUA-mode de-activated"))
	) ;; if
)



;;
;; WARNING this version written before cua-mode became part
;; of GNU Emacs v23
;; wrapper for set-mark so that we report if CUA-mode is active
;;
(defun my-set-mark-command-pre23()
  "call set-mark-command, warn if CUA-mode is active"
  (interactive)
  (set-mark-command 'nil)
  ;; first check if CUA-mode is loaded at all
  (if (fboundp 'CUA-mode)
	(progn
	  ;; if CUA-mode is active then warn
	  (if CUA-mode
		(progn (message "WARNING CUA-mode is active"))
		) ;; if CUA-mode
	  ) ;; prog
	) ;; if fbound CUA-mode
)




;;
;; global variable to be used with the derive import function
;;
(defvar my-derived-import-stmt "")


(defun my-grab-import()
  "search the this files identifier, derive an import statement and
   set a variable with it"
  (interactive)
  (beginning-of-buffer)
  ;;
  ;; * @(#)com.xxx.xxx.xxx.xxx.java
  ;; * com.dto.AuditDTOSessionFacadeLocal.java
  ;; * (#)com.dto.AuditDTOSessionFacade.java
  ;;
  ;; This regexo matches all three possibilities
  ;; ^[ \t]+\*[ \t]+@?\((#)\)?com
  ;; when used in lisp we have to escape the \ except in the char class []
  ;;
  (search-forward-regexp "^[ \t]+\\*[ \t]+@?\\((#)\\)?com")
  (backward-char 3)
  (setq p1 (point))
  (end-of-line)
  (backward-char 5)
  (setq p2 (point))
  (setq my-derived-import-stmt (concat "import " (buffer-substring p1 p2) ";"))
  (message my-derived-import-stmt)
  )

(defun my-insert-import-stmt()
  "insert the import statement we derived when my-grab-import was evaluated"
  (interactive)
  (insert my-derived-import-stmt)
  )

;;
;; prompt for a filename (or part of a filename)
;; locates the file in the project file list and loads it
;;
(defun my-load-project-file(filename)
  "prompt for a project filename that has a full pathname listed in
   the file filelist.txt and load it"
  (interactive "sOpen file: \n")
  (save-excursion)
  (setq my-source-file-buffer (current-buffer))
  (if (or (eq window-system 'w32) (eq window-system 'win32))
	(progn (find-file-read-only my-project-filelist-win))
	(progn (find-file-read-only my-project-filelist-unix))
	);; if
  (beginning-of-buffer)
;;  (if (or (eq window-system 'w32) (eq window-system 'win32))
;;	(progn (setq filename (concat "\\" filename)))
;;	(progn (setq filename (concat "/" filename)))
;;	);; if
  (search-forward filename)
  (beginning-of-line)
  (setq p1 (point))
  (end-of-line)
  (setq p2 (point))
  (setq projfile (buffer-substring p1 p2))
  ;;(find-file-read-only projfile)
  (find-file projfile)
  ;; force delete the filelist.txt buffer
  (condition-case nil (kill-buffer "filelist.txt") (error nil) )
  (message "loaded %s" projfile)
  ;; (my-grab-import)
  )




;;
;; create a test java file from a template
;;
(defvar my-test-classname "")
(defvar my-exec-test-class-cmd "")
(defun my-start-test-class(classname)
  "prompt for a class name and create it"
  (interactive "sEnter new classname ?: \n")
  (find-file "d:\\JAVA_CERT\\code\\template.java")
  (beginning-of-buffer)
  (while (search-forward "CLASSNAME" nil t)
    (replace-match classname t t))
  (setq filename (concat "d:\\JAVA_CERT\\code\\" classname ".java"))
  (write-file filename nil)
  (setq compile-command (concat "javac " classname ".java"))
  (setq my-exec-test-class-cmd (concat "java " classname))
  );; end of func

(defun my-exec-test-class()
  "execute my test class"
  (interactive)
  (compile my-exec-test-class-cmd)
)




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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Keyboard Macros Follow
;; recorded using C-X ( and C-X )
;; named using M-x name-last-kbd-macro
;; pasted using M-x insert-last-kbd-macros
;;

;; turn current string into a log.debug() statement
(fset 'logify
   [home tab ?l ?o ?g ?. ?d ?e ?b ?u ?g ?( ?" end ?" ?) ?\; home])

;; turn current variable into a log.debug() statement
(fset 'logifyvalue
   [C-right C-left ?\A-m end ?\A-c home C-right C-left ?l ?o ?g ?. ?d ?e ?b ?u ?g ?( ?" end ?  ?= ?  ?" ?  ?+ ?  ?\A-i ?) ?\; home down])

;; turn the statement into an assert
(fset 'assertit
   [C-right C-left ?v ?s ?c ?A ?s ?s ?e ?r ?t ?( ?( ?\A-m end ?  ?\A-c ?! ?= ?  ?n ?u ?l ?l ?) ?  backspace ?, ?  ?" ?\A-i ?i ?s ?  ?n ?u ?l ?l ?" ?) ?\; home down])

;; set char at cursor to upper case
;; bind to C-X ~
(fset 'upcase-char
   [?\A-m right ?\C-x ?\C-u left])

(define-key global-map "\C-X~" `upcase-char)

;;
;; set char at cursor to upper case
;; bind to C-X #
;;
(fset 'downcase-char
   [?\A-m right ?\C-x ?\C-l left])

(define-key global-map "\C-X#" `downcase-char)



(defun my-font-lock-setup()
 "setup font lock mode"
  (interactive)
  ;(set-foreground-color "grey90")
  (set-foreground-color "grey")
  (set-background-color "midnight blue")
  (set-cursor-color "cyan")
  (set-face-background 'modeline "grey")
  ;(set-face-background 'modeline "#9b9bea")
  (set-face-foreground 'modeline "black")
  (set-face-foreground 'region "black")
  (set-face-background 'region "grey")
  (set-face-foreground 'highlight "black")
  (set-face-background 'highlight "grey")
  (set-face-foreground 'secondary-selection "black")
  (set-face-background 'secondary-selection "grey")
  (make-face 'info-node);; so we can set the faces
  (make-face 'info-xref)
  (set-face-foreground 'info-xref "cyan")
  (set-face-foreground 'info-node "cyan")
  (set-face-foreground 'bold-italic "cyan")
  (set-face-foreground 'italic "lightgoldenrodyellow")
  (set-face-foreground 'underline "gold")
  (set-face-foreground 'bold "cyan")

  ;; customise face attributes
  (cond ((fboundp 'global-font-lock-mode)
		  (setq font-lock-face-attributes
			'(
				(font-lock-function-name-face "cyan")
				 (font-lock-comment-face "SpringGreen")
				 (font-lock-doc-string-face "SpringGreen")
				 (font-lock-preprocessor-face "cyan")
				 (font-lock-keyword-face "Yellow")
				 (font-lock-variable-name-face "Gold")
				 (font-lock-string-face "Wheat")
				 (font-lock-type-face "deepskyblue")
				)
            )
		  (require 'font-lock);; load font-lock package
		  (setq font-lock-maximum-decoration t)
		  (global-font-lock-mode t)))
)

