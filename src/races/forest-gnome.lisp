(uiop:define-package :majere/src/races/forest-gnome
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:import-from #:majere/src/races/gnome #:gnome)
  (:export #:forest-gnome
           #:make-forest-gnome))

(in-package :majere/src/races/forest-gnome)

(define-race forest-gnome (gnome)
             (:bonuses (:dexterity 1))
             (:spells (:minor-illusion :intelligence))
             (:traits (:speak-with-small-beasts)))
