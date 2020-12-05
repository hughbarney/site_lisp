
(defun my-load-project-file()
  "my load file"
  (interactive)
  (save-excursion)
  (find-file-read-only "~/emacs_lisp/filelist.txt")
  (beginning-of-line)

  ;;(let ((file-name (dired-get-filename))))


  ;;(let ((beg (point))) (end-of-line) (copy-region-as-kill beg (point)))
  (message file-name)
)

