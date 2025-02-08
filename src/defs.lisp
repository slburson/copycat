(in-package :cl-user)

(defpackage :copycat
  (:use :cl)
  (:shadow #:defmethod))

(in-package :copycat)

; Proclaim constants and global variables.
(proclaim
    '(special
         ; WORKSPACE CONSTANTS AND GLOBAL VARIABLES
	 *initial-string* *modified-string* *target-string* *answer-string*
	 *rule* *translated-rule* *snag-structure-list* *workspace*
	 %length-description-probability-vector%
	 %very-low-answer-temperature-threshold-distribution%
	 %low-answer-temperature-threshold-distribution%
	 %medium-answer-temperature-threshold-distribution%
         %high-answer-temperature-threshold-distribution%
         %very-high-answer-temperature-threshold-distribution%
         *codelet-count* *temperature* *codelets-to-post* *found-answer*
         *snag-condition* *snag-count* *single-letter-group-count*
	 *single-letter-group-at-end-count* *length-description-count*
	 *length-relevant-at-end*
	 *clamp-temperature* *snag-object*
	 *last-snag-time* *quit-program*
	 *updating-everything* *i* *m* *t* *a* %built%
	 *modified-letter-list* *changed-length-group*
	 *amount-length-changed*
	 *break-on-each-step*

         ; CODERACK CONSTANTS AND GLOBAL VARIABLES
         *coderack* %codelet-types% %codelet-short-names%
	 %max-coderack-size%
         %coderack-bin-names% %urgency-value-array% %num-of-urgency-bins%
         *coderack-bins* *extremely-low-bin* *very-low-bin* *low-bin*
	 *medium-bin* *high-bin* *very-high-bin* *extremely-high-bin*
         *urgency-list* *codelet-list*

         ; SLIPNET CONSTANTS AND GLOBAL VARIABLES
         plato-one plato-two plato-three plato-four plato-five
	 %max-activation%  %workspace-activation%
         %initial-slipnode-clamp-time% %full-activation-threshold%
         plato-string-position-category
	 plato-sameness plato-object-category
	 plato-letter-category
         plato-leftmost plato-rightmost plato-middle
         *initially-clamped-slipnodes* plato-a plato-b  plato-c plato-d
         plato-e plato-f plato-g plato-h plato-i plato-j plato-k plato-l
         plato-m plato-n plato-o plato-p plato-q plato-r plato-s plato-t
         plato-u plato-v plato-w plato-x plato-y plato-z
	 plato-length
         plato-alphabetic-position-category
         plato-direction-category plato-bond-category plato-group-category
         plato-letter plato-group plato-first plato-last
	 plato-single plato-whole plato-left plato-right
         plato-predecessor plato-successor plato-predgrp
	 plato-succgrp plato-samegrp plato-identity plato-opposite
	 plato-bond-facet *slipnet-letters* *slipnet-numbers* *slipnet*
	 *nodes-to-display*
	 a-letter-category-link z-letter-category-link
	 1-length-link 2-length-link
	 samegrp-letter-category-link predgrp-length-link
	 succgrp-length-link samegrp-length-link
	 first-last-link last-first-link
         leftmost-rightmost-link rightmost-leftmost-link left-right-link
	 right-left-link predgrp-succgrp-link
         successor-predecessor-link predecessor-successor-link
	 succgrp-predgrp-link a-first-link  z-last-link
         letter-object-category-link object-category-letter-link
         group-object-category-link object-category-group-link
         leftmost-string-position-category-link
         string-position-category-leftmost-link
         rightmost-string-position-category-link
         string-position-category-rightmost-link
         middle-string-position-category-link
         string-position-category-middle-link
         single-whole-link whole-single-link
         string-position-category-single-link
         single-string-position-category-link
         string-position-category-whole-link
         whole-string-position-category-link
         first-alphabetic-position-category-link
         alphabetic-position-category-first-link
         last-alphabetic-position-category-link
         alphabetic-position-category-last-link
         left-direction-category-link direction-category-left-link
         right-direction-category-link direction-category-right-link
         predecessor-bond-category-link bond-category-predecessor-link
         successor-bond-category-link bond-category-successor-link
         sameness-bond-category-link bond-category-sameness-link
         predgrp-group-category-link
	 group-category-predgrp-link succgrp-group-category-link
         group-category-succgrp-link samegrp-group-category-link
         group-category-samegrp-link sameness-samegrp-link
         samegrp-sameness-link
         successor-succgrp-link succgrp-successor-link
         predecessor-predgrp-link predgrp-predecessor-link
         letter-category-bond-facet-link bond-facet-letter-category-link
         length-bond-facet-link bond-facet-length-link
         letter-category-length-link
         length-letter-category-link
	 letter-group-link group-letter-link left-leftmost-link
         leftmost-left-link right-leftmost-link leftmost-right-link
	 right-rightmost-link rightmost-right-link leftmost-first-link
	 first-leftmost-link rightmost-first-link first-rightmost-link
	 leftmost-last-link last-leftmost-link rightmost-last-link
	 last-rightmost-link left-rightmost-link rightmost-left-link
         indent visited-nodes

         ; GRAPHICS CONSTANTS AND GLOBAL VARIABLES
         %slipnet-font% %slipnet-letter-font%
	 %slipnet-activation-font% %workspace-font% %group-font%
	 %rule-font%
	 %relevant-concept-mapping-font%  %irrelevant-concept-mapping-font%
         %coderack-font% %codelet-name-font% 	%minimal-coderack-font%
         *old-minimal-coderack-string* %relevant-description-font%
	 %irrelevant-description-font% %relevant-length-font%
	 %irrelevant-length-font% %temperature-font% %codelet-group-font%
         %codelet-name-font-height% %group-font-height%
         %slipnet-font-height% %slipnet-activation-font-height%
	 %relevant-concept-mapping-font-height%
	 %graphics-rate% *description-graphics-obj-list*
         %window-width% %window-height%
         %slipnet-x% %slipnet-y%
         %slipnet-width%
         %slipnet-height%
         slipnode-region-height
         slipnode-region-width
         *slipnode-boxsizes*
         %rule-mode% %translated-rule-mode%
         %coderack-x1% %coderack-y1% %coderack-x2%
	 %coderack-y2%
         *coderack-bar-graph* *waiting-codelets-string*
         %waiting-codelets-string-x% %waiting-codelets-string-y%
	 %minimal-coderack-x% %minimal-coderack-y% %minimal-coderack-string%
         %space-between-descriptions%  %light-intensity% %medium-intensity%
	 %jag-length% %long-bond-dash-length% %medium-bond-dash-length%
         %short-bond-dash-length%
         %long-bond-space-length% %medium-bond-space-length%
         %short-bond-space-length%
         %group-space-length%
         %bond-left-x-offset% %bond-right-x-offset% %bond-y-offset%
         %concept-mapping-x-offset%  %concept-mapping-y-offset%
         %group-concept-mapping-y-offset%
         %string-spanning-group-concept-mapping-x-offset%
         %string-spanning-group-concept-mapping-y-offset%
         %vertical-jag-length%
         %short-correspondence-dash-length%
         %long-correspondence-dash-length%
         %correspondence-space-length%
         %space-between-concept-mappings%
         %concept-mapping-text-width%
         %arrow-x% %origin-x% %origin-y%
         %arrow-width% %left-side-space% %right-side-space% %middle-space%
         %string-width% %initial-space%
         %modified-space% %target-space% %answer-space%
         %y-top% %y-bottom%
         %rule-y% %translated-rule-y%
         %replacement-x-offset% %replacement-y-offset%
         %left-concept-mapping-x-offset%
         %right-concept-mapping-x-offset%
         %left-group-concept-mapping-x-offset%
         %right-group-concept-mapping-x-offset%
         %initial-x% %modified-x% %target-x% %answer-x%
         %temperature-display-width%
         %temperature-display-height%
         %temperature-number-x% *old-temperature-string* *old-temperature-y*
         %heavy-intensity%
         %short-group-dash-length% %long-group-dash-length%
         long-correspondence-dash-length%
         %correspondence-short-space%
         %horizontal-jag-length%
         i-vector m-vector t-vector
         %codelet-name-top-y% %codelet-name-bottom-y%
         %temperature-display-x1%
         %temperature-display-y1%
         %temperature-display-x2%
         %temperature-display-y2%
         *temperature-height*

         ; OTHER CONSTANTS AND GLOBAL VARIABLES
         %verbose% %slightly-verbose%
         %demo-graphics% %workspace-graphics%
	 %coderack-graphics%
         %minimal-coderack-graphics%
	 %slipnet-graphics% %slipnet-display-level%
         %description-graphics%
         *workspace-initialized* *coderack-initialized*
	 *slipnet-initialized*
         %temperature-graphics%  *init-time-menu*
         *run-time-menu* *begin-run-time-menu*
         %time-step-length% *random-state-this-run*
	 *data-file* *random-state-file* *summary-file*))


;;; ================================================================
;;; Moved here from `lucid-util.lisp'.

(declaim (inline sqr))
(defun sqr (x) (* x x))

(defmacro if* (&rest args &aux args-length if-clause then-clause
		               else-clause else-position)
; If-then-else macro.  This provides if-then-else statements of the form
; (if <stmt> then <stmt1> <stmt2> ... else <stmt1> <stmt2> ...)
  (cond ((not (eq (second args) 'then)) (cons 'if args))
        (t (setq args-length (length args))
           (if (< args-length 2) (error "if: not enough arguments."))
           (setq if-clause (car args))
           (setq else-position (position 'else args))
           (if (null else-position) (setq else-position args-length))
           (setq then-clause (subseq args 2 else-position))
           (if (< else-position args-length)
               (setq else-clause (subseq args (1+ else-position)
					      args-length))
               (setq else-clause (list nil)))
           `(cond ,(cons if-clause then-clause)
	          ,(cons t else-clause)))))


