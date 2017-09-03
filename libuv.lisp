(in-package :uv)


(define-foreign-library libuv
  (:darwin (:or "libuv.1.dylib" "libuv.dylib"))
  (:unix (:or "libuv.so.1" "libuv.so"))
  (:windows "libuv.dll"))

(use-foreign-library libuv)
