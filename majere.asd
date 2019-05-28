;;;; majere.asd

(asdf:defsystem "majere"
  :class asdf:package-inferred-system
  :description "D&D management system"
  :author "Mark Boger <93mar.bog@gmail.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :depends-on (:closer-mop
               :mcclim
               :majere/interface/all
               :majere/src/majere))

(asdf:register-system-packages "majere/interface/all" '(:majere-interface))
(asdf:register-system-packages "majere/src/majere" '(:majere))
;; (asdf:register-system-packages "majere/test/all" '(:majere-test))
