;;;; majere.asd

(asdf:defsystem #:majere
  :description "Describe majere here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :depends-on (#:mcclim
               #:alexandria
               #:closer-mop)
  :pathname "src/"
  :components ((:file "package")
               (:file "majere" :depends-on ("package"))
               (:file "types" :depends-on ("package"))
               (:module classes
                :components ((:file "class")))
               (:module characters
                :components ((:file "character")))
               (:module races
                :components ((:file "race")
                             (:file "dwarf" :depends-on ("race"))
                             (:file "hill-dwarf" :depends-on ("dwarf"))
                             (:file "mountain-dwarf" :depends-on ("dwarf"))
                             (:file "elf" :depends-on ("race"))
                             (:file "high-elf" :depends-on ("elf"))
                             (:file "wood-elf" :depends-on ("elf"))
                             (:file "drow" :depends-on ("elf"))
                             (:file "dragonborn" :depends-on ("race"))
                             (:file "human" :depends-on ("race"))
                             (:file "gnome" :depends-on ("race"))
                             (:file "rock-gnome" :depends-on ("gnome"))
                             (:file "forest-gnome" :depends-on ("gnome"))))))


