(uiop:define-package :majere/src/majere
    (:nicknames :majere)
  (:use #:cl)
  (:use-reexport
   :majere/src/types
   :majere/src/characters/character
   :majere/src/classes/class
   :majere/src/races/race
   :majere/src/races/dragonborn
   :majere/src/races/drow
   :majere/src/races/dwarf
   :majere/src/races/elf
   :majere/src/races/forest-gnome
   :majere/src/races/gnome
   :majere/src/races/high-elf
   :majere/src/races/hill-dwarf
   :majere/src/races/human
   :majere/src/races/mountain-dwarf
   :majere/src/races/rock-gnome
   :majere/src/races/wood-elf))
