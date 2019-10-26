(cl:defpackage :uv
  (:use))

(uiop:define-package :%uv
  (:use))

(uiop:define-package :%%uv
  (:use))


(claw:defwrapper (uv::bodge-uv
                  (:headers "uv.h")
                  (:includes :uv-includes)
                  (:windows-environment "msvc")
                  (:include-definitions "^uv_\\w*"))
  :in-package :%uv
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :with-adapter (:static "lib/adapter.c")
  :override-types ((:string claw-utils:claw-string)
                   (:pointer claw-utils:claw-pointer))
  :symbolicate-names (:in-pipeline
                      (:by-removing-prefixes "uv_" "UV_")
                      (:if-none-matched
                       (:only-for :type
                                  (:switch-package :%%uv)))))
