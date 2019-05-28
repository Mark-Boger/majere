(in-package :majere)

(define-race hill-dwarf (dwarf)
             ;; Same syntax as methods only the ((o hill-dwarf) is already supplied)
             ;; so the generation will be something like
             ;; (defmethod leve-up <:around | :before | :after>
             ;;    ((object-name hill-dwarf) &rest args) &body)
             (:level-up (object-name something)
                        #'function)
             (:bonuses (:wisdom 1)))
