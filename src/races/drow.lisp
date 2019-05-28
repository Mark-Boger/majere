(in-package :majere)

(define-race drow (elf)
             (:bonuses (:charisma 1))
             (:alignment (chaotic evil))
             (:traits (:superior-darkvision
                       :sunlight-sensitivity))
             (:spells ((:dancing-lights 1 :charisma)
                       (:faerie-fire 3 :charisma)
                       (:darkness 5 :charisma)))
             (:weapons (:rapiers
                        :shortsword
                        :hand-crossbow)))
