(uiop:define-package :majere/src/races/elf
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:export #:elf))

(in-package :majere/src/races/elf)

(define-race elf ()
             (:bonuses (:dexterity 2))
             (:alignment (:chaotic :good))
             (:traits (:trance
                       :darkvision))
             (:advantages :charmed)
             (:immunities :sleep)
             (:saving-throws (:perception))
             (:languages (:common
                          :elvish)))
