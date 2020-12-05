
;;
;; insert imports
;;
(define-key my-map-f12 "w" 'my-macro-w)
(defun my-macro-w()
  "my-macro-w"
  (interactive)
  ;; start at beginning of line
  (beginning-of-line)
  (insert "import com.something;");
  (newline 1)
  (insert "import com.something.bits");
  (newline 1)
)


;;
;; insert SQLNaming line
;;
(define-key my-map-f12 "x" 'my-macro-x)
(defun my-macro-x()
  "my-macro-x"
  (interactive)
  ;; start at beginning of line
  (beginning-of-line)
  (c-indent-command)
  (insert "SQLNamingI sqlNamingI = Workspace.getSQLNaming();")
  (newline 1)
)


;;
;; transform
;;     XXX;
;; to
;;     String XXX = "XXX";
;;
(define-key my-map-f12 "y" 'my-macro-y)
(defun my-macro-y()
  "my-macro-y"
  (interactive)
  
  ;; start at beginning of line
  (beginning-of-line)

  ;; move to start of varname
  (forward-word 1)
  (backward-word 1)

  ;; we now just have the var name
  (setq p1 (point))
  (end-of-line)
  (backward-char 1);; move before final ;
  (setq p2 (point))
  (setq varname (buffer-substring p1 p2))
  
  ;; insert the String definition
  (backward-word 1)
  (insert "String ")
  (end-of-line)
  (backward-char 1)
  (insert " = ")
  (insert-string "\042") ;; insert "
  (insert varname)
  (insert-string "\042") ;; insert "
  ;;(insert ";");

  ;; setup for next line
  (beginning-of-line)
  (next-line 1)
)



;;
;; transform:
;;			String THEPRODUCT = "THEPRODUCT";
;; into:
;;			THEPRODUCT = sqlNamingI.getMappedColumnName(XXX, THEPRODUCT.toUpperCase());
;;
(define-key my-map-f12 "z" 'my-macro-z)
(defun my-macro-z()
  "string to vars"
  (interactive)
  
  ;; start at beginning of line
  (beginning-of-line)

  ;; string to just varname on the line
  (forward-word 1)
  (backward-kill-word 1)
  (delete-char 1)
  (forward-word 1)
  (kill-line)
  (backward-word 1)

  ;; we now just have the var name
  (setq p1 (point))
  (end-of-line)
  (setq p2 (point))
  (setq varname (buffer-substring p1 p2))
  
  ;; insert the stuff
  (insert " = sqlNamingI.getMappedColumnName(XXX, ")
  (insert varname)
  ;;(insert ".toUpperCase());");
  (insert ");");

  ;; setup for next line
  (beginning-of-line)
  (next-line 1)
)

;;
;; Run this macro on a file that is the output of getchanged.sql
;; The output is put into a buffer called *results*
;; you can then write it to a file
;; 
;; First select the file with the output of getchanged.
;; M-x find-next-row-change
;; C-X z (and then z to keep repeating)
;; 
;; 
(defun find-next-row-change()
  "find a section of lines starting 'SQL>'
   and ending with 'XX Rows ...' and copy it to a buffer
   return t if found, nil if not found"
  (interactive)
  (setq start-buffer (current-buffer))
  (setq result-buffer "*results*")
  (if (search-forward-regexp "^[123456789][0-9]* Row")
	(progn
	  (next-line 1)
	  (beginning-of-line)
	  (setq p1 (point))
	  (search-backward-regexp "^SQL>")
	  (search-forward "select")
	  (beginning-of-line)
	  (setq p2 (point))
	  (setq the-section (buffer-substring p1 p2))
	  (switch-to-buffer result-buffer)
	  (end-of-buffer)
	  (insert the-section)
	  (switch-to-buffer start-buffer)
	  (goto-char p1)
	  t
	  )
	(progn
	  nil
	  )
	);; if
  );; defun


(defun my-comment-out()
  "comment out fields in one file that have a line in the other buffer"
  (interactive)
  (switch-to-buffer "no-lastchanged-field.txt")

  (beginning-of-line)
  (setq p1 (point))
  (forward-word 1)
  (setq p2 (point))
  (setq fname (buffer-substring p1 p2))
  (beginning-of-line)
  (next-line 1)
  (message fname)

  (switch-to-buffer "getchanged.sql")
  (beginning-of-buffer)
  (search-forward fname)
  (beginning-of-line)
  (insert-string "-- ")
)


;;
;; turn current line into a log.debug() statement
;;
;;(fset 'logify
;;   [home tab ?l ?o ?g ?. ?d ?e ?b ?u ?g ?( ?" end ?" ?) ?\; home])


;;
;; turn current variable into a log.debug() statement
;;

(fset 'logifyvalue
   [C-right C-left ?\A-m end ?\A-c home C-right C-left ?l ?o ?g ?. ?d ?e ?b ?u ?g ?( ?" end ?  ?= ?  ?" ?  ?+ ?  ?\A-i ?) ?\; home down])

;;
;; take the next word, copy it, jump to top of file
;; and define it = null;

(fset 'defit
   [?\A-m C-right ?\A-c A-home down down down down down down down down down down down down down down down down down down down down down end return ?\A-i ?  ?= ?  ?n ?u ?l ?l ?\;])

;;
;; turn the statement into an assert
;;
(fset 'assertit
   [C-right C-left ?v ?s ?c ?A ?s ?s ?e ?r ?t ?( ?( ?\A-m end ?  ?\A-c ?! ?= ?  ?n ?u ?l ?l ?) ?  backspace ?, ?  ?" ?\A-i ?i ?s ?  ?n ?u ?l ?l ?" ?) ?\; home down])

;;
;; find the imports section in the protected area.
;;
(fset 'goto-end-imports
   [C-home ?\C-s ?< ?< ?i ?m ?p ?o ?r ?t ?s ?> ?> home down down ?\C-s ?E ?N ?D ?  ?O ?F ?  ?P ?R ?O home up])
