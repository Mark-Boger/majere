(uiop:define-package :majere/src/classes/class
    (:use #:cl)
  (:export #:majere-class))

(in-package :majere/src/classes/class)

(defclass majere-class ()
  ((%name :initarg :name
          :accessor name
          :initform (error "A class must have a name"))
   (%hit-die :initarg :hit-die
             :accessor hit-die
             :initform ())
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
