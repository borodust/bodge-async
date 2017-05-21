(in-package :uv)


(define-foreign-library libuv
  (:darwin "libuv.1.dylib")
  (:unix "libuv.so.1")
  (:windows "libuv.dll"))

(use-foreign-library libuv)
