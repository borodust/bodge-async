(cl:in-package :uv)


(define-foreign-library libuv
  (:darwin "libuv.dylib.bodged")
  (:unix "libuv.so.bodged")
  (:windows "libuv.dll.bodged"))
