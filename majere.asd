;;;; majere.asd

(asdf:defsystem #:majere
  :description "Describe majere here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:mcclim
               #:alexandria
               #:closer-mop)
  :pathname "src/"
  :components ((:file "package")
               (:file "majere")))

(asdf:defsystem #:majere/characters
  :serial t
  :pathname "src/characters/"
  :components ((:file "package")
               (:file "character")))
