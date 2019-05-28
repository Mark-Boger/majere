(uiop:define-package :majere/src/types
    (:use #:cl)
  (:export #:good
           #:neutral
           #:evil
           #:lawful
           #:chaotic
           #:alignment
           #:size
           #:throw-modifier))

(in-package :majere/src/types)

(defvar +morality+ '(:good :neutral :evil))

(defvar +order+ '(:lawful :neutral :chaotic))

(defvar +sizes+ '(:tiny
                  :small
                  :medium
                  :large
                  :huge
                  :gargantuan))

(defvar +throw-modifiers+ '(:advantage
                            :disadvantage
                            :immune))

(defmacro define-majere-type (type-name (pass) &body body)
  (let ((predicate (alexandria:symbolicate type-name '-p)))
    `(progn
       (defun ,predicate (,pass)
         ,@body)
       (deftype ,type-name ()
         (let ((predicate  ',predicate))
           `(satisfies ,predicate))))))

(define-majere-type alignment (a)
  (and (member (car a) +order+) (member (cadr a) +morality+)))

(define-majere-type size (a)
  (member a +sizes+))

(define-majere-type throw-modifier (a)
  (member a +throw-modifiers+))
