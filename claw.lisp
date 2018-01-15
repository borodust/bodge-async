(claw:c-include "bodge_async.h" :bodge-async
  :package :%uv
  :include-sources ("uv\\.h")
  :include-definitions ("^uv_(?!_|buf_init).*$"
                        "^ssize_t$")
  :symbol-exceptions (("getaddrinfo" platform-getaddrinfo)
                      ("freeaddrinfo" platform-freeaddrinfo)
                      ("gid_t" platform-gid-t)
                      ("uid_t" platform-uid-t)
                      ("sem_t" platform-sem-t))
  :symbol-prefix ("uv_" "UV_"))
