;; Defines the top level class for D&D playable races
(uiop:define-package :majere/src/races/race
    (:use #:cl
          #:majere/src/types)
  (:nicknames :majere-race)
  (:export #:majere-race
           #:define-race))

(in-package :majere/src/races/race)

(defvar +default-race-speed+ 30
  "Most common default move speed for races")
(defvar +default-race-size+ :medium
  "Most common default size for races")
(defvar +default-race-alignment+ '(:neutral :neutral)
  "An arbitrary default alignment")

(defclass majere-race ()
  ((%bonuses :initarg :bonuses
             :accessor bonuses
             :initform ()
             :type alist)
   (%alignment :initarg :alignment
               :accessor alignment
               :initform +default-race-alignment+
               :type alignment)
   (%size :initarg :size
          :accessor size
          :initform +default-race-size+
          :type size)
   (%speed :initarg :move-speed
           :accessor move-speed
           :initform +default-race-speed+
           :type integer)
   (%traits :initarg :traits
            :accessor traits
            :initform ()
            :type list)
   (%weapons :initarg :weapons
             :accessor weapons
             :initform ()
             :type list)
   (%tools :initarg :tools
           :accessor tools
           :initform ()
           :type list)
   (%advantages :initarg :advantages
                :accessor advantages
                :initform ()
                :type list)
   (%disadvantages :initarg :disadvantages
                   :accessor disadvantages
                   :initform ()
                   :type list)
   (%immunities :initarg :immunities
                :accessor immunities
                :initform ()
                :type list)
   (%spells :initarg :spells
            :accessor spells
            :initform ()
            :type list)
   (%armor :initarg :armor
           :accessor armor
           :initform ()
           :type list)
   (%languages :initarg :languages
               :accessor languages
               :initform ()
               :type list)))

(defmacro define-race (name (&optional (parent-race 'majere-race)) &rest specs)
  "Define a new race named NAME that inherits information from the PARENT-RACE.
The passed SPECS are used to define how the PARENT-RACE's information is combined
and transformed. The magic symbol :choose allows you to chooose a valid option from
the types that are specified for the SPEC form.

Defined SPEC forms:
:bonuses       - Bonuses to saving throws (<stat> <amount>) | ((<stat> <amount>))
:alignment     - Base alignment for the race, must be of type 'alignment' defined in type.lisp
:size          - Base size for the race, must be of type 'size' defined in type.lisp
:move-speed    - Integer that describes the base speed of the race
:traits        - Traits the race provides  <trait> | (<trait>)
:advantages    - The saving throws with advantage <damage type> | (<damage type>)
:disadvantages - Saving throws with disadvantages <damage type> | (<damage type>)
:immunities    - Damage types this race is immune to <damage type> | (<damage type>)
:weapons       - Weapons the race has proficiency in <weapon> | (<weapon>)
:tools         - Tools the race has proficiency in <tool> | (<tool>)
:skill-checks  - Auto generic functions for skill rolls (<type> [<conditional>] &body body)
TODO: Fill in event generics"
  ;; Make sure the parent is ready to be inspected
  (unless (closer-mop:class-finalized-p (find-class parent-race))
    (closer-mop:ensure-finalized (find-class parent-race)))
  (flet ((spec-element (initarg)
           (cadr (assoc initarg specs)))
         ;; Handles the slots that should be replaced if they're defined in SPECS.
         ;; When SPEC-ELEMENT is defined it is preferred over the PARENT-ELMENT.
         ;; The TYPE of the SPEC-ELEMENT must match the passed TYPE.
         (maybe-replace-slot (type parent-element spec-element)
           (unless (or (typep spec-element type) (null spec-element))
             (error "~s does not match type ~s" spec-element type))
           (let ((element (if spec-element
                              spec-element
                              parent-element)))
             ;; TODO: Find a better way to do this
             (if (listp spec-element)
                 ;; If we're already quoted don't double quote
                 (if (and (listp element) (eq (first element) 'quote))
                     element
                     `',element)
                 element)))
         ;; TODO: Fix so that it actually checks that things are alists.
         ;; Honestly this doesn't really make sure that things are alists so use
         ;; in good faith.
         ;; Slots that are alist form. If the PARENT-SPEC does not exist the
         ;; SPEC-ELEMENT is put into a list and returned otherwise the
         ;; SPEC-ELEMENT is added to the PARENT-SPEC list and returned.
         (alist-slot (parent-element spec-element)
           (cond
             ((and (null parent-element) (listp spec-element))
              (if (listp (car spec-element))
                  `',spec-element
                  `',(list spec-element)))
             ((and parent-element (null spec-element))
              `',parent-element)
             ((and (listp parent-element) (listp spec-element) (listp (car spec-element)))
              ;; (cadr parent-element) handles the (quote ...)
              `',(append spec-element (cadr parent-element)))
             ((and (listp parent-element) (listp spec-element) (atom (car spec-element)))
              `',(cons spec-element (cadr parent-element)))))
         ;; Slots that are lists.
         ;; Adds SPEC-ELEMENT to the PARENT-ELEMENT if the PARENT-ELEMENT exists
         ;; otherwise make SPEC-ELEMENT a list and return.
         (list-slot (parent-element spec-element)
           (cond
             ((and (null parent-element) (null spec-element)) nil)
             ((and (null parent-element) spec-element)
              (if (listp spec-element)
                  `',spec-element
                  `',(list spec-element)))
             ((and parent-element (null spec-element))
              `,parent-element)
             ((and (listp parent-element) (listp spec-element))
              `',(append spec-element (cadr parent-element)))
             ((and (listp parent-element) (atom spec-element))
              `',(append (list spec-element) (cadr parent-element)))
             ((and (atom parent-element) (listp spec-element))
              `',(append spec-element (list parent-element)))
             (t (error "Unrecognized forms ~a ~a" parent-element spec-element)))))
    (let* ((race-name (alexandria:symbolicate 'make- name))
           (parent-slots (closer-mop:class-slots (find-class parent-race)))
           (saving-throws (spec-element :saving-throws))
           (skill-checks (spec-element :skill-checks))
           (new-slots (mapcar (lambda (slot)
                                (let* ((slot-name (closer-mop:slot-definition-name slot))
                                       (initarg (first
                                                 (closer-mop:slot-definition-initargs slot)))
                                       (accessor-name (alexandria:symbolicate
                                                       (symbol-name initarg)))
                                       (initform (closer-mop:slot-definition-initform slot))
                                       (slot-type (closer-mop:slot-definition-type slot))
                                       (spec-element (spec-element initarg)))
                                  (list
                                   slot-name
                                   initarg
                                   accessor-name
                                   (case slot-type
                                     (alist (alist-slot initform spec-element))
                                     (list (list-slot initform spec-element))
                                     (t
                                      (maybe-replace-slot slot-type
                                                          initform
                                                          spec-element)))
                                   slot-type)))
                              parent-slots)))
      (declare (ignore saving-throws skill-checks))
      `(progn
         (defclass ,name (,parent-race)
           ,(mapcar (lambda (slot-info)
                      `(,(first slot-info)
                        :initarg ,(second slot-info)
                        :accessor ,(third slot-info)
                        :initform ,(fourth slot-info)
                        :type ,(fifth slot-info)))
             new-slots))
         ;; This will repeat the definitions of the default params but
         ;; I'm okay with that because it alows a person to call (make-instance '<class>)
         ;; and allow the convenience of (make-<class>) and still have the defaults
         ;; and you have the class types. Sooo eh.
         (defun ,race-name (&key ,@(mapcar (lambda (slot-info)
                                             `(,(third slot-info) ,(fourth slot-info)))
                                           new-slots))
           ,(format nil "Create an instance of the ~a race." name)
           (make-instance ',name ,@(loop :for (name arg accessor initform) :in new-slots
                                         :collect arg
                                         :collect accessor)))))))
