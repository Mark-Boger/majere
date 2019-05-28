(uiop:define-package :majere/src/races/rock-gnome
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:import-from #:majere/src/races/gnome #:gnome)
  (:export #:rock-gnome
           #:make-rock-gnome))

(in-package :majere/src/races/rock-gnome)

(define-race rock-gnome (gnome)
             (:bonuses (:constitution 1))
             (:traits (:artificers-lore
                       :tinker)))
