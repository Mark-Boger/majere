(uiop:define-package :majere/src/races/human
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:export #:human
           #:make-human))

(in-package :majere/src/races/human)

(define-race human ()
             (:bonuses ((:strength 1)
                        (:dexterity 1)
                        (:constitution 1)
                        (:intelligence 1)
                        (:wisdom 1)
                        (:charisma 1)))
             (:alignment (:neutral :neutral))
             (:size :medium)
             (:languages (:common
                          :choose)))
