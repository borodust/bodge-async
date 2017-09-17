(cl:in-package :uv)


(bodge-autowrap:c-include "bodge_async.h" :bodge-async
  :package :%uv
  :include-sources ("uv\\.h")
  :include-definitions ("^uv_(?!_|buf_init).*$")
  :symbol-exceptions (("getaddrinfo" platform-getaddrinfo)
                      ("freeaddrinfo" platform-freeaddrinfo)
                      ("gid_t" platform-gid-t)
                      ("uid_t" platform-uid-t)
                      ("sem_t" platform-sem-t))
  :symbol-regex (("(uv|UV)_\\w*" 3)))
