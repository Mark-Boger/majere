(in-package :majere)

(define-race human ()
             (:bonuses ((:strength 1)
                        (:dexterity 1)
                        (:constitution 1)
                        (:intelligence 1)
                        (:wisdom 1)
                        (:charisma 1)))
             (:alignment (neutral neutral))
             (:size :medium)
             (:languages (:common
                          :choose)))
