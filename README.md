This is Melanie Mitchell's Copycat.  It uses the Flavors object-oriented extension that
originated in Lisp Machine Lisp, so as distributed, it was not portable Common Lisp code.
(There are, I gather, at least two commercial CL implementations that support Flavors, but
AFAIK none of the open-source ones have it.)  I have made it run in Common Lisp, however,
by reimplementing, on top of CLOS, some of the Flavors functionality (see
`src/defs.lisp`).  It's certainly not a full Flavors implementation, nor is it
particularly optimized, but it's enough to run Copycat.

The graphics code was written to work with Lucid CL.  I have not attempted to port it to
something else, or indeed, even looked into how to do that.  I am just running Copycat
from the REPL.  If anyone wants to get the graphics working, I would be happy to merge
your PR.

The original Copycat distribution can be found [on Melanie Mitchell's
site](https://melaniemitchell.me/ExplorationsContent/how-to-get-copycat.html).  I don't
see anything that looks like a license in this distribution, so I tentatively conclude
that her intent was to place the code in the public domain.

All I have done to this code is:

- Rename the files from `.l` to `.lisp`
- Reorganize them into `src/` and `src/graphics/` subdirectories
- Delete trailing whitespace
- Define a `copycat:` package (which shadows `defmethod`) and put all the files in it
- Add the minimal Flavors implementation, and get the code to build cleanly with it
- Make it ASDF-loadable
- Add `:verbose` and `:slighly-verbose` arguments to `init-ccat`

I've added a few comments, marked with `[SLB]`.

To run, just put it in `quicklisp/local-projects/` or wherever you put such things (or
maybe it will be in Quicklisp by the time you read this), do `(ql:quickload "copycat")`,
and then:

```common-lisp
> (in-package :copycat)
> (init-ccat "abc" "abd" "ijk")
```

Tested only on SBCL so far, but I'll be pretty surprised if there are any portability
issues.  (Do report them, of course, if you run into them.)

You may also be interested in these Copycat reimplementations:
- [One in Python](https://github.com/jalanb/co.py.cat) by J. Alan Brogan
- [Another one in Python](https://github.com/fargonauts/copycat) by Lucas Saldyt
- [A Java port](https://github.com/speakeasy/CopyCat) by "speakeasy"
- [A JavaScript port](https://github.com/Paul-G2/copycat-js) by "Paul-G2"; you can run it
in your browser by going [here](https://paul-g2.github.io/copycat-js/) (recommended)
