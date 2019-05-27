;; Anything that has to do with a characters goes in here
(in-package #:majere)

(defclass majere-character ()
  ((%name :initarg :name
          :accessor name
          :initform (error "Characters must have a name"))
   (%race :initarg :race
          :initform (error "Characters must have a race")
          :accessor race)
   (%hit-point-maximum :initarg :hp-max
                       :accessor hp-max)
   (%current-hit-points :initarg :hp
                        :accessor hp
                        :initform 0)
   (%proficiency-bonus :initarg :proficiency
                       :accessor proficiency
                       :initform 2)
   (%death-saving-throws :accessor death-saving-throws
                         :initform '(0 0))
   (%level :initarg :level
           :accessor level
           :initform 1)
   (%xp :initarg :xp
        :accessor xp
        :initform 0)
   (%ac :initarg :ac
        :accessor ac
        :initform 0)
   (%alignment :initarg :alignment
               :accessor alignment
               :initform 'true-neutral)
   ;; Stats - Modifiers are (floor (- stat 10) 2)
   (%strength :initarg :str
              :accessor str
              :initform '(0 -5))
   (%dexterity :initarg :dex
               :accessor dex
               :initform '(0 -5))
   (%constitution :initarg :con
                  :accessor con
                  :initform '(0 -5))
   (%intelligence :initarg :int
                  :accessor int
                  :initform '(0 -5))
   (%wisdom :initarg :wis
            :accessor wis
            :initform  '(0 -5))
   (%charisma :initarg :cha
              :accessor cha
              :initform '(0 -5))
   (%carry-capacity :accessor cp)
   (%spells :initarg :spells
            :accessor spells
            :initform ())
   (%actions :initarg :actions
             :accessor actions
             :initform ())
   (%conditions :initarg :conditions
                :accessor conditions
                :initform ())
   (%inventory :initarg :inventory
               :accessor inventory)
   (%background :initarg :background
                :accessor background)
   (%description :initarg :description
                 :accessor description
                 :initform "")))



(defclass majere-class ()
  ((%name :initarg :name
          :accessor name
          :initform (error "A class must have a name"))
   (%hit-die :initform :hit-die
             :accessor hit-die
             :initform 0)
   (%hit-dice :initarg :hit-dice
              :accessor hit-dice
              :initform 1)
   (%features :initarg :features
              :accessor features
              :initform ())
   (%weapons :initarg :weapons
             :accessor weapons
             :initform ())
   (%saving-throws :initarg :saving-throws
                   :accessor saving-throws
                   :initform ())))

(defclass majere-invetory ()
  ((%weight :initarg :weight
            :accessor weight
            :initform 0)
   (%platnum :initarg :platnum
             :accessor platnum
             :initform 0)
   (%gold :initarg :gold
          :accessor gold
          :initform 0)
   (%electrum :initarg :electrum
              :accessor electrum
              :initform 0)
   (%silver :initarg :silver
            :accessor silver
            :initform 0)
   (%copper :initarg :copper
            :accessor copper
            :initform 0)
   ;; Probably going to be replaced
   (%content :initarg :content
             :accessor content
             :initform ())))
