(claw:c-include "bodge_async.h" :bodge-async
  :in-package :%uv
  :sysincludes (:uv-includes)
  :include-definitions ("^uv_\\w*")
  :rename-symbols (claw:in-pipeline
                   (claw:by-changing "getaddrinfo" 'platform-getaddrinfo)
                   (claw:by-changing "freeaddrinfo" 'platform-freeaddrinfo)
                   (claw:by-changing "gid_t" 'platform-gid-t)
                   (claw:by-changing "buf_t" 'platform-buf-t)
                   (claw:by-changing "uid_t" 'platform-uid-t)
                   (claw:by-changing "sem_t" 'platform-sem-t)
                   (claw:by-removing-prefixes "uv_" "UV_")))
