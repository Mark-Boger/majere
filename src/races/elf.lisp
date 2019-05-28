(in-package :majere)

(define-race elf ()
             (:bonuses (:dexterity 2))
             (:alignment (chaotic good))
             (:traits (:trance
                       :darkvision))
             (:advantages :charmed)
             (:immunities :sleep)
             (:saving-throws (:perception))
             (:languages (:common
                          :elvish)))
