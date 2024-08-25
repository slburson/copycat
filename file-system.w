File System Routines for Lucid Common Lisp
------------------------------------------

DEFSYS name list-of-files  

This function sets up a file system of
lisp files that make up a program.  Once a file
system has been defined, then the command RELOAD
can be used to load only those files that have been
modified since the last call to RELOAD, and the 
command UPDATE can be used to compile only those
files which have been modified since the last compile.
These commands are very useful for handling programs
made up of a large number of files.  The NAME parameter
gives the name for the file system, and the LIST-OF-FILES
parameter gives a list of all the files used in the program.
The file system commands assume that all files end with a ".l".
This should probably be generalized by someone, because by
default, Lucid Common Lisp expects files to end in ".lisp".
But if you put the command 
    (setq *load-source-pathname-types* '("l" NIL))  
in your lisp-init.lisp file, then Lucid will expect files to end in ".l".
Example: (defsys 'ccat-sys '("relations" "correspondences" "slipnet-def"
                             "cyto-graphics"))


RELOAD &optional file-system  

Loads all files in the current file system that have been modified 
since the last call to RELOAD.  If RELOAD is being called for the 
first time in a Lisp session, loads all the files in the current
file system.  If the optional FILE-SYSTEM argument is given, then
RELOAD loads files from that file system.  (Every time DEFSYS is
called, the new file system becomes the current file system.
Example: (reload)
         (reload 'ccat-sys)


UPDATE &optional file-system  

Compiles all files that are out of date (i.e., whose
".l" version is newer than its ".lbin" version).
Example: (update)
         (update 'ccat-sys)


SELECT-FILE-SYSTEM file-system  

Sets the current file system to be the given file system.
Example: (select-file-system 'ccat-sys)
