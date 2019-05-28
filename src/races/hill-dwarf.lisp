(uiop:define-package :majere/src/races/hill-dwarf
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  (:import-from #:majere/src/races/dwarf #:dwarf)
  (:export #:hill-dwarf
           #:make-hill-dwarf))

(in-package :majere/src/races/hill-dwarf)

(define-race hill-dwarf (dwarf)
             ;; Same syntax as methods only the ((o hill-dwarf) is already supplied)
             ;; so the generation will be something like
             ;; (defmethod leve-up <:around | :before | :after>
             ;;    ((object-name hill-dwarf) &rest args) &body)
             (:level-up (object-name something)
                        #'function)
             (:bonuses (:wisdom 1)))
