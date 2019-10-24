(asdf:defsystem :bodge-uv
  :description "Wrapper over libuv"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :defsystem-depends-on (:trivial-features)
  :depends-on (:uiop :alexandria :cffi :cffi-c-ref :claw :claw-utils)
  :pathname "src/"
  :serial t
  :components ((:file "packages")
               (:file "claw")
               (:module :spec)
               (:module :uv-includes :pathname "lib/uv/include/")))
