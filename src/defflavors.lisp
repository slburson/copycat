
(in-package :copycat)

;;; [SLB] SBCL, at least, is happier if all classes (flavors) are defined before being
;;; referenced; otherwise the compiler complains and generates worse code.  So I've
;;; moved some of them here.


(defflavor bond
    (left-string-position
     right-string-position
     bond-category ; e.g., plato-successor
     (direction-category nil) ; e.g., plato-right.
     from-obj to-obj ; The objects that the bond comes from and goes to.
     left-obj right-obj ; The leftmost and rightmost objects in the bond.
     bond-facet ; Which facet of the objects is being related,
                    ; e.g., plato-letter-category or plato-length.
     from-obj-descriptor ; Which descriptor of the from-obj is being
                         ; related, e.g., plato-a.
     to-obj-descriptor)  ; Which descriptor of the to-obj is being related,
                         ; e.g., plato-b.
    (workspace-structure)
    :gettable-instance-variables
    :settable-instance-variables
    :initable-instance-variables)

;---------------------------------------------

(defflavor group
    (group-category ; E.g., "succgrp" or "predgrp".
     (direction-category nil) ; E.g., "left" or "right".
     left-obj right-obj (middle-obj nil) ; The left, right, and middle (if any)
                                         ; objects in this group.
     left-obj-position right-obj-position ; The string-positions of the left
                                          ; and right objects in this group.
     object-list ; A list of the objects in this group.
     bond-list ; A list of the bonds in this group.
     bond-category ; The bond category associated with the
                       ; group-category (e.g., "successor" is associated with
                       ; "succgrp").
     (bond-facet nil) ; The description-type upon which the bonds making up
                         ; this group are based (i.e., letter-category or
                         ; length).
     (bond-descriptions nil) ; Descriptions involving the bonds
                                 ;  making up the group.  These are separated
				 ; from other descriptions since they are not
				 ; always used in the same way.
    structure-graphics-obj ; Graphics object for displaying group.
    )
    (workspace-object workspace-structure)
    :gettable-instance-variables
    :settable-instance-variables
    :initable-instance-variables)

;---------------------------------------------

(defflavor correspondence
    (obj1 obj2
     (concept-mapping-list nil) ; The list of concept mappings underlying the
                                ; correspondence
     (accessory-concept-mapping-list nil)) ; This includes symmetric
                                           ; concept-mappings (e.g., if
                                           ; "rightmost -> leftmost" is in
					   ; the concept-mapping list, then
					   ; "leftmost -> rightmost will be
					   ; in the accessory concept-mapping
					   ; list.  Also, in the case of
					   ; correspondences between groups,
					   ; contains concept-mappings between
					   ; bond-categories and
					   ; bond-facets.
    (workspace-structure)
    :gettable-instance-variables
    :settable-instance-variables
    :initable-instance-variables)

;---------------------------------------------

(defflavor rule
  (object-category1 descriptor1-facet descriptor1
  (object-category2 nil) (descriptor2 nil)
  (replaced-description-type nil) (relation nil))
  (workspace-structure)
  :gettable-instance-variables
  :settable-instance-variables
  :initable-instance-variables)

; Here are two examples of how the rule instance can be set up:

; Example 1: for the rule "Replace rightmost letter by successor":
; OBJECT-CATEGORY1 = plato-letter
; (The object-category of the initial-string object that changed.)
; DESCRIPTOR1 = "rightmost".
; DESCRIPTOR1-FACET = plato-string-position-category
; (This is the facet of the letter that's being described by descriptor1
; in the rule, not its letter-category or its length or anything
; else.)
; REPLACED-DESCRIPTION-TYPE = letter-category
; (This  means that the rule is saying that "successor" refers to
; letter-category, not to any other facet of the two letters being
; related.)
; RELATION = plato-successor.
; (Since this is a "relation-rule", the other instance variables are
; ignored.)

; Example 2: for the rule "Replace C by D":
; OBJECT-CATEGORY1 = plato-letter
; DESCRIPTOR1-FACET = plato-letter-category
; DESCRIPTOR1 = plato-c
; OBJECT-CATEGORY2 = plato-letter
; REPLACED-DESCRIPTION-TYPE = plato-letter-category
; DESCRIPTOR2 = plato-d

;---------------------------------------------

(defflavor letter
    ()
    (workspace-object)
    :gettable-instance-variables
    :settable-instance-variables
    :initable-instance-variables)

;---------------------------------------------
