(uiop:define-package :majere/src/races/gnome
    (:use #:cl)
  (:import-from :majere/src/races/race #:define-race)
  (:export #:gnome))

(in-package :majere/src/races/gnome)

(define-race gnome ()
             (:bonuses (:intelligence 2))
             (:alignment (:lawful :good))
             (:size :small)
             (:speed 25)
             (:traits (:darkvision
                       :gnome-cunning)))