;;; ================================================================
;;; Miscellany

(declaim (inline memq))
(defun memq (item list)
  (member item list :test #'eq))

(defun append-symbols (&rest syms)
  (intern (apply #'concatenate 'string (mapcar #'string syms))))


;;; ================================================================
;;; Implementation of just enough Flavors functionality to run this code.

;;; I _think_ it's the case that the code only ever uses `send' to invoke methods,
;;; never `funcall', which if true means that this funcallable-instance stuff is
;;; superfluous.  But might as well do it anyway, just in case there's a `funcall'
;;; or `apply' somewhere, or we want to add one.
#+allegro (eval-when (:compile-toplevel :load-toplevel :execute)
	    (unless (c2mop:class-finalized-p (find-class 'c2mop:funcallable-standard-object))
	      (c2mop:finalize-inheritance (find-class 'c2mop:funcallable-standard-object))))

(defclass flavor-class (c2mop:funcallable-standard-class)
    ((flavor-method-table :initform (make-hash-table :test 'eq) :reader flavor-method-table)))

(cl:defmethod c2mop:validate-superclass ((c flavor-class) (sc c2mop:funcallable-standard-class))
  t)

(defclass flavor-object (#+allegro c2mop:funcallable-standard-object) ()
  (:metaclass flavor-class))

(cl:defmethod initialize-instance :after ((obj flavor-object) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (c2mop:set-funcallable-instance-function obj (lambda (&rest args) (apply #'%send obj args))))

(cl:defmethod print-object ((obj flavor-object) stream)
  ;; Not really the right way to do this -- the `:print' methods should take a stream.
  (let ((*standard-output* stream))
    (funcall obj :print)))

(defmacro defflavor (flavor slots supers &rest options)
  `(progn
     ;; We need to eval the `defclass' at compile time so that `%slot-names' can work.
     (eval-when (:compile-toplevel :load-toplevel :execute)
       (defclass ,flavor ,(append supers '(flavor-object))
	   ,(mapcar (lambda (slot)
		      (let ((name (if (consp slot) (car slot) slot))
			    (init-val (and (consp slot) (cadr slot))))
			`(,name :initform ,init-val
				,@(and (member ':initable-instance-variables options)
				       `(:initarg ,(intern (string name) (symbol-package ':initarg)))))))
		    slots)
	 (:metaclass flavor-class)))
     ,@(and (member ':gettable-instance-variables options)
	    (mapcar (lambda (slot)
		      (let* ((name (if (consp slot) (car slot) slot))
			     (kwd-name (intern (string name) (symbol-package ':test))))
			`(%define-method ',flavor ',kwd-name
					 (lambda (self)
					   (declare (type ,flavor self))
					   (slot-value self ',name)))))
		    slots))
     ,@(and (member ':settable-instance-variables options)
	    (mapcar (lambda (slot)
		     (let* ((name (if (consp slot) (car slot) slot))
			    (kwd-name (intern (concatenate 'string (string '#:set-) (string name))
					      (symbol-package ':test))))
		       `(%define-method ',flavor ',kwd-name
					(lambda (self value)
					  (declare (type ,flavor self))
					  (setf (slot-value self ',name) value)))))
		    slots))
     ',flavor))

(defmacro defmethod ((flavor method) params &body body)
  `(progn
     (%define-method ',flavor ',method
		     (lambda (self . ,params)
		       (declare (type ,flavor self))
		       ;; Empirically, it looks like parameters shadow instance variables
		       ;; rather than the converse.
		       (with-slots ,(remove-if (lambda (var)
						 (some (lambda (param)
							 (or (eq param var)
							     (and (consp param) (eq (car param) var))))
						       params))
					       (%slot-names flavor))
			   self
			 . ,body)))
     '(:method ,flavor ,method)))

(defun %slot-names (flavor)
  (let ((cls-obj (find-class flavor)))
    (unless (c2mop:class-finalized-p cls-obj)
      (c2mop:finalize-inheritance cls-obj))
    (mapcar #'c2mop:slot-definition-name (c2mop:class-slots cls-obj))))

(defun %define-method (flavor method-name func)
  (let* ((cls (find-class flavor))
	 (mtbl (flavor-method-table cls)))
    (setf (gethash method-name mtbl) func)))

(defun %send (obj method &rest args)
  ;; This implementation walks the inheritance DAG at dispatch time rather than having
  ;; `%define-method' add methods to subclasses.  The latter would be faster, but might
  ;; make consistency a little harder to maintain.  Maybe I'll change it later.
  (let ((func (dolist (cls (c2mop:class-precedence-list (class-of obj)))
		(when (eq (class-name (class-of obj))
			  #-allegro 'standard-object
			  #+allegro 'c2mop:funcallable-standard-object)
		  (return nil))		; (from `dolist')
		(let ((f (gethash method (flavor-method-table cls))))
		  (when f
		    (return f))))))
    (unless func
      (error "Object ~A does not have method ~S" obj method))
    (apply func obj args)))

(declaim (inline send))
(defun send (obj method &rest args)
  (apply obj method args))
