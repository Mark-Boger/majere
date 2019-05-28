(uiop:define-package :majere/src/races/wood-elf
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:import-from #:majere/src/races/elf #:elf)
  (:export #:wood-elf
           #:make-wood-elf))

(in-package :majere/src/races/wood-elf)

(define-race wood-elf (elf)
             (:bonuses (:wisdom 1))
             (:weapons (:longsword
                        :shortsword
                        :shortbow
                        :longbow))
             (:move-speed 35)
             (:traits (:mask-of-the-wild)))
