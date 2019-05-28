(in-package :majere)

(define-race wood-elf (elf)
             (:bonuses (:wisdom 1))
             (:weapons (:longsword
                        :shortsword
                        :shortbow
                        :longbow))
             (:move-speed 35)
             (:traits (:mask-of-the-wild)))
