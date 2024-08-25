(in-package 'user)

(defun set-up-copycat ()
  ; Put compiler in production mode for optimized code.
  (proclaim '(optimize (compilation-speed 0) (safety 1) (speed 3)))

  ; Compile source files that have been modified since they were last compiled.
  (if (or (null (file-write-date "lucid-util.lbin"))
	  (> (file-write-date "lucid-util.l")
             (file-write-date "lucid-util.lbin")))
      (compile-file "lucid-util.l"))

  (if (or (null (file-write-date "file-system-sun3.lbin"))
	  (> (file-write-date "file-system-sun3.l")
             (file-write-date "file-system-sun3.lbin")))
      (compile-file "file-system-sun3.l"))

  (if (or (null (file-write-date "load-lucid-graphics-sun3.lbin"))
          (> (file-write-date "load-lucid-graphics-sun3.l")
             (file-write-date "load-lucid-graphics-sun3.lbin")))
      (compile-file "load-lucid-graphics-sun3.l"))


  ; Load binaries.
  (load "lucid-util.lbin")
  (load "file-system-sun3.lbin")
  (load "load-lucid-graphics-sun3.lbin")

  ; Compile (if necessary) and load Copycat files
  (load "ccat-sys.l")
  (update))
                 
