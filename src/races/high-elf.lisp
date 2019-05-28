(in-package :majere)

(define-race high-elf (elf)
             (:bonuses (:intelligence 1))
             (:weapons (:longsword
                        :shortsword
                        :shortbow
                        :longbow))
             (:spells (:choose :cantrip :wizard))
             (:languages (:choose)))
