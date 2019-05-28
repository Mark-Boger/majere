(uiop:define-package :majere/src/races/dwarf
    (:use #:cl)
  (:import-from #:majere/src/races/race #:define-race)
  ;; You can't be just a dwarf so you aren't allowed to make just a dwarf
  (:export #:dwarf))

(in-package :majere/src/races/dwarf)


(define-race dwarf ()
             (:size :medium)
             (:move-speed 25)
             (:languages (:common
                          :dwarvish))
             ;; (behaviour destination)
             (:alignment (:lawful :good))
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
             ;; List of the form `'modifier type | (skill constraint function)`'
             (:skill-checks (:intelligence
                             (:history :stonework #'function))))
