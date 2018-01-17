(claw:c-include "bodge_async.h" :bodge-async
  :in-package :%uv
  :include-sources ("uv\\.h")
  :include-definitions ("^uv_(?!_|buf_init).*$"
                        "^ssize_t$")
  :rename-symbols (claw:in-pipeline
                   (claw:by-changing "getaddrinfo" 'platform-getaddrinfo)
                   (claw:by-changing "freeaddrinfo" 'platform-freeaddrinfo)
                   (claw:by-changing "gid_t" 'platform-gid-t)
                   (claw:by-changing "uid_t" 'platform-uid-t)
                   (claw:by-changing "sem_t" 'platform-sem-t)
                   (claw:by-removing-prefixes "uv_" "UV_")))
