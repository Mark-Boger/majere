(uiop:define-package :majere/src/races/dragonborn
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:export #:dragonborn
           #:make-dragonborn))

(in-package :majere/src/races/dragonborn)

(define-race dragonborn ()
             (:bonuses ((:strength 2)
                        (:charisma 1)))
             (:alignment (:lawful :good))
             (:traits (:draconic-ancestry))
             (:languages (:common
                          :draconic)))
