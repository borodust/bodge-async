(in-package :cl-user)

(defpackage :bodge-async.def
  (:use :cl :asdf))

(in-package :bodge-async.def)


(defsystem bodge-async
  :description "Wrapper over libuv for cl-bodge system"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria cffi)
  :serial t
  :components ((:file "packages")
               (:file "libuv")))
