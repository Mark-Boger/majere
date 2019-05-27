(in-package :majere)

(define-race dwarf ()
             (:size :medium)
             (:move-speed 25)
             (:languages (:common
                          :dwarvish))
             ;; (behaviour destination)
             (:alignment (lawful good))
             ;; Should take either the long or short name for the bonuses
             ;; ALIST (stat bonus)
             (:bonuses (:constitution 2))
             ;; <trait> | (<trait>...)
             (:traits :darkvision)
             ;; For advantage and disadvantages
             ;; <damage type> | (<damage type>...)
             (:advantages :poison)
             ;; Just a list of weapons that the character will be proficient in
             (:weapons (:battleaxe
                        :handaxe
                        :light-hammer
                        :warhammer))
             ;; Just a list of tools that the character will be profiecient in
             (:tools (:smith-tools
                      :brewer-supplies
                      :mason-tools))
             ;; ALIST of the form (throw-type :advantage | :disadvantage | :immune)
             (:saving-throws (:poison :advantage))
             ;; List of the form `'modifier type | (skill constraint function)`'
             (:skill-checks (:intelligence
                             (:history :stonework #'function))))

(define-race hill-dwarf (dwarf)
             ;; Same syntax as methods only the ((o hill-dwarf) is already supplied)
             ;; so the generation will be something like
             ;; (defmethod leve-up <:around | :before | :after>
             ;;    ((object-name hill-dwarf) &rest args) &body)
             (:level-up (object-name something)
                        #'function)
             (:bonuses (:wisdom 1)))

(define-race mountain-dwarf (dwarf)
             (:bonuses (:strength 2))
             (:armor (:light
                      :medium)))
