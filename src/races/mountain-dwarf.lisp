(uiop:define-package :majere/src/races/mountain-dwarf
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:import-from #:majere/src/races/dwarf #:dwarf)
  (:export #:mountain-dwarf
           #:make-mountain-dwarf))

(in-package :majere/src/races/mountain-dwarf)

(define-race mountain-dwarf (dwarf)
             (:bonuses (:strength 2))
             (:armor (:light
                      :medium)))
