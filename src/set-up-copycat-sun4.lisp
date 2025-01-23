(in-package 'user)

(defun set-up-copycat ()
  ; Put compiler in production mode for optimized code.
  (proclaim '(optimize (compilation-speed 0) (safety 1) (speed 3)))

  ; Compile source files that have been modified since they were last compiled.
  (if (or (null (file-write-date "lucid-util.sbin"))
	  (> (file-write-date "lucid-util.l")
             (file-write-date "lucid-util.sbin")))
      (compile-file "lucid-util.l"))

  (if (or (null (file-write-date "file-system-sun4.sbin"))
	  (> (file-write-date "file-system-sun4.l")
             (file-write-date "file-system-sun4.sbin")))
      (compile-file "file-system-sun4.l"))

  (if (or (null (file-write-date "load-lucid-graphics-sun4.sbin"))
          (> (file-write-date "load-lucid-graphics-sun4.l")
             (file-write-date "load-lucid-graphics-sun4.sbin")))
      (compile-file "load-lucid-graphics-sun4.l"))


  ; Load binaries.
  (load "lucid-util.sbin")
  (load "file-system-sun4.sbin")
  (load "load-lucid-graphics-sun4.sbin")

  ; Compile (if necessary) and load Copycat files
  (load "ccat-sys.l")
  (update))
                       
