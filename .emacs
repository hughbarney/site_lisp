;;
;; Unified .emacs for different OS
;; Time-stamp: <2022-11-07 22:41:18 hugh>
;;
;; -*-lisp-*-
;; -*-lisp-interaction-mode-*-
;;


;;
;; General Settings
;;

(setq inhibit-default-init t)              ; override system .emacs
;(setq debug-on-error t)

;; does not appear to work on a chromebook
;(setq initial-frame-alist '((top . 1) (left . 1) (width . 115) (height . 35)))

(setq inhibit-startup-screen t)            ; dont show the Emacs Window
(setq-default auto-save-default nil)       ; no auto save
(setq-default make-backup-files nil)       ; no backup files
(setq-default scroll-step 1)               ; trun off jumpy scroll
(setq-default visible-bell t)              ; no beeps, flash on errors
(transient-mark-mode -1)                   ; no highlight of marked region by default
(show-paren-mode 1)                        ; show matching parenthesis
(setq load-path (cons (expand-file-name "~/site_lisp") load-path))  ;; look in own library first

(display-time)                             ; display the time on modeline
(column-number-mode t)                     ; display the column number on modeline
(setq-default kill-whole-line t)           ; ctrl-k kills whole line if at col 0
(setq-default delete-auto-save-files t)    ; zap auto-save files on writing original
(setq-default fill-column 69)              ; wrap at col 69
;(setq-default tab-width 4)                ; show tabs as 4 cols
(setq-default indent-tabs-mode t)          ; use tabs for indentation
(setq default-major-mode 'text-mode)       ; assume text mode for files not
                                           ; recognised by extension

(setq-default case-fold-search t)          ; searches ignore case
(setq-default next-line-add-newlines nil)  ; dont add newlines at end of buffer
;(setq text-mode-hook 'turn-on-auto-fill)
(setq lisp-indent-offset 2)                ; lisp mode setup
(setq lisp-body-ident 2)
(setq display-time-mail-file t)            ; dont say Mail all the time on modeline
(put 'narrow-to-region 'disabled nil)      ; allow narrow-to-region
(put 'downcase-region 'disabled nil)       ; make searches case insensitive
(put 'upcase-region 'disabled nil)
(put 'eval-expression 'disabled nil)       ; enable ESC-: eval-expression 
(setq font-lock-maximum-decoration t)      ; use colours in font lock mode
(setq font-lock-maximum-size nil)          ; trun off limit on font lock mode
(add-hook 'find-file-hooks 'my-find-file-hook)  ; setup when a file is loaded
(add-hook 'c-mode-hook 'customize-cc-mode) ; cc-mode setup
(add-hook 'java-mode-hook 'customize-java-mode) ; java-mode setup
(add-hook 'write-file-hooks 'time-stamp)
(setq message-log-max nil)
(condition-case nil (kill-buffer "*Messages*") (error nil) ) ; no messages buffer


;;
;; GNU/LINUX specifics
;;
(if t
  (progn
    (tool-bar-mode 0)      ;; turn off tool bar (Graphics can be slow over VPN etc)
    (tooltip-mode nil)     ;; turn off those tooltip on mouse etc, they pop up when iconised
    (scroll-bar-mode -1)   ;; turn off scroll bars
    (menu-bar-mode -1)
    (global-set-key [delete] `delete-char)
    ;; (set-default-font "Monospace 12")
    (set-face-attribute 'default (selected-frame) :height 118)
    ))

;;
;; 
;; Microsoft Windows specifics
;;
(if nil
 (progn
   (tool-bar-mode -1)   ;; turn off tool bar (Graphics can be slow over VPN etc)
   (tooltip-mode nil)   ;; turn off those tooltip on mouse etc, they pop up when iconised
   (scroll-bar-mode -1) ;; turn off scroll bars
   (menu-bar-mode -1)
   (column-number-mode t)
   (global-set-key [delete] `delete-char)
   (setq frame-title-format "Emacs: %b")
   (setq icon-title-format "Emacs: %b")
   (set-foreground-color "grep3")
   (setq grep-command "findstr /s /n /i ")
   (setq compile-command "build")
   (setq ediff-diff-options '"")
   ;; (set-default-font "Monospace 12")
   (set-face-attribute 'default (selected-frame) :height 118)
   ))


;;
;; Attempt to set start up size on a windowing system
;;

(if t
  (progn
    (set-frame-height (selected-frame) 45)
    (set-frame-width (selected-frame) 120)
    (set-frame-size (selected-frame) 120 45)
    (set-frame-position (selected-frame) 400 80)))

;;
;; useful function to extend auto-mode-alist
;;
(defun auto-mode (pattern function)
  (setq auto-mode-alist
    (cons (cons pattern function) auto-mode-alist)))

;;
;; html-helper-mode stuff
;;
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq html-helper-do-write-file-hooks t)

;;
;; extra mode setup
;;
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic Mode." t)
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(setq html-helper-do-write-file-hooks t)

;;
;; File/Mode Bindings
;;
(auto-mode "\\.lua$" 'lua-mode)
(auto-mode "\\.html$" 'html-helper-mode)
(auto-mode "\\.jsp$" 'html-mode)
(auto-mode "\\.py$" 'python-mode)
(auto-mode "\\.vb$" 'visual-basic-mode)
(auto-mode "\\.vbs$" 'visual-basic-mode)
(auto-mode "\\.xsl$" 'sgml-mode)
(auto-mode "\\.xslt$" 'sgml-mode)
(auto-mode "\\.js$" 'java-mode)
(auto-mode "\\.groovy$" 'groovy-mode)
(auto-mode "\\.ear$" 'archive-mode)
(auto-mode "\\.war$" 'archive-mode)
(auto-mode "\\.el$" 'lisp-interaction-mode)

;;
;; Auto Mode based on #!/bin/xxx
;;

(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;
;; load in CUA mode
;;
;(require 'cua)
;; disable by default F12 C-c to enable or toggle
;(cua-mode)
;(cua-mode)


;; knock out some irritations
(global-unset-key "\C-Xf")        ;; C-X f too easy to hit with C-X C-F
(global-unset-key "\C-X\C-D")	  ;; C-X C-D dired makes this redundant
(global-unset-key (kbd "M-k"))    ;; make Esc-k available
(global-unset-key (kbd "M-m"))    ;; make Esc-m available

;;
;; key bindings
;;
(global-set-key "\C-X\C-B" 'buffer-menu)
(global-set-key "\C-Xn" 'my-cycle-buffers)
(global-set-key "\C-X?" 'describe-key-briefly)
(global-set-key [f7] 'other-window)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [(control home)] 'beginning-of-buffer)
(global-set-key [(control end)] 'end-of-buffer)
(global-set-key [(control f1)] `search-forward-regexp)
(global-set-key (kbd "C-u") 'undo)
(define-key esc-map [right] 'kill-word)         ;; esc -> kill-word
(define-key esc-map [left] 'backward-kill-word) ;; esc <- backward-kill-word
(global-set-key (kbd "C-x c") 'my-edit-dot-emacs)         ; C-x c

;;
;; Setup Alt Keys
;;
(if t
  (progn
    (global-set-key [(alt home)] `beginning-of-buffer)
    (global-set-key [(alt end)] `end-of-buffer)
    ;(global-set-key [(alt right)] `forward-word)
    ;(global-set-key [(alt left)] `backward-word)
    (global-set-key [(alt a)] `my-duplicate-line)
    (global-set-key [(alt b)] `buffer-menu)
    (global-set-key [(alt c)] `clipboard-kill-ring-save)   ; same s copy from menu bar
    (global-set-key [(alt d)] `my-delete-line) 
    (global-set-key [(alt e)] `call-last-kbd-macro)        ; C-x e
    (global-set-key [(alt f)] `find-file)                  ; C-x C-f
    (global-set-key [(alt g)] `goto-line)
    (global-set-key [(alt i)] `clipboard-yank)             ; C-y
    (global-set-key [(alt k)] `kill-line)                  ; C-k
    (global-set-key [(alt l)] `logify)                     ; (logify, kbd macro)
    (global-set-key [(alt m)] `my-set-mark-command)        ;
    (global-set-key [(alt n)] `my-cycle-buffers)
    (global-set-key [(alt o)] `delete-other-windows)       ; C-x 1
    (global-set-key [(alt p)] `next-error)                 ; C-x `
    (global-set-key [(alt q)] `my-kill-current-buffer)     ; C-x k RET
    (global-set-key [(alt r)] `insert-file)                ; C-x i 
    (global-set-key [(alt s)] `split-window-vertically)    ; C-x 2 
    (global-set-key [(alt t)] `query-replace)              ; ESC-%
    (global-set-key [(alt u)] `advertised-undo)            ; C-x u
    (global-set-key [(alt v)] `find-file-read-only)        ; C-x 4 r
    (global-set-key [(alt w)] `save-buffer)                ; C-x C-S
    (global-set-key [(alt y)] `yank)                       ; C-y
    (global-set-key [(alt z)] `iconify-or-deiconify-frame) ; C-z
    (global-set-key [(alt \;)] `comment-line)              ; C-x C-;

    ;; add bits to org when using ALT keys
    (add-hook 'org-mode-hook
      (lambda ()
	;; add key bindings that need to work in org-mode that use the ALT key
	(local-set-key [(alt right)] `org-metaright)          ;; alt-right
	(local-set-key [(alt left)] `org-metaleft)            ;; alt-left
	;;
	))
    ))

;;
;; Using Esc instead of Alt keys
;;
(if nil
  (progn
    (global-set-key (kbd "M-a") `my-duplicate-line)
    (global-set-key (kbd "M-b") `buffer-menu)
    (global-set-key (kbd "M-c") `clipboard-kill-ring-save)   ; same s copy from menu bar
    (global-set-key (kbd "M-d") `my-delete-line) 
    (global-set-key (kbd "M-f") `find-file)                  ; C-x C-f
    (global-set-key (kbd "M-g") `goto-line)                  ; 
    (global-set-key (kbd "M-i") `clipboard-yank)             ; C-y
    (global-set-key (kbd "M-k") `kill-line)                  ; C-k
    (global-set-key (kbd "M-m") `my-set-mark-command)        ;
    (global-set-key (kbd "M-n") `my-cycle-buffers)
    (global-set-key (kbd "M-o") `delete-other-windows)       ; C-x 1
    (global-set-key (kbd "M-s") `split-window-vertically)    ; C-x 2
    (global-set-key (kbd "M-t") `query-replace)
    (global-set-key (kbd "M-q") `my-kill-current-buffer)     ; C-x k RET
    (global-set-key (kbd "M-w") `save-buffer)                ; C-x C-S
    ))


;;
;; setting up F12 as a keymap
;;

(defvar my-use-f12-keys nil)

(if my-use-f12-keys
  (progn
    (setq my-map-f12 (make-keymap))
    (define-key global-map [f12] my-map-f12)

    (define-key my-map-f12 "a" 'auto-fill-mode)            ; F12-a
    (define-key my-map-f12 "b" 'my-toggle-fix-backspace)   ; F12-b
    (define-key my-map-f12 "c" 'compile)                   ; F12-c
    (define-key my-map-f12 "d" 'my-insert-timestamp)       ; F12-d
    (define-key my-map-f12 "e" 'my-edit-dot-emacs)         ; F12-e
    (define-key my-map-f12 "f" 'my-load-file-at-line-edit) ; F12-f
    (define-key my-map-f12 "v" 'my-load-file-at-line-view) ; F12-v
    (define-key my-map-f12 "g" 'my-grep)                   ; F12-g
    (define-key my-map-f12 "k" 'my-bold-keyword-toggle)    ; F12-k
    (define-key my-map-f12 "l" 'my-toggle-truncate-lines)  ; F12-l
    (define-key my-map-f12 "n" 'my-load-notes-file)        ; F12-n
    (define-key my-map-f12 "m" 'menu-bar-mode)             ; F12-m
    ;;(define-key my-map-f12 "p" 'ps-print-buffer)         ; F12-p
    (define-key my-map-f12 "p" 'my-load-project-file)      ; F12-p
    (define-key my-map-f12 "r" 'my-reload-buffer)          ; F12-r
    (define-key my-map-f12 "s" 'ispell-buffer)             ; F12-s
    (define-key my-map-f12 "t" 'my-toggle-tabstops)        ; F12-t
    (define-key my-map-f12 "i" 'my-insert-import-stmt)     ; F12-i
    ))

;; magit

(if nil
  (progn
    (require 'magit)
    (global-set-key (kbd "M-m") 'magit-status)))

;; javascript mode

(if t
  (progn
    (require 'js2-mode)
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    (add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
    ))


(defun my-find-file-hook()
 "hgb hooks for when file is loaded"
 (interactive)
 ;; truncate lines for each file openned. We don't do
 ;; this using setq-default as it also effects the minibuffer and I want
 ;; to use resize-minibuffer-mode"
 (setq truncate-lines 1)
 (turn-on-font-lock)       ;; not needed for xemacs
;; (transient-mark-mode -1)  ;; no highlight of marked region by default
)

;;
;; does not report status properly, dont know how to read
;; status of cua-mode
;;
(defun my-toggle-cua-mode()
  "toggle cua-mode and report status"
  (interactive)
  (cua-mode)
)

;;
;; wrapper for set-mark so that we report if CUA-mode is active
;; [does not work as cua-mode now has its own
;; cua-set-mark-command ]
;;
(defun my-set-mark-command()
  "call set-mark-command, warn if CUA-mode is active"
  (interactive)
  (set-mark-command 'nil)
  ;; first check if CUA-mode is loaded at all
  (if (fboundp 'cua-mode)
	(progn
	  ;; if CUA-mode is active then warn
	  (if cua-mode
		(progn (message "WARNING CUA-mode is active"))
		) ;; if CUA-mode
	  ) ;; prog
	) ;; if fbound CUA-mode
)


;; setup cc-mode
(defun customize-cc-mode()	      
  (setq c-default-style "linux")
  (c-set-offset 'substatement-open 0)
  (setq c-basic-offset 8)
  (setq c-indent-level 8)
  (setq comment-column 40)
;;  (setq c-auto-newline t)    ; auto newlines after {}:;  toggle C-C C-T
  (setq indent-tabs-mode t)
  (define-key c-mode-map "\C-m" 'newline-and-indent)
;; c-tab-always-indent
;; Any other value (not `nil' or `t') means always reindent the line
;; and also insert a tab if within a comment, a string, or a
;; preprocessor directive.
;;  (setq c-tab-always-indent nil)
)

(defun customize-java-mode()	      
  (setq c-basic-offset 4)
  (c-toggle-hungry-state -1)
  (c-toggle-auto-state -1)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label 4) 
  (c-set-offset 'arglist-intro 4) 
  (c-set-offset 'arglist-close 4) 
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-cont-nonempty 4)
  ;; make C-L to refontify
  (define-key java-mode-map "\C-l" 'font-lock-fontify-buffer)
;; comment out to avoid auto newline after {
;;  (setq c-hanging-braces-alist '( (block-close . c-snug-do-while)) )
;;  (message "customize-java-mode()")
)

(defun my-delete-line()
 "delete the current line"
 (interactive)
 (beginning-of-line)
 (let ((beg (point))) (forward-line 1) (kill-region beg (point)))
  )

(defun my-duplicate-line()
 "duplicate the current line"
 (interactive)
 (beginning-of-line)
 ;;(let ((beg (point))) (next-line 1) (copy-region-as-kill beg (point)))
 (let ((beg (point))) (forward-line 1) (kill-ring-save beg (point)))
 (yank)
 (next-line -1)
  )

(defun my-kill-current-buffer()
 "kills the current buffer"
 (interactive)
 (kill-buffer (current-buffer))
  )

(defun my-reload-buffer()
  "reload the current file from disk"
  (interactive)
  (setq ofile (buffer-file-name (current-buffer)))
  (kill-buffer (current-buffer))
  (find-file ofile)
  (message ofile)
  )


(defun my-cycle-buffers()
 "cycle round buffers"
 (interactive)
 ;;
 ;; force delete junk buffers, even if don't exit
 ;;
 (condition-case nil (kill-buffer "*Buffer List*") (error nil) )
 (condition-case nil (kill-buffer "*Messages*") (error nil) )
 (condition-case nil (kill-buffer "*info*") (error nil) )
 (condition-case nil (kill-buffer "*Completions*") (error nil) )
 (condition-case nil (kill-buffer "*Apropos*") (error nil) )
 (condition-case nil (kill-buffer "*Help*") (error nil) )
 (condition-case nil (kill-buffer "*vc*") (error nil) )
 (condition-case nil (kill-buffer "*vc-diff*") (error nil) )
 (condition-case nil (kill-buffer "*Ediff Registry*") (error nil) )
 (switch-to-buffer (other-buffer))
 (bury-buffer (current-buffer))
)

(defun my-toggle-truncnate-lines()
 "toggle truncate-lines"
 (interactive)
 (setq truncate-lines (not truncate-lines))
 (redraw-display)
)

(defun my-toggle-tabstops()
 "toggle tab stops between 4 and 8 columns"
 (interactive)
 (if (equal tab-width 4)
   (progn
     (setq tab-width 8)
   )
   (progn
     (setq tab-width 4)
   )
 )
 (redraw-display)
)

(defun my-insert-timestamp()
  "insert the current timestamp"
  (interactive)
  ;;(insert (current-time-string))
  (insert 
	(concat 
	  (substring (current-time-string) 8 10)
	  "-"
	  (substring (current-time-string) 4 7)
	  "-"
	  (substring (current-time-string) 20 24)
	)
  )
)

(defun my-html-quote-pre-text()
  "quote all &, < and > in HTML <pre> style text so that they are not
interpretted in HTML as tags.  This function operates on a region of
text. The region is narrowed operated on and then widened so that all
replacements are only done on that region"
  (interactive)
  (save-excursion)
  (narrow-to-region (mark) (point) )

  ;; change all & to &amp;
  (goto-char (mark))
  (while (search-forward "&" nil t)
    (replace-match "&amp;" nil t))

  ;; change all < to &lt;
  (goto-char (mark))
  (while (search-forward "<" nil t)
    (replace-match "&lt;" nil t))

  ;; change all > to &gt;
  (goto-char (mark))
  (while (search-forward ">" nil t)
    (replace-match "&gt;" nil t))

  (goto-char (mark))
  (insert "<pre>")
  (newline-and-indent)

  (end-of-buffer)
  (newline-and-indent)
  (insert "</pre>")
  (newline-and-indent)

  (widen)
)

;;
;; example so that I can remember how todo this
;; run from command-buffer or call from a lisp function
;; cannot call through Ctrl+J in scratch buffer
;;
(defun my-ask(arg)
  "Ask a question and get answer into a variable called arg"
  (interactive "sMy prompt: \n")
  (message arg))

;;
;; another example that we will keep
;;
(defun tryif(tval)
  (if tval
	(progn
	  (message "TRUE")
	  )
	(progn
	  (message "FALSE")
	  )
	);; if
)

(defun my-grep()
  "run a grep on the variable name under point"
  (interactive)
  (save-excursion)
  (backward-word)
  (setq p1 (point))
  (forward-word)
  (setq p2 (point))
  (setq searchstr (buffer-substring p1 p2))
  (setq grepcmd (concat "grep -ni " searchstr " *.c *.h"))
  (grep grepcmd)
  )

(defun my-edit-filelist()
  "open filelist for editing"
  (interactive)
  (save-excursion)
  (setq my-source-file-buffer (current-buffer))
  (if (or (eq window-system 'w32) (eq window-system 'win32))
	(progn (find-file my-project-filelist-win))
	(progn (find-file my-project-filelist-unix))
	);; if
  (beginning-of-buffer)
  )

(defun my-load-file-at-line-edit()
  (interactive)
  (my-load-file-at-line t)
  )

(defun my-load-file-at-line-view()
  (interactive)
  (my-load-file-at-line nil)
  )

(defun my-load-file-at-line(edit)
  "view filename listed on current line"
  (interactive)
  (save-excursion)
  (beginning-of-line)
  (setq p1 (point))
  (end-of-line)
  (setq p2 (point))
  (setq projfile (buffer-substring p1 p2))
  (if edit
	(progn (find-file projfile))
	(progn (find-file-read-only projfile))
	);; if
  (condition-case nil (kill-buffer "filelist.txt") (error nil) )
  (message "loaded %s" projfile)
  )

(defun my-load-notes-file()
 "load my notes file"
  (interactive)
  (if (or (eq window-system 'w32) (eq window-system 'win32))
	(progn
	  (find-file my-notes-file)
	  (find-file my-notes-dir)
	  )
	(progn (find-file my-notes-file-unix1))
	(progn (find-file my-notes-file-unix2))
	);; if
)

(defun my-edit-dot-emacs()
 "edit my .emacs file"
  (interactive)
  ;; works on Windows provided HOME=c:/xxx set for the root of emacs
  (find-file (file-chase-links "~/.emacs"))
  (lisp-interaction-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; seperating ALT and META on X-Windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; ! PROBLEM: The Alt/Meta key binding on X Windows and PCs often
;; ! bound togther.
;; !
;; ! $ xmodmap   # check the output and bindings
;; ! xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):
;; !
;; ! shift       Shift_L (0x32),  Shift_R (0x3e)
;; ! lock        Caps_Lock (0x42)
;; ! control     Control_L (0x25),  Control_R (0x69)
;; ! mod1        Alt_L (0x40),  Meta_L (0xcd)
;; ! mod2        Num_Lock (0x4d)
;; ! mod3      
;; ! mod4        Super_L (0x85),  Super_R (0x86),  Super_L (0xce),  Hyper_L (0xcf)
;; ! mod5        ISO_Level3_Shift (0x5c),  Mode_switch (0xcb)
;; !
;; ! # The problem here is that mod1 bound to Alt and Meta, they need to be
;; ! # seperated. Also:
;; !
;; ! $ xmodmap -pke |grep Meta  ## check the actual keys
;; ! keycode  64 = Alt_L Meta_L Alt_L Meta_L
;; ! keycode 205 = NoSymbol Meta_L NoSymbol Meta_L
;; !
;; ! # we can see that Alt_L and Meta are bound to key 64
;; ! # so they have to be split as well
;; ! # note that ! is the xmodmap comment symbol
;; ! SOLUTION: use the following scipt in  .xmodmaprc or .Xmodmap
;; 
;; clear mod1
;; clear mod3
;; keycode 64 = Alt_L Alt_L Alt_L Alt_L
;; add mod1 = Alt_L
;; add mod3 = Meta_L
;;
;; On Ubuntu 14.04 xmodmap is no longer used
;; have to force it to be run on Gnome start up
;; append the following line to ~/.profile
;; (sleep 4; /usr/bin/xmodmap ~/.Xmodmap)&
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "lua_mode")

;;(add-to-list 'load-path "/home/hugh/Gits/magit")
;;(eval-after-load 'info
;;  '(progn (info-initialize)
;;          (add-to-list 'Info-directory-list "/home/hugh/Gits/magit/")))


;;
;;  org-mode setup
;;

;; setup code snippets in org mode
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

;; for Minted Setup
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; set some sensible margins
;; But sadly, this causes the rendering of source code ourput to BREAK !!
;(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))

;;
;; Chromebook settings for Org mode
;;

;; we dont want these global it is a problem everywhere else
;;
;;(global-set-key [prior] 'org-move-subtree-up) ;; chromebook alt-up
;;(global-set-key [next] 'org-move-subtree-down) ;; chromebook alt-up

(add-hook 'org-mode-hook
  (lambda ()
    ;; add key bindings that need to work in org-mode that use the ALT key
    (local-set-key [prior] 'org-move-subtree-up)              ;; chromebook alt-up
    (local-set-key [next] 'org-move-subtree-down)             ;; chromebook alt-up
    (local-set-key (kbd "M-<right>") 'org-metaright)          ;; chromebook alt-right
    (local-set-key (kbd "M-<left>")  'org-metaleft)           ;; chromebook alt-left
    ;;
    ))

;; Chromebook setup, no page down, page up keys
(global-set-key (kbd "C-<up>")  'scroll-down-command) ;; control-up 
(global-set-key (kbd "C-<down>")  'scroll-up-command) ;; control-down


;;
;; Melpa package manger setup
;;
(require 'package)
(setq package-archives '()) ;; ditch the useless GNU One
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; uncomment these when needed to refresh
;;(package-initialize)
;;(package-refresh-contents)


;;
;; load my custom theme
;;
;; use M-x customize-create-theme to create a theme
;; by default when you save it will be stored in ~/.emacs.d

(setq custom-safe-themes t)                   ;; I will trust custom themes
(setq custom-theme-directory "~/site_lisp/")  ;; I want my customer themes in here
;;(load-theme 'myflatline)
(load-theme 'my-solarized)
;;(load-theme 'my-basic)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(js2-mode impatient-mode magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
