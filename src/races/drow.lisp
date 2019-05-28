(uiop:define-package :majere/src/races/drow
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:import-from #:majere/src/races/elf #:elf)
  (:export #:drow
           #:make-drow))

(in-package :majere/src/races/drow)

(define-race drow (elf)
             (:bonuses (:charisma 1))
             (:alignment (:chaotic :evil))
             (:traits (:superior-darkvision
                       :sunlight-sensitivity))
             (:spells ((:dancing-lights 1 :charisma)
                       (:faerie-fire 3 :charisma)
                       (:darkness 5 :charisma)))
             (:weapons (:rapiers
                        :shortsword
                        :hand-crossbow)))
