(uiop:define-package :majere/src/races/high-elf
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:import-from #:majere/src/races/elf #:elf)
  (:export #:high-elf
           #:make-high-elf))

(in-package :majere/src/races/high-elf)

(define-race high-elf (elf)
             (:bonuses (:intelligence 1))
             (:weapons (:longsword
                        :shortsword
                        :shortbow
                        :longbow))
             (:spells (:choose :cantrip :wizard))
             (:languages (:choose)))
