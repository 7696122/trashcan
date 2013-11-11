(setq delete-by-moving-to-trash t)

(cond ;; trash directory
 ((eq system-type 'darwin)
  (setq trash-directory (expand-file-name ".Trash" (getenv "HOME"))))
 ((eq system-type 'gnu/linux)
  (setq trash-directory (expand-file-name ".local/share/Trash/files" (getenv "HOME"))))
 ((eq system-type 'windows-nt)
  ;; TODO:
  ))

(defun empty-trash ()
  "Empty Trash Can."
  (interactive)
  (open-trash)
  (if (yes-or-no-p "Do you empty trash can? ")
      (dolist (dir (f-files trash-directory))
        (f-delete dir t))))

(defun open-trash ()
  "Dired in Trash Can."
  (interactive)
  (dired trash-directory)
  (rename-buffer "*trash-can*"))

(provide 'trashcan)
