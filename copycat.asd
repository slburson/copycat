

(asdf:defsystem Copycat
  :description "Melanie Mitchell's Copycat analogy model."
  :author "Melanie Mitchell"
  :version "1.0.0"
  :depends-on (:closer-mop)
  :serial t
  :components
  ((:module "src"
    :serial t
    :components ((:file "defs")
		 (:file "graphics-stubs")
		 (:file "util")
		 (:file "defflavors")
		 (:file "constants")
		 (:file "workspace")
		 (:file "workspace-structures")
		 (:file "workspace-strings")
		 (:file "workspace-objects")
		 (:file "initialization")
		 (:file "run")
		 (:file "slipnet-def")
		 (:file "slipnet-links")
		 (:file "slipnet-functions")
		 (:file "descriptions")
		 (:file "bonds")
		 (:file "groups")
		 (:file "concept-mappings")
		 (:file "correspondences")
		 (:file "replacements")
		 (:file "breakers")
		 (:file "coderack")
		 (:file "rule")
		 (:file "answer")
		 (:file "workspace-object-formulas")
		 (:file "workspace-structure-formulas")
		 (:file "formulas")
		 (:file "copystat")))))
