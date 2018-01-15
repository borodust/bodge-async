(asdf:defsystem bodge-async
  :description "Wrapper over libuv for cl-bodge system"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria cffi claw)
  :serial t
  :components ((:module spec)
               (:static-file "bodge_async.h")
               (:file "packages")
               (:file "libuv")
               (:file "claw")))
