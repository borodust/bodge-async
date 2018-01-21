(asdf:defsystem bodge-async
  :description "Wrapper over libuv for cl-bodge system"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria cffi claw)
  :serial t
  :components ((:static-file "bodge_async.h")
               (:file "packages")
               (:file "libuv")
               (:file "claw")
               (:module spec)
               (:module uv-includes :pathname "lib/uv/include/")))
